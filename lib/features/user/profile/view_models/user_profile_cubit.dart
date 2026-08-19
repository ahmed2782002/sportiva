import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sportive/core/cache/shared_preferences_manager.dart';
import 'package:sportive/core/utils/constants/app_context.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/core/utils/nav.dart';
import 'package:sportive/features/common/auth/login/presentation/view/screens/login_screen.dart';
import 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(const UserProfileState());

  void toggleProfileVisibility(bool isPublic) =>
      emit(state.copyWith(isProfilePublic: isPublic));

  Future<void> changeLanguage() async {
    final context = AppContext.context;
    final next = context.locale.languageCode == 'ar'
        ? const Locale('en')
        : const Locale('ar');

    await context.setLocale(next);
    await SharedPref.saveData(AppString.cachedLanguage, next.languageCode);
  }

  Future<void> logout() async {
    await SharedPref.removeData(AppString.selectedAccountRole);
    navigateFinish(const LoginScreen());
  }
}
