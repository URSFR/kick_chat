import 'dart:convert';

import 'package:kick_chat/src/kick_event.dart';
import 'package:kick_chat/src/utils/string_to_event.dart';

class KickFollowersUpdated extends KickEvent {
  final TypeEvent event;
  final Data data;
  final String channel;

  KickFollowersUpdated({
    required this.event,
    required this.data,
    required this.channel,
  }) : super(event: event, channel: channel);

  factory KickFollowersUpdated.fromJson(Map<String, dynamic> map) {
    return KickFollowersUpdated(
      event: stringToEvent(map['event']),
      data: Data.fromJson(jsonDecode(map['data'])),
      channel: map['channel'],
    );
  }

  @override
  String toString() {
    return 'event: $event, data: $data, channel: $channel';
  }
}

class Data {
  final int followersCount;
  final int epochTimeLastFollow;

  Data({
    required this.followersCount,
    required this.epochTimeLastFollow,
  });

  factory Data.fromJson(Map<String, dynamic> map) {
    return Data(
      followersCount: map['followersCount'],
      epochTimeLastFollow: map['created_at'],
    );
  }

  @override
  String toString() {
    return 'followersCount: $followersCount, epochTimeLastFollow: $epochTimeLastFollow';
  }
}