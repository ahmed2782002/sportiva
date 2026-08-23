import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/booking_payment/view_models/booking_payment_cubit.dart';
import 'package:sportive/features/user/booking_shared/data/datasource/booking_mock_data.dart';
import 'package:sportive/features/user/booking_flow/view_models/booking_flow_cubit.dart';
import 'package:sportive/features/user/booking_flow/view_models/booking_flow_state.dart';
import 'package:sportive/features/user/shared/view/widget/user_network_image.dart';
import 'package:sportive/features/user/booking_shared/view/widget/booking_buttons.dart';
import 'package:sportive/features/user/booking_shared/view/widget/booking_header.dart';
import 'package:sportive/features/user/booking_shared/view/widget/booking_style.dart';

class BookingPaymentScreen extends StatefulWidget {
  const BookingPaymentScreen({super.key});

  @override
  State<BookingPaymentScreen> createState() => _BookingPaymentScreenState();
}

class _BookingPaymentScreenState extends State<BookingPaymentScreen> {
  late final TextEditingController _promoController;

  @override
  void initState() {
    super.initState();
    _promoController = TextEditingController(
      text: context.read<BookingPaymentCubit>().state.promoCode,
    );
  }

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BookingPaymentCubit>().state;
    final cubit = context.read<BookingPaymentCubit>();
    final flowCubit = cubit.flowCubit;

    return Scaffold(
      backgroundColor: BookingStyle.background,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(14.w, 10.h, 14.w, 27.h),
          children: [
            BookingHeader(onBack: cubit.back, title: 'Checkout'),
            SizedBox(height: 28.h),
            Row(
              children: [
                Text(
                  'STEP 3 OF 3',
                  style: BookingStyle.body(
                    12,
                    weight: FontWeight.w500,
                  ).copyWith(letterSpacing: 1.1),
                ),
                SizedBox(width: 11.w),
                Expanded(
                  child: Container(
                    height: 3.h,
                    decoration: BoxDecoration(
                      color: BookingStyle.primary,
                      borderRadius: BorderRadius.circular(3.r),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 28.h),
            Text(
              'Payment Details',
              style: BookingStyle.body(14, weight: FontWeight.w500),
            ),
            SizedBox(height: 24.h),
            Text(
              'Complete your reservation securely.',
              style: BookingStyle.body(13).copyWith(color: BookingStyle.muted),
            ),
            SizedBox(height: 40.h),
            _DiscountCard(
              controller: _promoController,
              error: state.promoError,
              onChanged: cubit.setPromoCode,
              onApply: cubit.applyPromo,
              useLoyaltyPoints: state.useLoyaltyPoints,
              onLoyaltyChanged: cubit.toggleLoyaltyPoints,
            ),
            SizedBox(height: 20.h),
            _PaymentMethodCard(
              selectedMethod: state.paymentMethod,
              onSelected: cubit.selectPaymentMethod,
            ),
            SizedBox(height: 20.h),
            _BookingSummary(cubit: flowCubit, state: flowCubit.state),
          ],
        ),
      ),
    );
  }
}

class _DiscountCard extends StatelessWidget {
  const _DiscountCard({
    required this.controller,
    required this.error,
    required this.onChanged,
    required this.onApply,
    required this.useLoyaltyPoints,
    required this.onLoyaltyChanged,
  });

