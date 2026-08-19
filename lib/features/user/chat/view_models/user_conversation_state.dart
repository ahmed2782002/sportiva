import 'package:sportive/features/user/chat/model/chat_message_model.dart';

class UserConversationState {
  const UserConversationState({required this.messages, this.hasDraft = false});

  final List<ChatMessageModel> messages;
  final bool hasDraft;

  UserConversationState copyWith({
    List<ChatMessageModel>? messages,
    bool? hasDraft,
  }) => UserConversationState(
    messages: messages ?? this.messages,
    hasDraft: hasDraft ?? this.hasDraft,
  );
}
