import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cache/shared_preferences_manager.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../data/model/account_role.dart';
import 'role_selection_state.dart';

class RoleSelectionCubit extends Cubit<RoleSelectionState> {
  RoleSelectionCubit() : super(const RoleSelectionState());

  void selectRole(AccountRole role) => emit(RoleSelectionState(selectedRole: role));

  Future<void> saveSelectedRole() =>
      SharedPref.saveData(AppString.selectedAccountRole, state.selectedRole.name);
}
