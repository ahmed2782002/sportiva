import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';

/// Shared surface tokens for the whole user experience so every card,
/// sheet and tile reads as part of one system.
class UserStyle {
  UserStyle._();

  static const Color canvas = Color(0xFFF7F5F8);
  static const Color mutedText = Color(0xFF7A7480);

  static List<BoxShadow> get softShadow => [
    BoxShadow(
      color: AppColors.primary900.withValues(alpha: 0.05),
      blurRadius: 24.r,
      offset: Offset(0, 8.h),
    ),
  ];

  static List<BoxShadow> get liftedShadow => [
    BoxShadow(
      color: AppColors.primary900.withValues(alpha: 0.10),
      blurRadius: 32.r,
      offset: Offset(0, 12.h),
    ),
  ];

  static BoxDecoration card({double radius = 20, bool lifted = false}) =>
      BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(radius.r),
        boxShadow: lifted ? liftedShadow : softShadow,
      );

  static TextStyle sectionTitle() => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.primaryDark,
    letterSpacing: -0.3,
  );

  static TextStyle cardTitle() => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.neutral900,
  );

  static TextStyle caption() =>
      TextStyle(fontSize: 12.5.sp, color: mutedText, height: 1.35);
}
