import 'package:sportive/features/user/chat/model/chat_conversation_model.dart';

class UserChatState {
  const UserChatState({this.query = '', required this.conversations});

  final String query;
  final List<ChatConversationModel> conversations;

  List<ChatConversationModel> get pinned =>
      conversations.where((item) => item.isPinned).toList();

  List<ChatConversationModel> get recent =>
      conversations.where((item) => !item.isPinned).toList();

  UserChatState copyWith({
    String? query,
    List<ChatConversationModel>? conversations,
  }) => UserChatState(
    query: query ?? this.query,
    conversations: conversations ?? this.conversations,
  );
}
