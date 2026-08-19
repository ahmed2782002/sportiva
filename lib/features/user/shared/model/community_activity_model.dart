class CommunityActivityModel {
  const CommunityActivityModel({
    required this.userName,
    required this.action,
    required this.target,
    required this.time,
    required this.imageUrl,
  });

  final String userName;
  final String action;
  final String target;
  final String time;
  final String imageUrl;
}
