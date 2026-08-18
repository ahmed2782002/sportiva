import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/nav.dart';
import 'auth_header_illustration.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    this.showBackButton = false,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    final canPop = showBackButton || Navigator.canPop(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar with Logo & Navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (canPop)
                    GestureDetector(
                      onTap: navigateBack,
                      child: Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(14.r),
                          border: Border.all(
                            color: AppColors.borderSubtle,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.03),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 18.sp,
                          color: AppColors.primaryDark,
                        ),
                      ),
                    )
                  else
                    const SizedBox.shrink(),

                  // Brand Title Badge
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLighter.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      'SPORTIVA',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              // Replaced the empty space with a modern artwork/illustration widget
              const AuthHeaderIllustration(),

              SizedBox(height: 24.h),

              // Screen Title
              Text(
                title,
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),

              SizedBox(height: 8.h),

              // Subtitle
              Text(
                subtitle,
                style: TextStyle(
                  color: AppColors.gray,
                  fontSize: 14.sp,
                  height: 1.4,
                ),
              ),

              SizedBox(height: 28.h),

              // Main Auth Form Content
              child,
            ],
          ),
        ),
      ),
    );
  }
}
