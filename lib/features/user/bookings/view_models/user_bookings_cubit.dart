import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sportive/features/user/shared/datasource/user_mock_data.dart';
import 'package:sportive/features/user/bookings/model/booking_model.dart';
import 'user_bookings_state.dart';

class UserBookingsCubit extends Cubit<UserBookingsState> {
  UserBookingsCubit()
    : super(UserBookingsState(bookings: UserMockData.bookings));

  void selectTab(BookingsTab tab) => emit(state.copyWith(currentTab: tab));

  void cancelBooking(BookingModel booking) {
    final updated = state.bookings
        .map(
          (item) => identical(item, booking)
              ? BookingModel(
                  venueName: item.venueName,
                  sport: item.sport,
                  court: item.court,
                  date: item.date,
                  time: item.time,
                  duration: item.duration,
                  price: item.price,
                  status: BookingStatus.rejected,
                  imageUrl: item.imageUrl,
                  rejectionReason: 'Cancelled by you.',
                )
              : item,
        )
        .toList();
    emit(state.copyWith(bookings: updated));
  }
}
