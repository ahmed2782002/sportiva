import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sportive/features/user/shell/model/user_tab.dart';
import 'user_shell_state.dart';

class UserShellCubit extends Cubit<UserShellState> {
  UserShellCubit({UserTab initialTab = UserTab.home})
    : super(UserShellState(currentTab: initialTab));

  void selectTab(UserTab tab) {
    if (tab == state.currentTab) return;
    emit(state.copyWith(currentTab: tab));
  }

  bool get isOnHomeTab => state.currentTab == UserTab.home;

  /// Returns `false` when the back gesture was consumed by moving the user
  /// back to the home tab instead of leaving the app.
  bool handleBack() {
    if (isOnHomeTab) return true;
    emit(state.copyWith(currentTab: UserTab.home));
    return false;
  }
}
