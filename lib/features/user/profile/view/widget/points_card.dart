import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class PointsCard extends StatelessWidget {
  const PointsCard({
    super.key,
    required this.points,
    required this.pointsToReward,
    this.onTap,
  });

  final int points;
  final int pointsToReward;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const rewardTarget = 3000;
    final progress = (points / rewardTarget).clamp(0.0, 1.0);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(16.w, 14.h, 14.w, 14.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.primary100),
          boxShadow: UserStyle.softShadow,
        ),
        child: Row(
          children: [
            Container(
              width: 44.r,
              height: 44.r,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Icon(Icons.stars_rounded, size: 23.sp, color: AppColors.white),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.points.tr(),
                    style: TextStyle(
                      fontSize: 12.5.sp,
                      fontWeight: FontWeight.w700,
                      color: UserStyle.mutedText,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '$points ${AppString.points.tr()}',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w900,
                      color: AppColors.neutral900,
                    ),
                  ),
                  SizedBox(height: 7.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 5.h,
                      backgroundColor: AppColors.primary50,
                      valueColor: const AlwaysStoppedAnimation(
                        AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    AppString.pointsToNextReward.tr(args: ['$pointsToReward']),
                    style: TextStyle(fontSize: 10.5.sp, color: UserStyle.mutedText),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Icon(Icons.arrow_forward_ios_rounded, size: 14.sp, color: AppColors.neutral400),
          ],
        ),
      ),
    );
  }
}
