import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';

class CoachTodaySchedule extends StatelessWidget {
  const CoachTodaySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    final sessions = [
      {
        'timeKey': AppString.session1Time,
        'traineeKey': AppString.session1Trainee,
        'typeKey': AppString.session1Type,
        'isUpcoming': true,
      },
      {
        'timeKey': AppString.session2Time,
        'traineeKey': AppString.session2Trainee,
        'typeKey': AppString.session2Type,
        'isUpcoming': false,
      },
    ];

    return Column(
      children: sessions.map((s) {
        final isUpcoming = s['isUpcoming'] as bool;
        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: isUpcoming ? AppColors.primaryDark : AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: isUpcoming ? Colors.transparent : AppColors.borderSubtle,
            ),
            boxShadow: isUpcoming
                ? [
                    BoxShadow(
                      color: AppColors.primaryDark.withValues(alpha: 0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    )
                  ]
                : null,
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: isUpcoming
                      ? AppColors.white.withValues(alpha: 0.1)
                      : AppColors.primary50,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Text(
                  (s['timeKey'] as String).tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isUpcoming ? AppColors.primary100 : AppColors.primaryColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (s['traineeKey'] as String).tr(),
                      style: TextStyle(
                        color: isUpcoming ? AppColors.white : AppColors.primaryDark,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      (s['typeKey'] as String).tr(),
                      style: TextStyle(
                        color: isUpcoming ? AppColors.primary300 : AppColors.neutral600,
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: isUpcoming
                      ? AppColors.white.withValues(alpha: 0.1)
                      : AppColors.primary50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12.sp,
                  color: isUpcoming ? AppColors.white : AppColors.primaryColor,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
