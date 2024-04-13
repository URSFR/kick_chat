import 'dart:convert';

import 'package:kick_chat/src/events/kick_followers_updated.dart';
import 'package:kick_chat/src/events/kick_message.dart';
import 'package:kick_chat/src/kick_event.dart';
import 'package:kick_chat/src/utils/string_to_event.dart';

KickEvent? eventParser(String message) {
  Map<String, dynamic> jsonMessage = jsonDecode(message);
  switch (stringToEvent(jsonMessage['event'])){
    case TypeEvent.message:
      return KickMessage.fromJson(jsonMessage);
    case TypeEvent.followersUpdated:
      // {"event":"App\\Events\\FollowersUpdated",
      // "data":"{\"followersCount\":31642,\"channel_id\":77528,\"username\":null,\"created_at\": ,\"followed\":true}",
      // "channel":"channel.77528"}
      return KickFollowersUpdated.fromJson(jsonMessage);
    // case 'App\\Events\\ChannelSubscriptionEvent':
    //   //     {
    //   //     "event": "App\\Events\\ChannelSubscriptionEvent",
    //   //     "data": "{\"user_ids\":[4324031,3137455,1836271,18580770,21491033],\"username\":\"\",\"channel_id\":77528}",
    //   //     "channel": "channel.77528"
    //   // }
    //   return null;
    // case 'App\\Events\\GiftedSubscriptionsEvent':
    //   // {"event":"App\\Events\\GiftedSubscriptionsEvent",
    //   // "data":"{\"chatroom_id\":77526,\"gifted_usernames\":[\"Randy_Lahey\",\"818glass\",\"DeondreaJ\",\"sleepyeepy\",\"Rvss3ll\"],\"gifter_username\":\"zaddyzavid\"}",
    //   // "channel":"chatrooms.77526.v2"}
    //   return null;
    // case 'App\\Events\\GiftsLeaderboardUpdated':
    //   // {"event":"App\\Events\\GiftsLeaderboardUpdated",
    //   // "data":"{\"channel\":{\"id\":77528,\"user_id\":78345,\"slug\":\"suspendas\",\"is_banned\":false,\"playback_url\":\"https:\\/\\/fa723fc1b171.us-west-2.playback.live-video.net\\/api\\/video\\/v1\\/us-west-2.196233775518.channel.PIZSbTJUdWn9.m3u8\",\"name_updated_at\":null,\"vod_enabled\":true,\"subscription_enabled\":true,\"can_host\":true,\"chatroom\":{\"id\":77526,\"chatable_type\":\"App\\\\Models\\\\Channel\",\"channel_id\":77528,\"created_at\":\"2022-12-06T03:01:35.000000Z\",\"updated_at\":\"2023-11-29T06:00:37.000000Z\",\"chat_mode_old\":\"public\",\"chat_mode\":\"subscribers_only\",\"slow_mode\":true,\"chatable_id\":77528,\"followers_mode\":true,\"subscribers_mode\":false,\"emotes_mode\":false,\"message_interval\":5,\"following_min_duration\":300}},\"leaderboard\":[{\"user_id\":336124,\"username\":\"monkules\",\"quantity\":2171},{\"user_id\":22,\"username\":\"Eddie\",\"quantity\":776},{\"user_id\":739621,\"username\":\"kfcbelly\",\"quantity\":555},{\"user_id\":1420854,\"username\":\"GumBear\",\"quantity\":449},{\"user_id\":4623887,\"username\":\"CaseyJohnsen\",\"quantity\":425},{\"user_id\":2892,\"username\":\"Orko420\",\"quantity\":387},{\"user_id\":3049038,\"username\":\"DCMAN\",\"quantity\":318},{\"user_id\":166272,\"username\":\"conmango\",\"quantity\":310},{\"user_id\":341068,\"username\":\"hudiinii\",\"quantity\":262},{\"user_id\":1175692,\"username\":\"Main_Frame\",\"quantity\":261}],\"weekly_leaderboard\":[{\"user_id\":3049038,\"username\":\"DCMAN\",\"quantity\":5},{\"user_id\":129985,\"username\":\"alittlebits\",\"quantity\":3},{\"user_id\":22866185,\"username\":\"getIntoGameDev\",\"quantity\":2},{\"user_id\":371082,\"username\":\"B_Shep\",\"quantity\":2},{\"user_id\":1254267,\"username\":\"slickbela\",\"quantity\":1},{\"user_id\":1232679,\"username\":\"ProperHustler\",\"quantity\":1},{\"user_id\":10458734,\"username\":\"Outlaw78\",\"quantity\":1},{\"user_id\":2931600,\"username\":\"1dl3\",\"quantity\":1}],\"monthly_leaderboard\":[{\"user_id\":375862,\"username\":\"oceanofthc\",\"quantity\":110},{\"user_id\":20806242,\"username\":\"davso\",\"quantity\":55},{\"user_id\":2811614,\"username\":\"nuiva\",\"quantity\":21},{\"user_id\":3049038,\"username\":\"DCMAN\",\"quantity\":15},{\"user_id\":89343,\"username\":\"LaS_\",\"quantity\":12},{\"user_id\":129985,\"username\":\"alittlebits\",\"quantity\":10},{\"user_id\":18531,\"username\":\"joey10pack\",\"quantity\":10},{\"user_id\":10458734,\"username\":\"Outlaw78\",\"quantity\":8},{\"user_id\":1495219,\"username\":\"Nubbygaming\",\"quantity\":5},{\"user_id\":4239451,\"username\":\"Slippy151\",\"quantity\":5}],\"gifter_id\":709455,\"gifted_quantity\":5}",
    //   // "channel":"channel.77528"}
    //   return null;
    // case 'App\\Events\\LuckyUsersWhoGotGiftSubscriptionsEvent':
    //   // {"event":"App\\Events\\LuckyUsersWhoGotGiftSubscriptionsEvent",
    //   // "data":"{\"channel\":{\"id\":77528,\"user_id\":78345,\"slug\":\"suspendas\",\"is_banned\":false,\"playback_url\":\"https:\\/\\/fa723fc1b171.us-west-2.playback.live-video.net\\/api\\/video\\/v1\\/us-west-2.196233775518.channel.PIZSbTJUdWn9.m3u8\",\"name_updated_at\":null,\"vod_enabled\":true,\"subscription_enabled\":true,\"can_host\":true,\"chatroom\":{\"id\":77526,\"chatable_type\":\"App\\\\Models\\\\Channel\",\"channel_id\":77528,\"created_at\":\"2022-12-06T03:01:35.000000Z\",\"updated_at\":\"2023-11-29T06:00:37.000000Z\",\"chat_mode_old\":\"public\",\"chat_mode\":\"subscribers_only\",\"slow_mode\":true,\"chatable_id\":77528,\"followers_mode\":true,\"subscribers_mode\":false,\"emotes_mode\":false,\"message_interval\":5,\"following_min_duration\":300}},\"usernames\":[\"Randy_Lahey\",\"818glass\",\"DeondreaJ\",\"sleepyeepy\",\"Rvss3ll\"],\"gifter_username\":\"zaddyzavid\"}",
    //   // "channel":"channel.77528"}
    //   return null;
    // case 'App\\Events\\UserBannedEvent':
    //   // {
    //   // "event": "App\\Events\\UserBannedEvent",
    //   // "data": "{\"id\":\"1e9246c2-b8e7-4579-9452-0b80e3a63a1b\",\"user\":{\"id\":23295152,\"username\":\"reflectiveflora\",\"slug\":\"reflectiveflora\"},\"banned_by\":{\"id\":0,\"username\":\"moderator\",\"slug\":\"moderator\"},\"expires_at\":\"2023-11-30T08:49:27+00:00\"}",
    //   // "channel": "chatrooms.668.v2"
    //   // }
    //   return null;
    default:
      return null;
  }
}