  final TextEditingController controller;
  final String? error;
  final ValueChanged<String> onChanged;
  final VoidCallback onApply;
  final bool useLoyaltyPoints;
  final ValueChanged<bool> onLoyaltyChanged;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
    decoration: BookingStyle.card(radius: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.sell_outlined, size: 18.sp),
            SizedBox(width: 8.w),
            Text(
              'Discounts & Offers',
              style: BookingStyle.body(14, weight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                style: BookingStyle.body(13),
                decoration: InputDecoration(
                  hintText: 'Enter promo code',
                  hintStyle: BookingStyle.body(
                    13,
                  ).copyWith(color: const Color(0xFFA09AA0)),
                  filled: true,
                  fillColor: BookingStyle.pale,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 13.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 9.w),
            SizedBox(
              height: 40.h,
              child: OutlinedButton(
                onPressed: onApply,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: BookingStyle.border),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.r),
                  ),
                ),
                child: Text(
                  'Apply',
                  style: BookingStyle.body(13, weight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
        if (error != null) ...[
          SizedBox(height: 7.h),
          Text(
            error!,
            style: BookingStyle.body(11).copyWith(color: AppColors.red),
          ),
        ],
        SizedBox(height: 17.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: BookingStyle.pale,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              Container(
                width: 34.r,
                height: 34.r,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: BookingStyle.pink,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.stars_rounded,
                  size: 20.sp,
                  color: BookingStyle.primary,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Use Loyalty Points', style: BookingStyle.body(13)),
                    Text(
                      'Balance: 1,250 pts\n(-\$12.50)',
                      style: BookingStyle.body(
                        11,
                      ).copyWith(color: BookingStyle.muted),
                    ),
                  ],
                ),
              ),
              Switch.adaptive(
                value: useLoyaltyPoints,
                onChanged: onLoyaltyChanged,
                activeThumbColor: BookingStyle.primary,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _PaymentMethodCard extends StatelessWidget {
  const _PaymentMethodCard({
    required this.selectedMethod,
    required this.onSelected,
  });

  final String selectedMethod;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 19.h),
    decoration: BookingStyle.card(radius: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.credit_card_outlined, size: 18.sp),
            SizedBox(width: 8.w),
            Text(
              'Payment Method',
              style: BookingStyle.body(14, weight: FontWeight.w500),
            ),
          ],
        ),

        SizedBox(height: 14.h),
        _PaymentOption(
          method: 'card',
          selectedMethod: selectedMethod,
          onSelected: onSelected,
          child: Row(
            children: [
              Icon(Icons.credit_card, color: BookingStyle.muted, size: 20.sp),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('•••• 4242', style: BookingStyle.body(13)),
                  Text(
                    'Expires 12/25',
                    style: BookingStyle.body(
                      12,
                    ).copyWith(color: BookingStyle.muted),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.add_circle_outline,
              size: 19.sp,
              color: BookingStyle.ink,
            ),
            label: Text('Add Card', style: BookingStyle.body(13)),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: BookingStyle.border),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.r),
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        _PaymentOption(
          method: 'vodafone',
          selectedMethod: selectedMethod,
          onSelected: onSelected,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(7.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE2E1),
                  borderRadius: BorderRadius.circular(3.r),
                ),
                child: Text(
                  'VF\nCash',
                  style: BookingStyle.body(
                    10,
                    weight: FontWeight.w600,
                  ).copyWith(color: AppColors.red, height: 0.9),
                ),
              ),
              SizedBox(width: 10.w),
              Text('Vodafone Cash', style: BookingStyle.body(13)),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        _PaymentOption(
          method: 'instapay',
          selectedMethod: selectedMethod,
          onSelected: onSelected,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0E3FF),
                  borderRadius: BorderRadius.circular(3.r),
                ),
                child: Text(
                  'IPay',
                  style: BookingStyle.body(
                    10,
                    weight: FontWeight.w600,
                  ).copyWith(color: const Color(0xFF772AD1)),
                ),
              ),
              SizedBox(width: 10.w),
              Text('InstaPay', style: BookingStyle.body(13)),
            ],
          ),
        ),
        SizedBox(height: 28.h),
        const Divider(height: 1, color: BookingStyle.border),
        SizedBox(height: 20.h),
        InkWell(
          onTap: () => onSelected('split'),
          child: Row(
            children: [
              Container(
                width: 34.r,
                height: 34.r,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: BookingStyle.pale,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.people_outline, size: 18.sp),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Split Payment', style: BookingStyle.body(13)),
                    Text(
                      'Divide cost with friends',
                      style: BookingStyle.body(
                        12,
                      ).copyWith(color: BookingStyle.muted),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, size: 20.sp),
            ],
          ),
        ),
      ],
    ),
  );
}

class _PaymentOption extends StatelessWidget {
  const _PaymentOption({
    required this.method,
    required this.selectedMethod,
    required this.onSelected,
    required this.child,
  });

