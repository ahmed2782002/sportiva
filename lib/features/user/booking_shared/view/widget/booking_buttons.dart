import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/features/user/shared/view/widget/user_style.dart';
import 'booking_style.dart';

class BookingPrimaryButton extends StatelessWidget {
  const BookingPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    height: 48.h,
    child: ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon == null ? const SizedBox.shrink() : Icon(icon, size: 19.sp),
      label: Text(
        label,
        style: BookingStyle.body(
          14,
          weight: FontWeight.w600,
        ).copyWith(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: BookingStyle.darkPrimary,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    ),
  );
}

class BookingSecondaryButton extends StatelessWidget {
  const BookingSecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    height: 48.h,
    child: OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon == null
          ? const SizedBox.shrink()
          : Icon(icon, size: 19.sp, color: BookingStyle.ink),
      label: Text(label, style: BookingStyle.body(14, weight: FontWeight.w600)),
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: BookingStyle.ink,
        side: BorderSide(color: BookingStyle.border),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    ),
  );
}

class BookingBottomBar extends StatelessWidget {
  const BookingBottomBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
    required this.onPressed,
  });

  final String title;
  final String subtitle;
  final String buttonLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 19.h),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: UserStyle.liftedShadow,
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: BookingStyle.body(13, weight: FontWeight.w500),
              ),
              SizedBox(height: 2.h),
              Text(
                subtitle,
                style: BookingStyle.heading(
                  22,
                  weight: FontWeight.w500,
                ).copyWith(color: BookingStyle.primary),
              ),
            ],
          ),
        ),
        SizedBox(width: 14.w),
        SizedBox(
          width: 185.w,
          height: 58.h,
          child: ElevatedButton.icon(
            onPressed: onPressed,
            icon: const SizedBox.shrink(),
            label: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    buttonLabel,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: BookingStyle.body(
                      14,
                      weight: FontWeight.w700,
                    ).copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(width: 7.w),
                Icon(Icons.arrow_forward_rounded, size: 18.sp),
              ],
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: BookingStyle.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
              elevation: 0,
            ),
          ),
        ),
      ],
    ),
  );
}
