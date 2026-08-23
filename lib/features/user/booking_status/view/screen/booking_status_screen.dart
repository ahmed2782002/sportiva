import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/booking_flow/view_models/booking_flow_cubit.dart';
import 'package:sportive/features/user/booking_flow/view_models/booking_flow_state.dart';

import 'package:sportive/features/user/booking_shared/view/widget/booking_buttons.dart';
import 'package:sportive/features/user/booking_shared/view/widget/booking_style.dart';

class BookingStatusScreen extends StatelessWidget {
  const BookingStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingFlowCubit>();
    final state = context.watch<BookingFlowCubit>().state;

    return Scaffold(
      backgroundColor: BookingStyle.background,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(32.w, 18.h, 32.w, 40.h),
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: cubit.back,
                  icon: const Icon(Icons.arrow_back_rounded),
                  iconSize: 27.sp,
                  color: BookingStyle.primary,
                  padding: EdgeInsets.zero,
                ),
                const Spacer(),
                Text(
                  'Skip',
                  style: BookingStyle.body(
                    14,
                  ).copyWith(color: BookingStyle.primary),
                ),
              ],
            ),
            SizedBox(height: 72.h),
            Text(
              'Booking Status',
              style: BookingStyle.heading(
                34,
              ).copyWith(color: BookingStyle.primary),
            ),
            SizedBox(height: 16.h),
            Text(
              'Please review the issues below before\nproceeding.',
              style: BookingStyle.body(18).copyWith(color: BookingStyle.muted),
            ),
            SizedBox(height: 55.h),
            Container(
              padding: EdgeInsets.fromLTRB(39.w, 40.h, 30.w, 38.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD8D4),
                borderRadius: BorderRadius.circular(22.r),
                border: Border.all(color: const Color(0xFFFFBDB7)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.error_outline_rounded,
                        color: AppColors.red,
                        size: 27.sp,
                      ),
                      SizedBox(width: 24.w),
                      Expanded(
                        child: Text(
                          'Slot Became\nUnavailable',
                          style: BookingStyle.heading(
                            25,
                          ).copyWith(color: AppColors.red),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.only(left: 64.w),
                    child: Text(
                      'The time slot you selected\n(Thursday, 4:00 PM) was just\nbooked by someone else. Would\nyou like to select another time or\njoin the waitlist?',
                      style: BookingStyle.body(
                        17,
                      ).copyWith(color: AppColors.red),
                    ),
                  ),
                  SizedBox(height: 29.h),
                  Padding(
                    padding: EdgeInsets.only(left: 64.w),
                    child: Column(
                      children: [
                        BookingSecondaryButton(
                          label: 'Select New Time',
                          onPressed: cubit.selectNewTime,
                        ),
                        SizedBox(height: 18.h),
                        BookingPrimaryButton(
                          label: 'Join Waitlist',
                          icon: Icons.notifications_none_rounded,
                          onPressed: cubit.joinWaitlist,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 39.h),
            _StatusPaymentSummary(state: state),
            SizedBox(height: 50.h),
            Align(
              alignment: Alignment.centerRight,
              child: Opacity(
                opacity: 0.45,
                child: SizedBox(
                  width: 220.w,
                  child: BookingPrimaryButton(
                    label: 'Continue to Payment',
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusPaymentSummary extends StatelessWidget {
  const _StatusPaymentSummary({required this.state});

  final BookingFlowState state;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.fromLTRB(39.w, 41.h, 39.w, 39.h),
    decoration: BookingStyle.card(radius: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Summary',
          style: BookingStyle.heading(
            28,
            weight: FontWeight.w500,
          ).copyWith(color: BookingStyle.primary),
        ),
        SizedBox(height: 32.h),
        const _StatusSummaryLine(label: 'Session Fee', value: '\$45.00'),
        SizedBox(height: 18.h),
        const Divider(height: 1, color: BookingStyle.border),
        SizedBox(height: 29.h),
        Text(
          'Promo Code',
          style: BookingStyle.body(
            14,
            weight: FontWeight.w500,
          ).copyWith(color: BookingStyle.muted),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 61.h,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: BookingStyle.pale,
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(color: const Color(0xFFE04545)),
                ),
                child: Text(
                  state.promoCode.isEmpty ? 'SUMMER24' : state.promoCode,
                  style: BookingStyle.body(20).copyWith(color: AppColors.red),
                ),
              ),
            ),
            SizedBox(width: 13.w),
            SizedBox(
              height: 61.h,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: BookingStyle.border),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
                child: Text(
                  'Apply',
                  style: BookingStyle.body(
                    16,
                    weight: FontWeight.w600,
                  ).copyWith(color: BookingStyle.primary),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              size: 19.sp,
              color: AppColors.red,
            ),
            SizedBox(width: 7.w),
            Expanded(
              child: Text(
                state.promoError ?? 'Invalid Promo Code. Please try again.',
                style: BookingStyle.body(13).copyWith(color: AppColors.red),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class _StatusSummaryLine extends StatelessWidget {
  const _StatusSummaryLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: Text(
          label,
          style: BookingStyle.body(16).copyWith(color: BookingStyle.muted),
        ),
      ),
      Text(value, style: BookingStyle.body(16, weight: FontWeight.w500)),
    ],
  );
}
