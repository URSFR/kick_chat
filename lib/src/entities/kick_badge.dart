class KickBadge {
  final int id;
  final int channelId;
  final int months;
  final BadgeImage badgeImage;

  KickBadge({
    required this.id,
    required this.channelId,
    required this.months,
    required this.badgeImage,
  });

  factory KickBadge.fromJson(Map<String, dynamic> map) {
    return KickBadge(
      id: map['id'],
      channelId: map['channel_id'],
      months: map['months'],
      badgeImage:  BadgeImage.fromJson(map['badge_image']),
    );
  }
}

class BadgeImage {
  final String src;

  BadgeImage({
    required this.src,
  });

  factory BadgeImage.fromJson(Map<String, dynamic> map) {
    return BadgeImage(
      src: map['src'],
    );
  }
}
