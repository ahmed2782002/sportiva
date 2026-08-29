import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/payment_methods/view_models/payment_methods_state.dart';

class SavedCardWidget extends StatelessWidget {
  final PaymentCardModel card;
  final bool isDefault;
  final VoidCallback onSelectDefault;

  const SavedCardWidget({
    super.key,
    required this.card,
    required this.isDefault,
    required this.onSelectDefault,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelectDefault,
      child: Container(
        margin: EdgeInsets.only(bottom: 14.h),
        padding: EdgeInsets.all(18.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: isDefault ? AppColors.primaryColor : AppColors.neutral200,
            width: isDefault ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                card.brand,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w900,
                  color: AppColors.neutral800,
                  letterSpacing: 0.8,
                ),
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '•••• •••• •••• ${card.lastFourDigits}',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.neutral900,
                        ),
                      ),
                      if (isDefault) ...[
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: AppColors.primary50,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Text(
                            'DEFAULT',
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w900,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    'Expires ${card.expiryDate} • ${card.cardHolder}',
                    style: TextStyle(
                      fontSize: 11.5.sp,
                      color: AppColors.neutral500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              isDefault ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
              color: isDefault ? AppColors.primaryColor : AppColors.neutral400,
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }
}
