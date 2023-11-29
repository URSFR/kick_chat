import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kick_chat/src/kick_chat.dart';
import 'package:kick_chat/src/events/kick_message.dart';
import 'package:kick_chat/src/event_parser.dart';
import 'package:kick_chat/src/kick_event.dart';


void main() {
  test('Listen to a random Kick chat', () async {
    KickChat chat = KickChat('668');
    chat.connect();
    chat.chatStream.listen((message) {
      final KickEvent? kickEvent = eventParser(message);
      if(kickEvent?.event == 'App\\Events\\ChatMessageEvent'){
        if (kDebugMode) {
          print(kickEvent as KickMessage);
        }
      }
    });
    await Future.delayed(const Duration(seconds: 300), () {});
  });

}
