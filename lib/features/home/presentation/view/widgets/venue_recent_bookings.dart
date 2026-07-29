import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';

class VenueRecentBookings extends StatelessWidget {
  const VenueRecentBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: AppColors.borderSubtle),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.03),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _BookingItem(
            name: AppString.bookingUser1.tr(),
            venue: AppString.bookingVenue1.tr(),
            time: AppString.bookingTime1.tr(),
            price: AppString.bookingPrice1.tr(),
            isCompleted: false,
          ),
          Divider(height: 24.h, color: AppColors.borderSubtle),
          _BookingItem(
            name: AppString.bookingUser2.tr(),
            venue: AppString.bookingVenue2.tr(),
            time: AppString.bookingTime2.tr(),
            price: AppString.bookingPrice2.tr(),
            isCompleted: true,
          ),
        ],
      ),
    );
  }
}

class _BookingItem extends StatelessWidget {
  const _BookingItem({
    required this.name,
    required this.venue,
    required this.time,
    required this.price,
    required this.isCompleted,
  });

  final String name;
  final String venue;
  final String time;
  final String price;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.primary50,
              child: Icon(Icons.person_rounded, color: AppColors.primaryColor, size: 20.sp),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  '$venue • $time',
                  style: TextStyle(color: AppColors.neutral600, fontSize: 11.sp),
                ),
              ],
            ),
          ],
        ),
        Text(
          price,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
