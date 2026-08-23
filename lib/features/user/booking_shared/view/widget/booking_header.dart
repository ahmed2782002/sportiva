import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'booking_style.dart';

class BookingHeader extends StatelessWidget {
  const BookingHeader({
    super.key,
    required this.onBack,
    this.title = 'Booking',
    this.onSkip,
  });

  final VoidCallback onBack;
  final String title;
  final VoidCallback? onSkip;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.fromLTRB(14.w, 10.h, 14.w, 0),
    child: Row(
      children: [
        IconButton(
          onPressed: onBack,
          icon: const Icon(Icons.arrow_back_rounded),
          color: BookingStyle.primary,
          iconSize: 25.sp,
          splashRadius: 22.r,
        ),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: BookingStyle.heading(
              20,
              weight: FontWeight.w700,
            ).copyWith(color: BookingStyle.primary),
          ),
        ),
        TextButton(
          onPressed: onSkip ?? onBack,
          style: TextButton.styleFrom(foregroundColor: BookingStyle.primary),
          child: Text('Skip', style: BookingStyle.body(12)),
        ),
      ],
    ),
  );
}

class BookingStepProgress extends StatelessWidget {
  const BookingStepProgress({
    super.key,
    required this.step,
    required this.label,
  });

  final int step;
  final String label;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.fromLTRB(14.w, 10.h, 14.w, 0),
    child: Column(
      children: [
        Row(
          children: [
            Text('Step $step of 3', style: BookingStyle.body(12)),
            const Spacer(),
            Text(label, style: BookingStyle.body(12, weight: FontWeight.w500)),
          ],
        ),
        SizedBox(height: 5.h),
        Row(
          children: List.generate(
            3,
            (index) => Expanded(
              child: Container(
                height: 3.h,
                margin: EdgeInsets.only(right: index == 2 ? 0 : 5.w),
                decoration: BoxDecoration(
                  color: index < step
                      ? BookingStyle.primary
                      : const Color(0xFFE1DEE2),
                  borderRadius: BorderRadius.circular(3.r),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