  final String method;
  final String selectedMethod;
  final ValueChanged<String> onSelected;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final selected = method == selectedMethod;
    return InkWell(
      onTap: () => onSelected(method),
      borderRadius: BorderRadius.circular(9.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.fromLTRB(14.w, 13.h, 10.w, 13.h),
        decoration: BoxDecoration(
          color: selected ? BookingStyle.pale : Colors.white,
          borderRadius: BorderRadius.circular(9.r),
          border: Border.all(
            color: selected ? BookingStyle.primary : BookingStyle.border,
            width: selected ? 1.2 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(child: child),
            Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: selected ? BookingStyle.primary : BookingStyle.muted,
              size: 21.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class _BookingSummary extends StatelessWidget {
  const _BookingSummary({required this.cubit, required this.state});

  final BookingFlowCubit cubit;
  final BookingFlowState state;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.fromLTRB(20.w, 21.h, 20.w, 20.h),
    decoration: BookingStyle.card(radius: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Booking Summary',
          style: BookingStyle.body(14, weight: FontWeight.w500),
        ),
        SizedBox(height: 18.h),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: UserNetworkImage(
                url: cubit.venue.imageUrl,
                width: 66.w,
                height: 66.h,
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${cubit.selectedCourt.name.toUpperCase()} • PREMIUM',
                    style: BookingStyle.body(12, weight: FontWeight.w500),
                  ),
                  SizedBox(height: 3.h),
                  Text(cubit.venue.name, style: BookingStyle.body(13)),
                  SizedBox(height: 3.h),
                  Text(
                    '▣ ${BookingMockData.days[state.selectedDateIndex]}, Oct ${BookingMockData.dates[state.selectedDateIndex]} • ${state.selectedTime}',
                    style: BookingStyle.body(
                      11,
                    ).copyWith(color: BookingStyle.muted),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 19.h),
        const Divider(height: 1, color: BookingStyle.border),
        SizedBox(height: 14.h),
        _SummaryLine(
          label: 'Court Fee (${state.selectedDuration ~/ 60} hrs)',
          value: '\$${cubit.courtFee.toStringAsFixed(2)}',
        ),
        _SummaryLine(
          label: 'Equipment Rental',
          value: '\$${cubit.equipmentTotal.toStringAsFixed(2)}',
        ),
        _SummaryLine(
          label: 'Service Fee',
          value: '\$${cubit.serviceFee.toStringAsFixed(2)}',
        ),
        if (state.discount > 0)
          Container(
            margin: EdgeInsets.only(top: 4.h, bottom: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF8E1),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: _SummaryLine(
              label: '✓ Promo (SUMMER20)',
              value: '-\$${state.discount.toStringAsFixed(2)}',
              color: const Color(0xFF5F8E48),
            ),
          ),
        SizedBox(height: 6.h),
        const Divider(height: 1, color: BookingStyle.border),
        SizedBox(height: 14.h),
        _SummaryLine(
          label: 'Total',
          value: '\$${cubit.total.toStringAsFixed(2)}',
          bold: true,
        ),
        SizedBox(height: 24.h),
        BookingPrimaryButton(
          label: 'Pay Securely',
          icon: Icons.lock_outline_rounded,
          onPressed: context.read<BookingPaymentCubit>().paySecurely,
        ),
        SizedBox(height: 13.h),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.verified_user_outlined,
                size: 14.sp,
                color: BookingStyle.muted,
              ),
              SizedBox(width: 5.w),
              Text(
                'Encrypted & Secure',
                style: BookingStyle.body(
                  12,
                ).copyWith(color: BookingStyle.muted),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _SummaryLine extends StatelessWidget {
  const _SummaryLine({
    required this.label,
    required this.value,
    this.color,
    this.bold = false,
  });

  final String label;
  final String value;
  final Color? color;
  final bool bold;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(bottom: bold ? 0 : 10.h),
    child: Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: BookingStyle.body(
              bold ? 14 : 12,
              weight: bold ? FontWeight.w500 : FontWeight.w400,
            ).copyWith(color: color ?? BookingStyle.ink),
          ),
        ),
        Text(
          value,
          style: BookingStyle.body(
            bold ? 14 : 12,
            weight: bold ? FontWeight.w500 : FontWeight.w400,
          ).copyWith(color: color ?? BookingStyle.ink),
        ),
      ],
    ),
  );
}
