import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';

class VenueQuickActions extends StatelessWidget {
  const VenueQuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      {'key': AppString.addSlot, 'icon': Icons.add_circle_rounded},
      {'key': AppString.editPrice, 'icon': Icons.edit_calendar_rounded},
      {'key': AppString.scheduleMaintenance, 'icon': Icons.build_circle_rounded},
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.quickActions.tr(),
            style: TextStyle(
              color: AppColors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: actions.map((a) {
              return GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      width: 52.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(18.r),
                        border: Border.all(color: AppColors.white.withValues(alpha: 0.15)),
                      ),
                      child: Icon(a['icon'] as IconData, color: AppColors.white, size: 24.sp),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      (a['key'] as String).tr(),
                      style: TextStyle(
                        color: AppColors.primary100,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
