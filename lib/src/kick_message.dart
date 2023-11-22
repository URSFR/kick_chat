import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kick_chat/src/kick_badge.dart';

class KickMessage {
  final String event;
  final Data data;
  final String channel;

  KickMessage({
    required this.event,
    required this.data,
    required this.channel,
  });

  factory KickMessage.fromJson(Map<String, dynamic> map) {
    debugPrint(map.toString());
    return KickMessage(
      event: map['event'],
      data: Data.fromJson(jsonDecode(map['data'])),
      channel: map['channel'],
    );
  }
}

class Data {
  final String id;
  final int chatroomId;
  final String content;
  final String type;
  final String createdAt;
  final Sender sender;

  Data({
    required this.id,
    required this.chatroomId,
    required this.content,
    required this.type,
    required this.createdAt,
    required this.sender,
  });

  factory Data.fromJson(Map<String, dynamic> map) {
    return Data(
      id: map['id'],
      chatroomId: map['chatroom_id'],
      content: map['content'],
      type: map['type'],
      createdAt: map['created_at'],
      sender: Sender.fromJson(jsonDecode(map['sender'])),
    );
  }
}

class Sender {
  final int id;
  final String username;
  final String slug;
  final Identity identity;

  Sender({
    required this.id,
    required this.username,
    required this.slug,
    required this.identity,
  });

  factory Sender.fromJson(Map<String, dynamic> map) {
    return Sender(
      id: map['id'],
      username: map['username'],
      slug: map['slug'],
      identity: Identity.fromJson(jsonDecode(map['identity'])),
    );
  }
}

class Identity {
  final String color;
  final List<KickBadge> badges;

  Identity({
    required this.color,
    required this.badges,
  });

  factory Identity.fromJson(Map<String, dynamic> map) {
    return Identity(
      color: map['color'],
      badges: [],
    );
  }
}
