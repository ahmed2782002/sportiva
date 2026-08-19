import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/user/bookings/view_models/user_bookings_state.dart';

class BookingTabs extends StatelessWidget {
  const BookingTabs({
    super.key,
    required this.currentTab,
    required this.onTabSelected,
  });

  final BookingsTab currentTab;
  final ValueChanged<BookingsTab> onTabSelected;

  String _label(BookingsTab tab) => switch (tab) {
    BookingsTab.upcoming => AppString.tabUpcoming.tr(),
    BookingsTab.completed => AppString.tabCompleted.tr(),
    BookingsTab.cancelled => AppString.tabCancelled.tr(),
  };

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(5.r),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(18.r),
    ),
    child: Row(
      children: BookingsTab.values.map((tab) {
        final isSelected = tab == currentTab;
        return Expanded(
          child: GestureDetector(
            onTap: () => onTabSelected(tab),
            behavior: HitTestBehavior.opaque,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 240),
              curve: Curves.easeOut,
              height: 40.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.colorTransparent,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Text(
                _label(tab),
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? AppColors.white : AppColors.neutral600,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
