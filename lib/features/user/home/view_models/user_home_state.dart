class UserHomeState {
  const UserHomeState({
    this.selectedSportIndex = 0,
    this.dealRemaining = const Duration(hours: 2, minutes: 26, seconds: 29),
  });

  final int selectedSportIndex;
  final Duration dealRemaining;

  String get dealCountdown {
    String two(int value) => value.toString().padLeft(2, '0');
    final hours = dealRemaining.inHours;
    final minutes = dealRemaining.inMinutes.remainder(60);
    final seconds = dealRemaining.inSeconds.remainder(60);
    return '${two(hours)}:${two(minutes)}:${two(seconds)}';
  }

  UserHomeState copyWith({int? selectedSportIndex, Duration? dealRemaining}) =>
      UserHomeState(
        selectedSportIndex: selectedSportIndex ?? this.selectedSportIndex,
        dealRemaining: dealRemaining ?? this.dealRemaining,
      );
}
