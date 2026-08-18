import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sportive/core/cache/shared_preferences_manager.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/common/role_selection/data/model/account_role.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  AccountRole get role => AccountRole.values.firstWhere(
    (item) => item.name == SharedPref.getString(AppString.selectedAccountRole),
    orElse: () => AccountRole.user,
  );

  void togglePasswordVisibility() =>
      emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));

  bool validate() => formKey.currentState?.validate() ?? false;

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
