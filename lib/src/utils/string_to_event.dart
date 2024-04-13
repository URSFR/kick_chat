import 'package:kick_chat/kick_chat.dart';

TypeEvent? stringToEvent (String s) {
  switch(s) {
    case 'App\\Events\\FollowersUpdated':
      return TypeEvent.followersUpdated;
    case 'App\\Events\\ChatMessageEvent':
      return TypeEvent.message;
    default:
      return null;
  }
}