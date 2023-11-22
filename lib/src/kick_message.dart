import 'package:kick_chat/src/kick_badge.dart';

class KickMessage {
  final String event;
  final Data data;
  final String channel;

  KickMessage(
    this.event,
    this.data,
    this.channel,
  );
}

class Data {
  final String id;
  final String chatroomId;
  final String content;
  final String type;
  final String createdAt;
  final Sender sender;

  Data(
    this.id,
    this.chatroomId,
    this.content,
    this.type,
    this.createdAt,
    this.sender,
  );
}

class Sender {
  final String username;
  final String slug;
  final Identity identity;

  Sender(
    this.username,
    this.slug,
    this.identity,
  );
}

class Identity {
  final String color;
  final List<KickBadge> badges;

  Identity(
    this.color,
    this.badges,
  );
}