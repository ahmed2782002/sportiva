class TermsPrivacyState {
  final String activeTab; // 'terms' or 'privacy'
  final String lastUpdated;

  const TermsPrivacyState({
    this.activeTab = 'terms',
    this.lastUpdated = 'August 2026',
  });

  TermsPrivacyState copyWith({
    String? activeTab,
    String? lastUpdated,
  }) {
    return TermsPrivacyState(
      activeTab: activeTab ?? this.activeTab,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
