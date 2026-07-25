import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final extraController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void togglePasswordVisibility() => emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));

  bool validate() => formKey.currentState?.validate() ?? false;

  @override
  Future<void> close() {
    for (final controller in [nameController, emailController, phoneController, extraController, passwordController, confirmPasswordController]) {
      controller.dispose();
    }
    return super.close();
  }
}
