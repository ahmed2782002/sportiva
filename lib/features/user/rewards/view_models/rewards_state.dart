class RewardsState {
  final int points;
  final int pointsToNextReward;
  final String currentTier;
  final String selectedTab; // 'rewards' or 'history'

  const RewardsState({
    this.points = 2450,
    this.pointsToNextReward = 550,
    this.currentTier = 'Silver Athlete',
    this.selectedTab = 'rewards',
  });

  RewardsState copyWith({
    int? points,
    int? pointsToNextReward,
    String? currentTier,
    String? selectedTab,
  }) {
    return RewardsState(
      points: points ?? this.points,
      pointsToNextReward: pointsToNextReward ?? this.pointsToNextReward,
      currentTier: currentTier ?? this.currentTier,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }
}
