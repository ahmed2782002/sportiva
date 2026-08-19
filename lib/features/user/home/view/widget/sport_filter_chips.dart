import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/shared/datasource/user_mock_data.dart';

class SportFilterChips extends StatelessWidget {
  const SportFilterChips({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 42.h,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: UserMockData.sportFilters.length,
      separatorBuilder: (_, _) => SizedBox(width: 10.w),
      itemBuilder: (context, index) {
        final sport = UserMockData.sportFilters[index];
        final isSelected = index == selectedIndex;

        return GestureDetector(
          onTap: () => onSelected(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primaryColor : AppColors.white,
              borderRadius: BorderRadius.circular(21.r),
              border: Border.all(
                color: isSelected ? AppColors.primaryColor : AppColors.neutral200,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.primaryColor.withValues(alpha: 0.25),
                        blurRadius: 14.r,
                        offset: Offset(0, 6.h),
                      ),
                    ]
                  : null,
            ),
            child: Text(
              sport.label,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected ? AppColors.white : AppColors.neutral700,
              ),
            ),
          ),
        );
      },
    ),
  );
}
