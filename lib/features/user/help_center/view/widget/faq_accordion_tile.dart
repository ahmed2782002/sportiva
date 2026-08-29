import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/help_center/view_models/help_center_state.dart';

class FaqAccordionTile extends StatelessWidget {
  final FaqItemModel item;
  final bool isExpanded;
  final VoidCallback onTap;

  const FaqAccordionTile({
    super.key,
    required this.item,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isExpanded ? AppColors.primaryColor : AppColors.neutral200,
        ),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: onTap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            title: Text(
              item.question,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.neutral900,
              ),
            ),
            trailing: Icon(
              isExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
              color: AppColors.primaryColor,
              size: 22.sp,
            ),
          ),
          if (isExpanded)
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
              child: Text(
                item.answer,
                style: TextStyle(
                  fontSize: 12.5.sp,
                  color: AppColors.neutral700,
                  height: 1.4,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
