enum BookingStep { venue, schedule, equipment, payment, confirmation, status }

class BookingFlowState {
  const BookingFlowState({
    this.step = BookingStep.venue,
    this.selectedSportIndex = 0,
    this.selectedCourtIndex = 0,
    this.selectedDateIndex = 1,
    this.selectedDuration = 90,
    this.selectedTime = '14:00',
    this.equipmentQuantities = const {'racket': 2, 'balls': 1},
    this.promoCode = '',
    this.discount = 0,
    this.promoError,
    this.paymentMethod = 'card',
    this.useLoyaltyPoints = false,
  });

  final BookingStep step;
  final int selectedSportIndex;
  final int selectedCourtIndex;
  final int selectedDateIndex;
  final int selectedDuration;
  final String selectedTime;
  final Map<String, int> equipmentQuantities;
  final String promoCode;
  final double discount;
  final String? promoError;
  final String paymentMethod;
  final bool useLoyaltyPoints;

  BookingFlowState copyWith({
    BookingStep? step,
    int? selectedSportIndex,
    int? selectedCourtIndex,
    int? selectedDateIndex,
    int? selectedDuration,
    String? selectedTime,
    Map<String, int>? equipmentQuantities,
    String? promoCode,
    double? discount,
    Object? promoError = _keep,
    String? paymentMethod,
    bool? useLoyaltyPoints,
  }) => BookingFlowState(
    step: step ?? this.step,
    selectedSportIndex: selectedSportIndex ?? this.selectedSportIndex,
    selectedCourtIndex: selectedCourtIndex ?? this.selectedCourtIndex,
    selectedDateIndex: selectedDateIndex ?? this.selectedDateIndex,
    selectedDuration: selectedDuration ?? this.selectedDuration,
    selectedTime: selectedTime ?? this.selectedTime,
    equipmentQuantities: equipmentQuantities ?? this.equipmentQuantities,
    promoCode: promoCode ?? this.promoCode,
    discount: discount ?? this.discount,
    promoError: identical(promoError, _keep)
        ? this.promoError
        : promoError as String?,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    useLoyaltyPoints: useLoyaltyPoints ?? this.useLoyaltyPoints,
  );

  static const Object _keep = Object();
}
