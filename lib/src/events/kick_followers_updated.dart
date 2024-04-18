import 'dart:convert';

import 'package:kick_chat/src/kick_event.dart';

class KickFollowersUpdated extends KickEvent {
  final Data data;

  KickFollowersUpdated({
    required super.event,
    required this.data,
    required super.channel,
  });

  factory KickFollowersUpdated.fromJson(Map<String, dynamic> map) {
    return KickFollowersUpdated(
      event: TypeEvent.followersUpdated,
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
  final dynamic followersCount;
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