import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';

class SportsCategoriesList extends StatelessWidget {
  const SportsCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'key': AppString.sportFootball, 'icon': Icons.sports_soccer_rounded},
      {'key': AppString.sportPadel, 'icon': Icons.sports_tennis_rounded},
      {'key': AppString.sportBasketball, 'icon': Icons.sports_basketball_rounded},
      {'key': AppString.sportSwimming, 'icon': Icons.pool_rounded},
      {'key': AppString.sportTableTennis, 'icon': Icons.sports_kabaddi_rounded},
    ];

    return SizedBox(
      height: 46.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          final cat = categories[index];
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              gradient: isSelected ? AppColors.primaryGradient : null,
              color: isSelected ? null : AppColors.white,
              borderRadius: BorderRadius.circular(22.r),
              border: Border.all(
                color: isSelected ? Colors.transparent : AppColors.borderSubtle,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.primaryColor.withValues(alpha: 0.25),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      )
                    ]
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  cat['icon'] as IconData,
                  size: 18.sp,
                  color: isSelected ? AppColors.white : AppColors.neutral600,
                ),
                SizedBox(width: 8.w),
                Text(
                  (cat['key'] as String).tr(),
                  style: TextStyle(
                    color: isSelected ? AppColors.white : AppColors.neutral700,
                    fontSize: 13.sp,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
