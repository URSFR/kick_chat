import 'package:kick_chat/src/entities/kick_badge.dart';

class KickUser {
  final int id;
  final int userId;
  final String slug;
  final int followersCount;
  final List<KickBadge> subBadges;

  KickUser({
    required this.id,
    required this.userId,
    required this.slug,
    required this.followersCount,
    required this.subBadges,
  });

  factory KickUser.fromJson(Map<String, dynamic> map) {
    List<KickBadge> subBadges = [];
    for(Map<String, dynamic> kickBadge in map['subscriber_badges']) {
      subBadges.add(KickBadge.fromJson(kickBadge));
    }
    return KickUser(
      id: map['id'],
      userId: map['user_id'],
      slug: map['slug'],
      followersCount: map['followers_count'],
      subBadges: subBadges,
    );
  }
}
