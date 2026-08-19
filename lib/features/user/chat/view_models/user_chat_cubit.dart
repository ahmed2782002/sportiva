import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sportive/features/user/shared/datasource/user_mock_data.dart';
import 'user_chat_state.dart';

class UserChatCubit extends Cubit<UserChatState> {
  UserChatCubit()
    : super(UserChatState(conversations: UserMockData.conversations));

  final searchController = TextEditingController();

  void search(String query) {
    final normalized = query.trim().toLowerCase();
    emit(
      state.copyWith(
        query: query,
        conversations: normalized.isEmpty
            ? UserMockData.conversations
            : UserMockData.conversations
                  .where(
                    (chat) =>
                        chat.name.toLowerCase().contains(normalized) ||
                        chat.lastMessage.toLowerCase().contains(normalized),
                  )
                  .toList(),
      ),
    );
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
