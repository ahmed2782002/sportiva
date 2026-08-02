import '../../data/model/account_role.dart';

class RoleSelectionState {
  const RoleSelectionState({this.selectedRole = AccountRole.user});

  final AccountRole selectedRole;
}
