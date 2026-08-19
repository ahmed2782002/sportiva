class UserProfileState {
  const UserProfileState({this.isProfilePublic = true});

  final bool isProfilePublic;

  UserProfileState copyWith({bool? isProfilePublic}) =>
      UserProfileState(isProfilePublic: isProfilePublic ?? this.isProfilePublic);
}
