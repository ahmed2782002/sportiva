class RegisterState {
  const RegisterState({this.isPasswordObscured = true});

  final bool isPasswordObscured;

  RegisterState copyWith({bool? isPasswordObscured}) => RegisterState(
    isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
  );
}
