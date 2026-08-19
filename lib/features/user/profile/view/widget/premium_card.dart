import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({super.key, required this.renewDate, this.onManage});

  final String renewDate;
  final VoidCallback? onManage;

  @override
  Widget build(BuildContext context) => Container(
    clipBehavior: Clip.antiAlias,
    padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 20.h),
    decoration: BoxDecoration(
      gradient: AppColors.userHeaderGradient,
      borderRadius: BorderRadius.circular(24.r),
      boxShadow: [
        BoxShadow(
          color: AppColors.primaryColor.withValues(alpha: 0.3),
          blurRadius: 24.r,
          offset: Offset(0, 10.h),
        ),
      ],
    ),
    child: Stack(
      children: [
        PositionedDirectional(
          end: -30.w,
          top: -40.h,
          child: Container(
            width: 130.r,
            height: 130.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white.withValues(alpha: 0.05),
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
                  Icons.workspace_premium_rounded,
                  size: 16.sp,
                  color: AppColors.primary100,
                ),
                SizedBox(width: 6.w),
                Text(
                  AppString.premium.tr(),
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.1,
                    color: AppColors.primary100,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              AppString.sportivaPlus.tr(),
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w900,
                color: AppColors.white,
                letterSpacing: -0.4,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.tertiary500.withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6.r,
                        height: 6.r,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.tertiary200,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        AppString.activePlan.tr(),
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  AppString.renewsOn.tr(args: [renewDate]),
                  style: TextStyle(
                    fontSize: 12.5.sp,
                    color: AppColors.white.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.h),
            GestureDetector(
              onTap: onManage,
              child: Container(
                height: 48.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Text(
                  AppString.manage.tr(),
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
