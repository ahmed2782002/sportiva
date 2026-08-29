class NotificationSettingsState {
  final bool matchReminders;
  final bool bookingUpdates;
  final bool promotionalDeals;
  final bool chatMessages;
  final bool quietHoursEnabled;

  const NotificationSettingsState({
    this.matchReminders = true,
    this.bookingUpdates = true,
    this.promotionalDeals = false,
    this.chatMessages = true,
    this.quietHoursEnabled = false,
  });

  NotificationSettingsState copyWith({
    bool? matchReminders,
    bool? bookingUpdates,
    bool? promotionalDeals,
    bool? chatMessages,
    bool? quietHoursEnabled,
  }) {
    return NotificationSettingsState(
      matchReminders: matchReminders ?? this.matchReminders,
      bookingUpdates: bookingUpdates ?? this.bookingUpdates,
      promotionalDeals: promotionalDeals ?? this.promotionalDeals,
      chatMessages: chatMessages ?? this.chatMessages,
      quietHoursEnabled: quietHoursEnabled ?? this.quietHoursEnabled,
    );
  }
}
