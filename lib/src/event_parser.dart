import 'dart:convert';

import 'package:kick_chat/src/events/kick_chatroom_update.dart';
import 'package:kick_chat/src/events/kick_followers_updated.dart';
import 'package:kick_chat/src/events/kick_message.dart';
import 'package:kick_chat/src/events/kick_stream_host.dart';
import 'package:kick_chat/src/events/kick_subscription.dart';
import 'package:kick_chat/src/events/kick_user_banned.dart';
import 'package:kick_chat/src/kick_event.dart';
import 'package:kick_chat/src/utils/string_to_event.dart';

KickEvent? eventParser(String message) {
  Map<String, dynamic> jsonMessage = jsonDecode(message);
  switch (stringToEvent(jsonMessage['event'])) {
    case TypeEvent.message:
      return KickMessage.fromJson(jsonMessage);
    case TypeEvent.followersUpdated:
      return KickFollowersUpdated.fromJson(jsonMessage);
    case TypeEvent.subscriptionEvent:
      return KickSubscription.fromJson(jsonMessage);
    case TypeEvent.streamHostEvent:
      return KickStreamHost.fromJson(jsonMessage);
    case TypeEvent.chatroomUpdatedEvent:
      return KickChatroomUpdated.fromJson(jsonMessage);
    case TypeEvent.userBannedEvent:
      return KickUserBanned.fromJson(jsonMessage);
    // case 'App\\Events\\StopStreamBroadcast':
    //   return null;
    // case 'App\\Events\\StreamerIsLive':
    //   return null;
    default:
      return null;
  }
}
