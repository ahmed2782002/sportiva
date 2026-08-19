import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';

class FlashDealCard extends StatelessWidget {
  const FlashDealCard({super.key, this.onClaim});

  final VoidCallback? onClaim;

  @override
  Widget build(BuildContext context) => Container(
    clipBehavior: Clip.antiAlias,
    padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 20.h),
    decoration: BoxDecoration(
      gradient: AppColors.primaryGradient,
      borderRadius: BorderRadius.circular(24.r),
      boxShadow: [
        BoxShadow(
          color: AppColors.primaryColor.withValues(alpha: 0.28),
          blurRadius: 24.r,
          offset: Offset(0, 10.h),
        ),
      ],
    ),
    child: Stack(
      children: [
        PositionedDirectional(
          end: 0,
          top: 0,
          bottom: 0,
          child: _DiscountPattern(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                AppString.limitedOffer.tr(),
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              '50% OFF',
              style: TextStyle(
                fontSize: 32.sp,
                height: 1.05,
                fontWeight: FontWeight.w900,
                color: AppColors.white,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              'Morning slots at Downtown Padel',
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColors.white.withValues(alpha: 0.85),
              ),
            ),
            SizedBox(height: 18.h),
            GestureDetector(
              onTap: onClaim,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 13.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Text(
                  AppString.claimNow.tr(),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class _DiscountPattern extends StatelessWidget {
  const _DiscountPattern();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112.w,
      child: Transform.rotate(
        angle: -0.25,
        child: Center(
          child: Text(
            '%',
            style: TextStyle(
              fontSize: 100.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.white.withValues(alpha: 0.13),
            ),
          ),
        ),
      ),
    );
  }
}

class FlashDealTimer extends StatelessWidget {
  const FlashDealTimer({super.key, required this.countdown});

  final String countdown;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
    decoration: BoxDecoration(
      color: const Color(0xFFFDECEC),
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.timer_outlined,
          size: 13.sp,
          color: const Color(0xFFE04545),
        ),
        SizedBox(width: 5.w),
        Text(
          countdown,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w800,
            color: const Color(0xFFE04545),
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ],
    ),
  );
}
