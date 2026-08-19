import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class DiscoverSearchField extends StatelessWidget {
  const DiscoverSearchField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.onFilterTap,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback? onFilterTap;

  @override
  Widget build(BuildContext context) => Container(
    height: 54.h,
    padding: EdgeInsetsDirectional.only(start: 18.w, end: 8.w),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(27.r),
      boxShadow: UserStyle.softShadow,
    ),
    child: Row(
      children: [
        Icon(Icons.search_rounded, size: 20.sp, color: AppColors.neutral400),
        SizedBox(width: 10.w),
        Expanded(
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            textInputAction: TextInputAction.search,
            style: TextStyle(fontSize: 14.sp, color: AppColors.neutral900),
            decoration: InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              hintText: AppString.discoverSearchHint.tr(),
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color: AppColors.neutral400,
              ),
            ),
          ),
        ),
        Container(width: 1, height: 22.h, color: AppColors.neutral200),
        IconButton(
          onPressed: onFilterTap,
          icon: Icon(
            Icons.tune_rounded,
            size: 20.sp,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    ),
  );
}
