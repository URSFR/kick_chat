import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kick_chat/src/kick_chat.dart';
import 'package:kick_chat/src/chat_message/kick_message.dart';
import 'package:kick_chat/src/event_parser.dart';


void main() {
  test('Listen to a random Kick chat', () async {
    KickChat chat = KickChat('xqc');
    chat.connect();
    chat.chatStream.listen((message) {
      final KickMessage? kickMessage = eventParser(message);
      if (kDebugMode) {
        print(kickMessage);
      }
    });
    await Future.delayed(const Duration(seconds: 300), () {});
  });

}
