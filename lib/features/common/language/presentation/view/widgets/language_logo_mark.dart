import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../core/utils/constants/app_strings.dart';
import '../../../../../../core/utils/constants/app_text_font.dart';

class LanguageLogoMark extends StatelessWidget {
  const LanguageLogoMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.w,
      height: 72.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.35),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: Text(
          AppString.logoMarkChar,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 32.sp,
            fontWeight: FontManger.bold,
            height: 1,
          ),
        ),
      ),
    );
  }
}
