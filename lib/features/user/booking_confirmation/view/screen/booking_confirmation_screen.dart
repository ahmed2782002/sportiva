import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/features/user/booking_flow/view_models/booking_flow_cubit.dart';
import 'package:sportive/features/user/booking_shared/data/datasource/booking_mock_data.dart';
import 'package:sportive/features/user/shared/view/widget/user_network_image.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

import 'package:sportive/features/user/booking_shared/view/widget/booking_buttons.dart';
import 'package:sportive/features/user/booking_shared/view/widget/booking_style.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingFlowCubit>();
    return Scaffold(
      backgroundColor: BookingStyle.background,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 22.h),
          children: [
            Row(
              children: [
                Container(
                  width: 46.r,
                  height: 46.r,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded),
                    color: BookingStyle.muted,
                  ),
                ),
                const Spacer(),
                Text(
                  'The Kinetic Gallery',
                  style: BookingStyle.heading(
                    17,
                    weight: FontWeight.w700,
                  ).copyWith(color: BookingStyle.primary),
                ),
                const Spacer(),
                SizedBox(width: 46.r),
              ],
            ),
            SizedBox(height: 38.h),
            Center(
              child: Container(
                width: 92.r,
                height: 92.r,
                decoration: const BoxDecoration(
                  color: BookingStyle.green,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle_outline_rounded,
                  color: BookingStyle.greenLight,
                  size: 49.sp,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              'Booking Confirmed',
              textAlign: TextAlign.center,
              style: BookingStyle.heading(
                30,
              ).copyWith(color: BookingStyle.primary),
            ),
            SizedBox(height: 9.h),
            Text(
              'Your court is reserved. Get ready to\nperform.',
              textAlign: TextAlign.center,
              style: BookingStyle.body(17).copyWith(color: BookingStyle.muted),
            ),
            SizedBox(height: 49.h),
            _ConfirmationTicket(cubit: cubit),
            SizedBox(height: 38.h),
            BookingPrimaryButton(
              label: 'Add to Apple Wallet',
              icon: Icons.account_balance_wallet_outlined,
              onPressed: () =>
                  _showMessage(context, 'Wallet pass ready to add.'),
            ),
            SizedBox(height: 18.h),
            BookingSecondaryButton(
              label: 'Add to Calendar',
              icon: Icons.calendar_month_outlined,
              onPressed: () =>
                  _showMessage(context, 'Booking added to your calendar.'),
            ),
            SizedBox(height: 18.h),
            BookingSecondaryButton(
              label: 'Share Details',
              icon: Icons.share_outlined,
              onPressed: () => _showMessage(context, 'Booking details copied.'),
            ),
            SizedBox(height: 29.h),
            Center(
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Return to Home',
                  style: BookingStyle.body(14, weight: FontWeight.w500)
                      .copyWith(
                        color: BookingStyle.primary,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          backgroundColor: BookingStyle.primary,
        ),
      );
}

class _ConfirmationTicket extends StatelessWidget {
  const _ConfirmationTicket({required this.cubit});

  final BookingFlowCubit cubit;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.fromLTRB(22.w, 36.h, 22.w, 32.h),
    decoration: BookingStyle.card(radius: 24),
    child: Column(
      children: [
        Text(
          'SCAN FOR ENTRY',
          style: BookingStyle.body(
            13,
            weight: FontWeight.w500,
          ).copyWith(letterSpacing: 2.1, color: BookingStyle.muted),
        ),
        SizedBox(height: 29.h),
        Container(
          width: 262.w,
          height: 262.w,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: BookingStyle.border),
            boxShadow: UserStyle.softShadow,
          ),
          child: Container(
            color: const Color(0xFFF5F5F5),
            alignment: Alignment.center,
            child: Icon(
              Icons.qr_code_2_rounded,
              size: 175.sp,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 18.h),
        Text(
          '#TKG-8472-X9',
          style: BookingStyle.body(
            15,
            weight: FontWeight.w500,
          ).copyWith(letterSpacing: 3.2, color: BookingStyle.muted),
        ),
        SizedBox(height: 33.h),
        const Divider(height: 1, color: BookingStyle.border),
        SizedBox(height: 36.h),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: UserNetworkImage(
                url: cubit.venue.imageUrl,
                width: 72.w,
                height: 72.w,
                fallbackIcon: Icons.location_city_rounded,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cubit.venue.name,
                    style: BookingStyle.heading(22, weight: FontWeight.w600),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '⌖ 142 West 29th St,\n   Gallery District',
                    style: BookingStyle.body(
                      14,
                    ).copyWith(color: BookingStyle.muted),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 35.h),
        Row(
          children: [
            Expanded(
              child: _TicketDetail(
                label: 'DATE',
                value:
                    '${BookingMockData.days[cubit.state.selectedDateIndex]}, Oct ${BookingMockData.dates[cubit.state.selectedDateIndex]}',
              ),
            ),
            Expanded(
              child: _TicketDetail(
                label: 'TIME',
                value: cubit.state.selectedTime,
              ),
            ),
          ],
        ),
        SizedBox(height: 27.h),
        Row(
          children: [
            Expanded(
              child: _TicketDetail(
                label: 'COURT',
                value: cubit.selectedCourt.name,
              ),
            ),
            Expanded(
              child: _TicketDetail(label: 'GUESTS', value: '4 Players'),
            ),
          ],
        ),
      ],
    ),
  );
}

class _TicketDetail extends StatelessWidget {
  const _TicketDetail({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: BookingStyle.body(
          11,
          weight: FontWeight.w500,
        ).copyWith(letterSpacing: 1.2, color: BookingStyle.muted),
      ),
      SizedBox(height: 6.h),
      Text(value, style: BookingStyle.body(17, weight: FontWeight.w500)),
    ],
  );
}
