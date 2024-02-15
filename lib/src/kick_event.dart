enum TypeEvent {
  message,
  followersUpdated,
}

class KickEvent {
  final TypeEvent event;
  final String channel;

  KickEvent({
    required this.event,
    required this.channel,
  });
}