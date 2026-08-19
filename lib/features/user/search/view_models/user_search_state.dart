import 'package:sportive/features/user/shared/model/venue_model.dart';

class UserSearchState {
  const UserSearchState({
    this.query = '',
    this.selectedSportIndex,
    required this.venues,
  });

  final String query;
  final int? selectedSportIndex;
  final List<VenueModel> venues;

  UserSearchState copyWith({
    String? query,
    int? selectedSportIndex,
    bool clearSport = false,
    List<VenueModel>? venues,
  }) => UserSearchState(
    query: query ?? this.query,
    selectedSportIndex: clearSport
        ? null
        : (selectedSportIndex ?? this.selectedSportIndex),
    venues: venues ?? this.venues,
  );
}
