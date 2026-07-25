import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/app_colors.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.background,
    body: SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 28.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SPORTIVA',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.6,
              ),
            ),
            SizedBox(height: 64.h),
            Text(
              title,
              style: TextStyle(
                color: AppColors.primaryDark,
                fontSize: 30.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              subtitle,
              style: TextStyle(
                color: AppColors.gray,
                fontSize: 15.sp,
                height: 1.5,
              ),
            ),
            SizedBox(height: 38.h),
            child,
          ],
        ),
      ),
    ),
  );
}
