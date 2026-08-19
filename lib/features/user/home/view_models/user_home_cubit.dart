import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  UserHomeCubit() : super(const UserHomeState()) {
    _startDealCountdown();
  }

  Timer? _timer;

  void selectSport(int index) => emit(state.copyWith(selectedSportIndex: index));

  void _startDealCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.dealRemaining.inSeconds <= 0) {
        _timer?.cancel();
        return;
      }
      emit(
        state.copyWith(
          dealRemaining: state.dealRemaining - const Duration(seconds: 1),
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
