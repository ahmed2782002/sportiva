import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';

class VenuePitchesStatus extends StatelessWidget {
  const VenuePitchesStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final pitches = [
      {'nameKey': AppString.pitch1Name, 'statusKey': AppString.pitchStatusBooked, 'isBooked': true},
      {'nameKey': AppString.pitch2Name, 'statusKey': AppString.pitchStatusAvailable, 'isBooked': false},
      {'nameKey': AppString.pitch3Name, 'statusKey': AppString.pitchStatusAvailable, 'isBooked': false},
    ];

    return Column(
      children: pitches.map((p) {
        final isBooked = p['isBooked'] as bool;
        return Container(
          margin: EdgeInsets.only(bottom: 10.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(
              color: isBooked
                  ? AppColors.primaryColor.withValues(alpha: 0.2)
                  : AppColors.borderSubtle,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: isBooked ? AppColors.primary50 : AppColors.tertiary50,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Icon(
                      Icons.stadium_rounded,
                      color: isBooked ? AppColors.primaryColor : AppColors.tertiaryColor,
                      size: 18.sp,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    (p['nameKey'] as String).tr(),
                    style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: isBooked ? AppColors.primary50 : AppColors.tertiary50,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Text(
                  (p['statusKey'] as String).tr(),
                  style: TextStyle(
                    color: isBooked ? AppColors.primaryColor : AppColors.tertiaryColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
