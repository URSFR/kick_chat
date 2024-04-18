enum TypeEvent {
  message,
  followersUpdated,
  streamHostEvent,
  subscriptionEvent,
  chatroomUpdatedEvent,
  userBannedEvent,
  chatroomClearEvent,
  giftedSubscriptionsEvent,
  pinnedMessageCreatedEvent,
  pollUpdateEvent,
}

class KickEvent {
  final TypeEvent event;
  final String channel;

  KickEvent({
    required this.event,
    required this.channel,
  });
}