import 'package:sportive/features/user/shell/model/user_tab.dart';

class UserShellState {
  const UserShellState({this.currentTab = UserTab.home});

  final UserTab currentTab;

  UserShellState copyWith({UserTab? currentTab}) =>
      UserShellState(currentTab: currentTab ?? this.currentTab);
}
