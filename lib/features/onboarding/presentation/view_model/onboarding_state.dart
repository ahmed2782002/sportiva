class OnboardingState {
  final int currentIndex;
  final bool isLastPage;

  const OnboardingState({
    required this.currentIndex,
    required this.isLastPage,
  });

  const OnboardingState.initial()
      : currentIndex = 0,
        isLastPage   = false;

  OnboardingState copyWith({int? currentIndex, bool? isLastPage}) {
    return OnboardingState(
      currentIndex: currentIndex ?? this.currentIndex,
      isLastPage:   isLastPage   ?? this.isLastPage,
    );
  }
}
