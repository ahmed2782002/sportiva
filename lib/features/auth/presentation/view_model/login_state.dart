class LoginState {
  const LoginState({this.isPasswordObscured = true});

  final bool isPasswordObscured;

  LoginState copyWith({bool? isPasswordObscured}) => LoginState(
    isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
  );
}
