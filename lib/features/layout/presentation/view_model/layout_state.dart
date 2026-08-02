import 'package:sportive/features/common/role_selection/data/model/account_role.dart';

class LayoutState {
  const LayoutState({
    required this.role,
    this.currentIndex = 0,
  });

  final AccountRole role;
  final int currentIndex;

  LayoutState copyWith({
    AccountRole? role,
    int? currentIndex,
  }) =>
      LayoutState(
        role: role ?? this.role,
        currentIndex: currentIndex ?? this.currentIndex,
      );
}
