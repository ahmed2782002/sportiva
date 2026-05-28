class SplashState {
  final bool isAnimationComplete;
  final int currentStep;

  const SplashState({
    this.isAnimationComplete = false,
    this.currentStep = 0,
  });

  SplashState copyWith({
    bool? isAnimationComplete,
    int? currentStep,
  }) {
    return SplashState(
      isAnimationComplete: isAnimationComplete ?? this.isAnimationComplete,
      currentStep: currentStep ?? this.currentStep,
    );
  }
}
