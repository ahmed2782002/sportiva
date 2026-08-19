enum MessageType { text, booking }

class ChatMessageModel {
  const ChatMessageModel({
    required this.text,
    required this.time,
    required this.isMine,
    this.isRead = false,
    this.type = MessageType.text,
    this.bookingVenue,
    this.bookingDetails,
  });

  final String text;
  final String time;
  final bool isMine;
  final bool isRead;
  final MessageType type;

  /// Only used when [type] is [MessageType.booking].
  final String? bookingVenue;
  final String? bookingDetails;
}
