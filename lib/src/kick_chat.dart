import 'dart:async';
import 'package:universal_io/io.dart';

import 'package:api_7tv/api_7tv.dart';
import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:flutter/foundation.dart';
import 'package:kick_chat/kick_chat.dart';
import 'package:web_socket_channel/io.dart';

class KickChat {
  String username;

  IOWebSocketChannel? _webSocketChannel;
  StreamSubscription? _streamSubscription;

  KickUser? userDetails;
  List seventvEmotes = [];

  Function()? onDone;
  final Function? onError;

  final StreamController _chatStreamController = StreamController.broadcast();
  Stream get chatStream => _chatStreamController.stream;

  KickChat(
    this.username, {
    this.onDone,
    this.onError,
  });

  static Future init() async {
    await FkUserAgent.init();
  }

  Future<void> connect() async {
    userDetails = await KickApi.getUserDetails(username);
    if (userDetails == null) {
      return;
    }

    // get channel 7tv emotes
    List result = await SeventvApi.getKickChannelEmotes(userDetails!.userId.toString()) ?? [];
    seventvEmotes.addAll(result);

    _webSocketChannel = IOWebSocketChannel.connect(
        "wss://ws-us2.pusher.com/app/eb1d5f283081a78b932c?protocol=7&client=js&version=7.6.0&flash=false");
    _webSocketChannel?.sink.add(
        '{"event":"pusher:subscribe","data":{"auth":"","channel":"channel.${userDetails!.id}"}}');
    _webSocketChannel?.sink.add(
        '{"event":"pusher:subscribe","data":{"auth":"","channel":"chatrooms.${userDetails!.chatRoom.id}.v2"}}');

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
    debugPrint("Kick Chat: Connection closed");
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
