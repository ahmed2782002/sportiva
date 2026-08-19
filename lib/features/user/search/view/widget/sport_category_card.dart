import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/shared/model/sport_filter_model.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class SportCategoryCard extends StatelessWidget {
  const SportCategoryCard({
    super.key,
    required this.sport,
    required this.isSelected,
    required this.onTap,
  });

  final SportFilterModel sport;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: UserStyle.softShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            sport.icon,
            size: 28.sp,
            color: isSelected ? AppColors.white : AppColors.primaryColor,
          ),
          SizedBox(height: 10.h),
          Text(
            sport.label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: isSelected ? AppColors.white : AppColors.neutral900,
            ),
          ),
        ],
      ),
    ),
  );
}
