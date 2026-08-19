import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sportive/features/user/shared/datasource/user_mock_data.dart';
import 'package:sportive/features/user/chat/model/chat_message_model.dart';
import 'user_conversation_state.dart';

class UserConversationCubit extends Cubit<UserConversationState> {
  UserConversationCubit()
    : super(
        UserConversationState(
          messages: List.of(UserMockData.conversationThread),
        ),
      );

  final messageController = TextEditingController();
  final scrollController = ScrollController();

  void onDraftChanged(String value) {
    final hasDraft = value.trim().isNotEmpty;
    if (hasDraft == state.hasDraft) return;
    emit(state.copyWith(hasDraft: hasDraft));
  }

  void sendMessage() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    final now = TimeOfDay.now();
    final stamp =
        '${now.hour.toString().padLeft(2, '0')}:'
        '${now.minute.toString().padLeft(2, '0')}';

    emit(
      state.copyWith(
        messages: [
          ...state.messages,
          ChatMessageModel(text: text, time: stamp, isMine: true),
        ],
        hasDraft: false,
      ),
    );
    messageController.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!scrollController.hasClients) return;
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Future<void> close() {
    messageController.dispose();
    scrollController.dispose();
    return super.close();
  }
}
