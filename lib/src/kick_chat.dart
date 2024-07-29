import 'dart:async';
import 'package:api_7tv/api_7tv.dart';
import 'package:flutter/foundation.dart';
import 'package:kick_chat/kick_chat.dart';
import 'web_socket/web_socket_channel_stub.dart';

class KickChat {
  String username;

  dynamic _webSocketChannel;
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

  // static Future init() async {
  //   if(!Platform.isAndroid && !Platform.isIOS) {
  //     return;
  //   }
  //   await FkUserAgent.init();
  // }

  Future<void> connect() async {
    userDetails = await KickApi.getUserDetails(username);
    if (userDetails == null) {
      return;
    }

    // get channel 7tv emotes
    List result = await SeventvApi.getKickChannelEmotes(userDetails!.userId.toString()) ?? [];
    seventvEmotes.addAll(result);

    _webSocketChannel = PlatformWebSocketChannel.connect(
        "wss://ws-us2.pusher.com/app/32cbd69e4b950bf97679?protocol=7&client=js&version=7.6.0&flash=false");

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
