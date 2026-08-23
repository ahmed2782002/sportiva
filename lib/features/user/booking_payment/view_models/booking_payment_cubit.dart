import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sportive/features/user/booking_flow/view_models/booking_flow_cubit.dart';

class BookingPaymentState {
  const BookingPaymentState({
    required this.promoCode,
    required this.promoError,
    required this.paymentMethod,
    required this.useLoyaltyPoints,
  });

  factory BookingPaymentState.fromFlow(BookingFlowCubit cubit) =>
      BookingPaymentState(
        promoCode: cubit.state.promoCode,
        promoError: cubit.state.promoError,
        paymentMethod: cubit.state.paymentMethod,
        useLoyaltyPoints: cubit.state.useLoyaltyPoints,
      );

  final String promoCode;
  final String? promoError;
  final String paymentMethod;
  final bool useLoyaltyPoints;

  BookingPaymentState copyWith({
    String? promoCode,
    Object? promoError = _keep,
    String? paymentMethod,
    bool? useLoyaltyPoints,
  }) => BookingPaymentState(
    promoCode: promoCode ?? this.promoCode,
    promoError: identical(promoError, _keep)
        ? this.promoError
        : promoError as String?,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    useLoyaltyPoints: useLoyaltyPoints ?? this.useLoyaltyPoints,
  );

  static const Object _keep = Object();
}

class BookingPaymentCubit extends Cubit<BookingPaymentState> {
  BookingPaymentCubit(this.flowCubit)
    : super(BookingPaymentState.fromFlow(flowCubit));

  final BookingFlowCubit flowCubit;

  void setPromoCode(String code) {
    flowCubit.setPromoCode(code);
    _sync();
  }

  bool applyPromo() {
    final applied = flowCubit.applyPromo();
    _sync();
    return applied;
  }

  void selectPaymentMethod(String method) {
    flowCubit.selectPaymentMethod(method);
    _sync();
  }

  void toggleLoyaltyPoints(bool value) {
    flowCubit.toggleLoyaltyPoints(value);
    _sync();
  }

  void paySecurely() => flowCubit.confirmBooking();

  void back() => flowCubit.back();

  void _sync() => emit(BookingPaymentState.fromFlow(flowCubit));
}
