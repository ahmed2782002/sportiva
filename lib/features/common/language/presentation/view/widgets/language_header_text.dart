import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../core/utils/constants/app_strings.dart';
import '../../../../../../core/utils/constants/app_text_font.dart';
class LanguageHeaderText extends StatelessWidget {
  const LanguageHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppString.chooseYourLanguage,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontManger.medium,
            color: AppColors.primaryLight,
            letterSpacing: 2.5,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          AppString.chooseYourLanguageAr,
          style: TextStyle(
            fontSize: 34.sp,
            fontWeight: FontManger.extraBold,
            color: AppColors.primaryDark,
            letterSpacing: -0.5,
            height: 1.1,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          width: 48.w,
          height: 3.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        SizedBox(height: 14.h),
        Text(
          AppString.selectYourPreferredLanguage,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontManger.regular,
            color: AppColors.splashText.withValues(alpha: 0.7),
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
