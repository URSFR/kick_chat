import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:kick_chat/src/kick_channel.dart';
import 'package:web_socket_channel/io.dart';

class KickChat {
  String channelName;
  String? chatroomId;

  IOWebSocketChannel? _webSocketChannel;
  StreamSubscription? _streamSubscription;
  Function()? onDone;
  final Function? onError;

  final StreamController _chatStreamController = StreamController.broadcast();
  Stream get chatStream => _chatStreamController.stream;

  KickChat(
    this.channelName, {
    this.onDone,
    this.onError,
  });

  Future<void> connect() async {

    KickChannel? channel = await KickChannel.getChannelInfo(channelName);

    if(channel == null) {
      return;
    }

    _webSocketChannel = IOWebSocketChannel.connect(
        "wss://ws-us2.pusher.com/app/eb1d5f283081a78b932c?protocol=7&client=js&version=7.6.0&flash=false");
    _webSocketChannel?.sink.add(
        '{"event":"pusher:subscribe","data":{"auth":"","channel":"chatrooms.${channel.chatroom.chatableId}.v2"}}');

    _streamSubscription = _webSocketChannel?.stream.listen(
      (data) => _chatListener(data),
      onDone: _onDone,
      onError: _onError,
    );
  }

  Future<void> close() async {
    await _webSocketChannel?.sink.close();
    await _streamSubscription?.cancel();
  }

  Future<void> _onDone() async {
    debugPrint("Twitch Chat: Connection closed");
    await close();
    if (onDone != null) {
      onDone!();
    }
  }

  void _onError(Object o, StackTrace s) {
    debugPrint(o.toString());
    debugPrint(s.toString());
    if (onError != null) {
      onError!();
    }
  }

  void _chatListener(String message) {
    _chatStreamController.add(message);
  }
}
