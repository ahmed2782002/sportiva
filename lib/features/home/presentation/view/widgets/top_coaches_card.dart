import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/common/role_selection/data/model/account_role.dart';

class TopCoachesCard extends StatelessWidget {
  const TopCoachesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: AppColors.borderSubtle),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52.w,
            height: 52.h,
            decoration: const BoxDecoration(
              gradient: AppColors.primaryGradient,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(AccountRole.coach.icon, color: AppColors.white, size: 26.sp),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppString.coachDemoName.tr(),
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.star_rounded, color: Colors.amber.shade600, size: 14.sp),
                    SizedBox(width: 3.w),
                    Text(
                      '4.9',
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      AppString.coachDemoSpecialty.tr(),
                      style: TextStyle(color: AppColors.neutral600, fontSize: 11.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Text(
                AppString.bookSession.tr(),
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
