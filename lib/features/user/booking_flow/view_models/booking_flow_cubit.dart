import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sportive/features/user/booking_flow/view_models/booking_flow_state.dart';
import 'package:sportive/features/user/booking_shared/data/datasource/booking_mock_data.dart';
import 'package:sportive/features/user/booking_shared/model/booking_models.dart';

class BookingFlowCubit extends Cubit<BookingFlowState> {
  BookingFlowCubit({BookingVenue? venue})
    : venue = venue ?? _defaultVenue,
      super(const BookingFlowState());

  static const BookingVenue _defaultVenue = BookingVenue(
    name: 'Downtown Tennis Club',
    location: 'Gallery District',
    imageUrl:
        'https://images.unsplash.com/photo-1554068865-24cecd4e34b8?w=900&q=85',
  );

  final BookingVenue venue;

  BookingCourt get selectedCourt =>
      BookingMockData.courts[state.selectedCourtIndex];

  double get courtFee => 90;

  double get equipmentTotal => state.equipmentQuantities.entries.fold(
    0,
    (total, entry) => total + _equipmentPrice(entry.key) * entry.value,
  );

  double get serviceFee => 4.5;

  double get subtotal => courtFee + equipmentTotal + serviceFee;

  double get total => subtotal - state.discount;

  double _equipmentPrice(String id) =>
      BookingMockData.equipment.firstWhere((item) => item.id == id).price;

  void selectSport(int index) =>
      emit(state.copyWith(selectedSportIndex: index));

  void selectCourt(int index) =>
      emit(state.copyWith(selectedCourtIndex: index));

  void selectDate(int index) => emit(state.copyWith(selectedDateIndex: index));

  void selectDuration(int duration) =>
      emit(state.copyWith(selectedDuration: duration));

  void selectTime(String time) => emit(state.copyWith(selectedTime: time));

  void setEquipmentQuantity(String id, int quantity) {
    final next = Map<String, int>.from(state.equipmentQuantities);
    next[id] = quantity.clamp(0, 9).toInt();
    emit(state.copyWith(equipmentQuantities: next));
  }

  void setPromoCode(String code) =>
      emit(state.copyWith(promoCode: code, discount: 0, promoError: null));

  bool applyPromo() {
    if (state.promoCode.trim().toUpperCase() == 'SUMMER20') {
      emit(state.copyWith(discount: 16, promoError: null));
      return true;
    }
    emit(
      state.copyWith(
        discount: 0,
        promoError: 'Invalid Promo Code. Please try again.',
      ),
    );
    return false;
  }

  void selectPaymentMethod(String method) =>
      emit(state.copyWith(paymentMethod: method));

  void toggleLoyaltyPoints(bool value) =>
      emit(state.copyWith(useLoyaltyPoints: value));

  void goToSchedule() => emit(state.copyWith(step: BookingStep.schedule));

  void goToEquipment() => emit(state.copyWith(step: BookingStep.equipment));

  void goToPayment() => emit(state.copyWith(step: BookingStep.payment));

  void confirmBooking() {
    if (state.promoError != null) {
      emit(state.copyWith(step: BookingStep.status));
      return;
    }
    emit(state.copyWith(step: BookingStep.confirmation));
  }

  void selectNewTime() => emit(
    state.copyWith(step: BookingStep.schedule, promoError: null, discount: 0),
  );

  void joinWaitlist() => emit(state.copyWith(step: BookingStep.confirmation));

  void back() {
    final previous = switch (state.step) {
      BookingStep.venue => null,
      BookingStep.schedule => BookingStep.venue,
      BookingStep.equipment => BookingStep.schedule,
      BookingStep.payment => BookingStep.equipment,
      BookingStep.confirmation => BookingStep.payment,
      BookingStep.status => BookingStep.payment,
    };
    if (previous != null) emit(state.copyWith(step: previous));
  }
}
