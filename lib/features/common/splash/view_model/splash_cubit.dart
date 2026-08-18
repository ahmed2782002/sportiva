import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cache/shared_preferences_manager.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/nav.dart';
import '../../language/presentation/view/screens/language_selection_screen.dart';
import '../../role_selection/presentation/view/screens/role_selection_screen.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  Future<void> startSplashSequence() async {
    await Future.delayed(const Duration(seconds: 3));

    emit(state.copyWith(isAnimationComplete: true));

    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    final isLanguageSelected = SharedPref.getBool(AppString.isLanguageSelected);

    if (!isLanguageSelected) {
      navigateFinish(const LanguageSelectionScreen());
    } else {
      navigateFinish(const RoleSelectionScreen());
    }
  }

  void updateStep(int step) {
    emit(state.copyWith(currentStep: step));
  }
}
