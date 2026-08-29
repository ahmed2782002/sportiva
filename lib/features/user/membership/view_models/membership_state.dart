class MembershipState {
  final String activeTier;
  final bool isAnnualBilling;
  final String renewDate;
  final bool isLoading;

  const MembershipState({
    this.activeTier = 'Sportiva+ Pro',
    this.isAnnualBilling = true,
    this.renewDate = '15 Oct 2024',
    this.isLoading = false,
  });

  MembershipState copyWith({
    String? activeTier,
    bool? isAnnualBilling,
    String? renewDate,
    bool? isLoading,
  }) {
    return MembershipState(
      activeTier: activeTier ?? this.activeTier,
      isAnnualBilling: isAnnualBilling ?? this.isAnnualBilling,
      renewDate: renewDate ?? this.renewDate,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
