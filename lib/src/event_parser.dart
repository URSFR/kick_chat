import 'dart:convert';

import 'package:kick_chat/src/chat_message/kick_message.dart';

KickMessage? eventParser(String message) {
  Map<String, dynamic> jsonMessage = jsonDecode(message);
  switch (jsonMessage['event']){
    case 'App\\Events\\ChatMessageEvent':
    return KickMessage.fromJson(jsonMessage);
  }
  return null;
}