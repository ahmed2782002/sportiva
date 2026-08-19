import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sportive/features/user/shared/datasource/user_mock_data.dart';
import 'user_search_state.dart';

class UserSearchCubit extends Cubit<UserSearchState> {
  UserSearchCubit()
    : super(UserSearchState(venues: UserMockData.topRatedVenues));

  final searchController = TextEditingController();

  void search(String query) {
    final normalized = query.trim().toLowerCase();
    emit(
      state.copyWith(
        query: query,
        venues: normalized.isEmpty
            ? UserMockData.topRatedVenues
            : UserMockData.topRatedVenues
                  .where(
                    (venue) =>
                        venue.name.toLowerCase().contains(normalized) ||
                        venue.location.toLowerCase().contains(normalized) ||
                        venue.tags.any(
                          (tag) => tag.toLowerCase().contains(normalized),
                        ),
                  )
                  .toList(),
      ),
    );
  }

  void applyRecentSearch(String value) {
    searchController.text = value;
    search(value);
  }

  void selectSport(int index) => emit(
    state.selectedSportIndex == index
        ? state.copyWith(clearSport: true)
        : state.copyWith(selectedSportIndex: index),
  );

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
