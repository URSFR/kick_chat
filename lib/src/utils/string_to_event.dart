import 'package:kick_chat/kick_chat.dart';

TypeEvent? stringToEvent(String s) {
  switch (s) {
    case 'App\\Events\\FollowersUpdated':
      return TypeEvent.followersUpdated;
    case 'App\\Events\\ChatMessageEvent':
      return TypeEvent.message;
    case 'App\\Events\\SubscriptionEvent':
      return TypeEvent.subscriptionEvent;
    case 'App\\Events\\ChatroomUpdatedEvent':
      return TypeEvent.chatroomUpdatedEvent;
    case 'App\\Events\\StreamHostEvent':
      return TypeEvent.streamHostEvent;
    case 'App\\Events\\UserBannedEvent':
      return TypeEvent.userBannedEvent;
    default:
      return null;
  }
}
