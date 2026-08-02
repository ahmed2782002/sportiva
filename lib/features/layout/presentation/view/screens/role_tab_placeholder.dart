import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/common/role_selection/data/model/account_role.dart';

class RoleTabPlaceholder extends StatelessWidget {
  const RoleTabPlaceholder({
    super.key,
    required this.titleKey,
    required this.icon,
    required this.role,
  });

  final String titleKey;
  final IconData icon;
  final AccountRole role;

  @override
  Widget build(BuildContext context) {
    final titleText = titleKey.tr();
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Badge & Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    titleText,
                    style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary50,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: AppColors.borderSubtle),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(role.icon, size: 16.sp, color: AppColors.primaryColor),
                        SizedBox(width: 6.w),
                        Text(
                          role.title,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),

              // Placeholder Central Card
              Expanded(
                child: Center(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    padding: EdgeInsets.all(28.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(28.r),
                      border: Border.all(color: AppColors.borderSubtle.withValues(alpha: 0.6)),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryColor.withValues(alpha: 0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 80.w,
                          height: 80.h,
                          decoration: const BoxDecoration(
                            gradient: AppColors.cardGradient,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            icon,
                            size: 38.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          titleText,
                          style: TextStyle(
                            color: AppColors.primaryDark,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'قسم $titleText الخاص بـ ${role.title} تحت التطوير حالياً',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.neutral600,
                            fontSize: 14.sp,
                            height: 1.4,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.tertiary50,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.auto_awesome_rounded,
                                size: 18.sp,
                                color: AppColors.tertiaryColor,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                AppString.appName,
                                style: TextStyle(
                                  color: AppColors.tertiaryColor,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
