import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/user/shared/datasource/user_mock_data.dart';
import 'package:sportive/features/user/shared/view/widget/user_network_image.dart';

class UpcomingBookingCard extends StatelessWidget {
  const UpcomingBookingCard({super.key, this.onViewDetails});

  final VoidCallback? onViewDetails;

  @override
  Widget build(BuildContext context) => Container(
    clipBehavior: Clip.antiAlias,
    padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 18.h),
    decoration: BoxDecoration(
      gradient: AppColors.userHeaderGradient,
      borderRadius: BorderRadius.circular(24.r),
      boxShadow: [
        BoxShadow(
          color: AppColors.primaryColor.withValues(alpha: 0.30),
          blurRadius: 26.r,
          offset: Offset(0, 12.h),
        ),
      ],
    ),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        PositionedDirectional(
          top: -34.r,
          end: -34.r,
          child: Container(
            width: 110.r,
            height: 110.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white.withValues(alpha: 0.06),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 15.sp,
                  color: AppColors.primary100,
                ),
                SizedBox(width: 7.w),
                Text(
                  AppString.upcomingBooking.tr(),
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.1,
                    color: AppColors.primary100,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              'Padel at Elite Arena',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              'Today, 6:00 PM • Court 4',
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColors.white.withValues(alpha: 0.8),
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                const _AttendeesStack(),
                const Spacer(),
                GestureDetector(
                  onTap: onViewDetails,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 11.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Text(
                      AppString.viewDetails.tr(),
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

class _AttendeesStack extends StatelessWidget {
  const _AttendeesStack();

  @override
  Widget build(BuildContext context) {
    final avatars = UserMockData.community.take(2).toList();

    return SizedBox(
      height: 32.r,
      width: 88.w,
      child: Stack(
        children: [
          for (var index = 0; index < avatars.length; index++)
            PositionedDirectional(
              start: (index * 21).w,
              child: Container(
                padding: EdgeInsets.all(1.5.r),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
                child: ClipOval(
                  child: UserNetworkImage(
                    url: avatars[index].imageUrl,
                    width: 28.r,
                    height: 28.r,
                    fallbackIcon: Icons.person_rounded,
                  ),
                ),
              ),
            ),
          PositionedDirectional(
            start: 42.w,
            child: Container(
              width: 31.r,
              height: 31.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary100,
                border: Border.all(color: AppColors.white, width: 1.5),
              ),
              child: Text(
                '+2',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
