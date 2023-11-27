import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kick_chat/src/kick_badge.dart';

class KickChannel {
  final Chatroom chatroom;
  final List<KickBadge> subscriberBadges;
  final User user;

  KickChannel({
    required this.chatroom,
    required this.subscriberBadges,
    required this.user,
  });

  factory KickChannel.fromJson(Map<String, dynamic> map) {
    List<KickBadge> badges = [];
    return KickChannel(
      chatroom: Chatroom.fromJson(map['chatroom']),
      subscriberBadges: badges,
      user: User.fromJson(map['user']),
    );
  }

  static Future<KickChannel?> getChannelInfo(String channelName) async {
    Response response;
    var dio = Dio();

    debugPrint(channelName);
    try {
      response = await dio.get('https://kick.com/api/v2/channels/$channelName');
      return KickChannel.fromJson(response.data['data']);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}

class Chatroom {
  final chatableId;

  Chatroom({
    required this.chatableId,
  });

  factory Chatroom.fromJson(Map<String, dynamic> map) {
    return Chatroom(
      chatableId: map['chatable_id'],
    );
  }
}

class User {
  final String profilePic;

  User({
    required this.profilePic,
  });

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      profilePic: map['profile_pic'],
    );
  }
}
