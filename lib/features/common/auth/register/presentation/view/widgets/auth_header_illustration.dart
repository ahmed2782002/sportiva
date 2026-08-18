import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';

class AuthHeaderIllustration extends StatelessWidget {
  const AuthHeaderIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        gradient: const LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.primaryDark,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDark.withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: Stack(
          children: [
            // Background abstract circles
            Positioned(
              top: -20.h,
              right: -20.w,
              child: Container(
                width: 120.w,
                height: 120.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white.withValues(alpha: 0.07),
                ),
              ),
            ),
            Positioned(
              bottom: -30.h,
              left: -10.w,
              child: Container(
                width: 140.w,
                height: 140.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white.withValues(alpha: 0.05),
                ),
              ),
            ),

            // Central graphics content
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Floating accent badge left
                  const _FloatingBadge(
                    icon: Icons.fitness_center_rounded,
                    label: "Sportiva",
                    angle: -0.04,
                  ),
                  SizedBox(width: 14.w),

                  // Center main hero circle badge
                  Container(
                    width: 72.w,
                    height: 72.h,
                    padding: EdgeInsets.all(14.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white.withValues(alpha: 0.18),
                      border: Border.all(
                        color: AppColors.white.withValues(alpha: 0.35),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 14,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const FittedBox(
                      child: Icon(
                        Icons.sports_soccer_rounded,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 14.w),

                  // Floating accent badge right
                  const _FloatingBadge(
                    icon: Icons.emoji_events_rounded,
                    label: "Pro",
                    angle: 0.04,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FloatingBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final double angle;

  const _FloatingBadge({
    required this.icon,
    required this.label,
    required this.angle,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.14),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.white.withValues(alpha: 0.25),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16.sp,
              color: AppColors.white,
            ),
            SizedBox(width: 6.w),
            Text(
              label,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
