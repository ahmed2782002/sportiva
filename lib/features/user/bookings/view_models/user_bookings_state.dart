import 'package:sportive/features/user/bookings/model/booking_model.dart';

enum BookingsTab { upcoming, completed, cancelled }

class UserBookingsState {
  const UserBookingsState({
    this.currentTab = BookingsTab.upcoming,
    required this.bookings,
  });

  final BookingsTab currentTab;
  final List<BookingModel> bookings;

  List<BookingModel> get visibleBookings => bookings.where((booking) {
    return switch (currentTab) {
      BookingsTab.upcoming => booking.status.isUpcoming,
      BookingsTab.completed => booking.status == BookingStatus.completed,
      BookingsTab.cancelled => booking.status == BookingStatus.rejected,
    };
  }).toList();

  UserBookingsState copyWith({
    BookingsTab? currentTab,
    List<BookingModel>? bookings,
  }) => UserBookingsState(
    currentTab: currentTab ?? this.currentTab,
    bookings: bookings ?? this.bookings,
  );
}
