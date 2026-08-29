import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class PlanTierCard extends StatelessWidget {
  final String title;
  final String price;
  final String billingPeriod;
  final bool isSelected;
  final bool isPopular;
  final List<String> features;
  final VoidCallback onTap;

  const PlanTierCard({
    super.key,
    required this.title,
    required this.price,
    required this.billingPeriod,
    required this.isSelected,
    this.isPopular = false,
    required this.features,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.all(18.r),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : AppColors.white.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.neutral200,
            width: isSelected ? 2.5 : 1,
          ),
          boxShadow: isSelected ? UserStyle.liftedShadow : UserStyle.softShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary50 : AppColors.neutral100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isSelected ? Icons.workspace_premium_rounded : Icons.star_outline_rounded,
                        color: isSelected ? AppColors.primaryColor : AppColors.neutral500,
                        size: 22.sp,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.5.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.neutral900,
                      ),
                    ),
                  ],
                ),
                if (isPopular)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      'MOST POPULAR',
                      style: TextStyle(
                        fontSize: 9.5.sp,
                        fontWeight: FontWeight.w900,
                        color: AppColors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 14.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w900,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(width: 4.w),
                Text(
                  '/$billingPeriod',
                  style: UserStyle.caption(),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            Divider(color: AppColors.neutral200, height: 1.h),
            SizedBox(height: 12.h),
            ...features.map((feat) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    size: 16.sp,
                    color: AppColors.tertiary300,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      feat,
                      style: TextStyle(
                        fontSize: 12.5.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.neutral700,
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
