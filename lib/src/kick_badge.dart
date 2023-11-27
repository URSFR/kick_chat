class KickBadge {
  final int id;
  final int channelId;
  final String src;

  KickBadge({
    required this.id,
    required this.channelId,
    required this.src,
  });

  factory KickBadge.fromJson(Map<String, dynamic> map) {
    return KickBadge(
      id: map['id'],
      channelId: map['channel_id'],
      src: map['badge_image']['src'],
    );
  }
}
