class PaymentCardModel {
  final String id;
  final String cardHolder;
  final String lastFourDigits;
  final String expiryDate;
  final String brand; // VISA or Mastercard
  final bool isDefault;

  const PaymentCardModel({
    required this.id,
    required this.cardHolder,
    required this.lastFourDigits,
    required this.expiryDate,
    required this.brand,
    this.isDefault = false,
  });
}

class PaymentMethodsState {
  final double walletBalance;
  final List<PaymentCardModel> cards;
  final String selectedDefaultCardId;

  const PaymentMethodsState({
    this.walletBalance = 450.00,
    this.cards = const [
      PaymentCardModel(
        id: 'c1',
        cardHolder: 'AHMED EL-SAYED',
        lastFourDigits: '4242',
        expiryDate: '12/26',
        brand: 'VISA',
        isDefault: true,
      ),
      PaymentCardModel(
        id: 'c2',
        cardHolder: 'AHMED EL-SAYED',
        lastFourDigits: '8812',
        expiryDate: '09/25',
        brand: 'MASTERCARD',
        isDefault: false,
      ),
    ],
    this.selectedDefaultCardId = 'c1',
  });

  PaymentMethodsState copyWith({
    double? walletBalance,
    List<PaymentCardModel>? cards,
    String? selectedDefaultCardId,
  }) {
    return PaymentMethodsState(
      walletBalance: walletBalance ?? this.walletBalance,
      cards: cards ?? this.cards,
      selectedDefaultCardId: selectedDefaultCardId ?? this.selectedDefaultCardId,
    );
  }
}
