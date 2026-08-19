class ChatConversationModel {
  const ChatConversationModel({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.imageUrl,
    this.unreadCount = 0,
    this.isOnline = false,
    this.isMuted = false,
    this.isPinned = false,
    this.initials,
  });

  final String name;
  final String lastMessage;
  final String time;
  final String imageUrl;
  final int unreadCount;
  final bool isOnline;
  final bool isMuted;
  final bool isPinned;

  /// When set, the avatar renders these initials instead of a photo.
  final String? initials;
}
