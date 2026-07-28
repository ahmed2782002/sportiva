import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view/widgets/onboarding_constants.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState.initial());

  final PageController pageController = PageController();

  int get _total => OnboardingConstants.pages.length;

  void onPageChanged(int index) {
    emit(state.copyWith(
      currentIndex: index,
      isLastPage:   index == _total - 1,
    ));
  }

  void next() {
    if (state.currentIndex < _total - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve:    Curves.easeInOut,
      );
    }
  }

  void back() {
    if (state.currentIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve:    Curves.easeInOut,
      );
    }
  }

  void skip(VoidCallback onSkip) => onSkip();

  void finish(VoidCallback onFinish) => onFinish();

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
