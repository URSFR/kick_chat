import 'dart:convert';

import 'package:kick_chat/src/events/kick_chatroom_update.dart';
import 'package:kick_chat/src/events/kick_followers_updated.dart';
import 'package:kick_chat/src/events/kick_message.dart';
import 'package:kick_chat/src/events/kick_stream_host.dart';
import 'package:kick_chat/src/events/kick_subscription.dart';
import 'package:kick_chat/src/kick_event.dart';
import 'package:kick_chat/src/utils/string_to_event.dart';

KickEvent? eventParser(String message) {
  Map<String, dynamic> jsonMessage = jsonDecode(message);
  switch (stringToEvent(jsonMessage['event'])) {
    case TypeEvent.message:
      return KickMessage.fromJson(jsonMessage);
    case TypeEvent.followersUpdated:
      // {"event":"App\\Events\\FollowersUpdated",
      // "data":"{\"followersCount\":31642,\"channel_id\":77528,\"username\":null,\"created_at\": ,\"followed\":true}",
      // "channel":"channel.77528"}
      return KickFollowersUpdated.fromJson(jsonMessage);
    case TypeEvent.subscriptionEvent:
      return KickSubscription.fromJson(jsonMessage);
    case TypeEvent.streamHostEvent:
      return KickStreamHost.fromJson(jsonMessage);
    case TypeEvent.chatroomUpdatedEvent:
      return KickChatroomUpdated.fromJson(jsonMessage);
    // case 'App\\Events\\GiftedSubscriptionsEvent':
    //   // {"event":"App\\Events\\GiftedSubscriptionsEvent",
    //   // "data":"{\"chatroom_id\":77526,\"gifted_usernames\":[\"Randy_Lahey\",\"818glass\",\"DeondreaJ\",\"sleepyeepy\",\"Rvss3ll\"],\"gifter_username\":\"zaddyzavid\"}",
    //   // "channel":"chatrooms.77526.v2"}
    //   return null;
    // case 'App\\Events\\UserBannedEvent':
    //   // {
    //   // "event": "App\\Events\\UserBannedEvent",
    //   // "data": "{\"id\":\"1e9246c2-b8e7-4579-9452-0b80e3a63a1b\",\"user\":{\"id\":23295152,\"username\":\"reflectiveflora\",\"slug\":\"reflectiveflora\"},\"banned_by\":{\"id\":0,\"username\":\"moderator\",\"slug\":\"moderator\"},\"expires_at\":\"2023-11-30T08:49:27+00:00\"}",
    //   // "channel": "chatrooms.668.v2"
    //   // }
    //   return null;
    // case 'App\\Events\\StopStreamBroadcast':
    //   return null;
    // case 'App\\Events\\StreamerIsLive':
    //   return null;
    default:
      return null;
  }
}
