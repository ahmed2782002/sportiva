// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants/app_colors.dart';
import 'Button/master_button.dart';

class EmptyStateWidget extends StatelessWidget {
  final String? title;
  final String? message;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final IconData? imageAsset;
  final double? imageHeight;
  final Color? textColor;

  const EmptyStateWidget({
    super.key,
    this.title,
    this.message,
    this.buttonText,
    this.onButtonPressed,
    this.imageAsset,
    this.imageHeight,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final color =
        textColor ?? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7);

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageAsset != null)
              Icon(
                imageAsset!,
                size: (imageHeight ?? 120).h,
                color: AppColors.primaryColor,
              ),
            if (title != null) ...[
              SizedBox(height: 20.h),
              Text(
                title!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
            if (message != null) ...[
              SizedBox(height: 8.h),
              Text(
                message!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: color.withValues(alpha: 0.8),
                ),
              ),
            ],
            if (buttonText != null && onButtonPressed != null) ...[
              SizedBox(height: 24.h),
              MasterButton(onPressed: onButtonPressed, text: buttonText!),
            ],
          ],
        ),
      ),
    );
  }
}
