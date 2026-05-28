import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/cache/shared_preferences_manager.dart';
import '../../../core/utils/constants/app_strings.dart';
import '../../../core/utils/nav.dart';
import '../../language/presentation/view/screens/language_selection_screen.dart';
import '../../onboarding/presentation/view/screens/onboarding_screen.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  Future<void> startSplashSequence() async {
    // Wait for animations to complete
    await Future.delayed(const Duration(seconds: 3));

    emit(state.copyWith(isAnimationComplete: true));

    // Check if language is selected
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    final isLanguageSelected = SharedPref.getBool(AppString.isLanguageSelected);

    if (!isLanguageSelected) {
      // First time — go to language selection
      navigateFinish(const LanguageSelectionScreen());
    } else {
      // Language already selected — go to onboarding
      navigateFinish(const OnboardingScreen());
    }
  }

  void updateStep(int step) {
    emit(state.copyWith(currentStep: step));
  }
}
