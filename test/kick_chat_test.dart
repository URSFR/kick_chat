import 'package:flutter_test/flutter_test.dart';
import 'package:kick_chat/src/kick_chat.dart';


void main() {
  test('Listen to a random Kick chat', () async {
    KickChat chat = KickChat('4313893');
    chat.connect();
    await Future.delayed(const Duration(seconds: 30), () {});
  });

}
