import 'package:flutter_bloc/flutter_bloc.dart';
import 'notification_settings_state.dart';

class NotificationSettingsCubit extends Cubit<NotificationSettingsState> {
  NotificationSettingsCubit() : super(const NotificationSettingsState());

  void toggleMatchReminders(bool value) => emit(state.copyWith(matchReminders: value));
  void toggleBookingUpdates(bool value) => emit(state.copyWith(bookingUpdates: value));
  void togglePromotionalDeals(bool value) => emit(state.copyWith(promotionalDeals: value));
  void toggleChatMessages(bool value) => emit(state.copyWith(chatMessages: value));
  void toggleQuietHours(bool value) => emit(state.copyWith(quietHoursEnabled: value));
}
