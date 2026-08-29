class VoucherModel {
  final String id;
  final String title;
  final String discountText;
  final String code;
  final String expiryDate;
  final String minBooking;
  final bool isExpired;

  const VoucherModel({
    required this.id,
    required this.title,
    required this.discountText,
    required this.code,
    required this.expiryDate,
    required this.minBooking,
    this.isExpired = false,
  });
}

class VouchersState {
  final List<VoucherModel> vouchers;
  final String selectedTab; // 'active' or 'used'

  const VouchersState({
    this.vouchers = const [
      VoucherModel(
        id: 'v1',
        title: 'Padel Weekend Special',
        discountText: '20% OFF',
        code: 'PADEL20',
        expiryDate: 'Exp: 15 Nov 2024',
        minBooking: 'Min booking 300 EGP',
      ),
      VoucherModel(
        id: 'v2',
        title: 'New User Welcome Gift',
        discountText: '100 EGP',
        code: 'SPORTIVA100',
        expiryDate: 'Exp: 30 Dec 2024',
        minBooking: 'Min booking 250 EGP',
      ),
      VoucherModel(
        id: 'v3',
        title: 'Summer Smash Offer',
        discountText: '15% OFF',
        code: 'SMASH15',
        expiryDate: 'Expired',
        minBooking: 'Min booking 200 EGP',
        isExpired: true,
      ),
    ],
    this.selectedTab = 'active',
  });

  VouchersState copyWith({
    List<VoucherModel>? vouchers,
    String? selectedTab,
  }) {
    return VouchersState(
      vouchers: vouchers ?? this.vouchers,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }
}
