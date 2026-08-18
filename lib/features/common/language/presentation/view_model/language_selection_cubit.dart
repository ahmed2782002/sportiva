import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cache/shared_preferences_manager.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/nav.dart';
import '../../../role_selection/presentation/view/screens/role_selection_screen.dart';
import '../../data/model/language_model.dart';
import 'language_selection_state.dart';

class LanguageSelectionCubit extends Cubit<LanguageSelectionState> {
  LanguageSelectionCubit() : super(const LanguageSelectionState());

  void selectLanguage(LanguageModel language) {
    if (state.selectedLanguage?.code == language.code) return;
    emit(state.copyWith(selectedLanguage: language));
  }

  Future<void> confirmSelection(BuildContext context) async {
    if (!state.hasSelection) return;
    emit(state.copyWith(isLoading: true));

    final language = state.selectedLanguage!;

    // 1. Apply locale via easy_localization
    await context.setLocale(Locale(language.code));

    // 2. Persist the selected language
    await SharedPref.saveData(AppString.cachedLanguage, language.code);
    await SharedPref.saveData(AppString.isLanguageSelected, true);

    emit(state.copyWith(isLoading: false));
    navigateFinish(const RoleSelectionScreen());
  }

  /// Returns the saved locale, or null if not set yet.
  static Locale? getSavedLocale() {
    final isSelected = SharedPref.getBool(AppString.isLanguageSelected);
    if (!isSelected) return null;
    final code = SharedPref.getString(AppString.cachedLanguage);
    if (code == null || code.isEmpty) return null;
    return Locale(code);
  }
}
