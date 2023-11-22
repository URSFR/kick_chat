import 'dart:convert';

import 'package:kick_chat/src/kick_message.dart';

KickMessage messageParser(String message) {
  Map<String, dynamic> jsonMessage = jsonDecode(message);
  return KickMessage.fromJson(jsonMessage);
}