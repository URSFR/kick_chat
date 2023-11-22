import 'package:flutter_test/flutter_test.dart';
import 'package:kick_chat/src/kick_chat.dart';
import 'package:kick_chat/src/kick_message.dart';
import 'package:kick_chat/src/message_parser.dart';


void main() {
  test('Listen to a random Kick chat', () async {
    KickChat chat = KickChat('4313893');
    chat.connect();
    chat.chatStream.listen((message) {
      final KickMessage kickMessage = messageParser(message);
      // if (kDebugMode) {
      //   print(kickMessage.event);
      // }
    });
    await Future.delayed(const Duration(seconds: 300), () {});
  });

}
