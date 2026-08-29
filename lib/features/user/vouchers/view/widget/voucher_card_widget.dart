import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/vouchers/view_models/vouchers_state.dart';

class VoucherCardWidget extends StatelessWidget {
  final VoucherModel voucher;

  const VoucherCardWidget({super.key, required this.voucher});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: voucher.isExpired ? AppColors.neutral300 : AppColors.primary100,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.r),
        child: IntrinsicHeight(
          child: Row(
            children: [
              // Left Banner
              Container(
                width: 100.w,
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  gradient: voucher.isExpired
                      ? const LinearGradient(colors: [AppColors.neutral400, AppColors.neutral500])
                      : AppColors.primaryGradient,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.confirmation_number_rounded,
                      color: AppColors.white,
                      size: 26.sp,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      voucher.discountText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // Right Content
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(14.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        voucher.title,
                        style: TextStyle(
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w800,
                          color: voucher.isExpired ? AppColors.neutral500 : AppColors.neutral900,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        voucher.minBooking,
                        style: TextStyle(
                          fontSize: 11.5.sp,
                          color: AppColors.neutral600,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                            decoration: BoxDecoration(
                              color: AppColors.neutral100,
                              borderRadius: BorderRadius.circular(6.r),
                              border: Border.all(color: AppColors.neutral300),
                            ),
                            child: Text(
                              voucher.code,
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w800,
                                color: AppColors.primaryColor,
                                letterSpacing: 0.6,
                              ),
                            ),
                          ),
                          if (!voucher.isExpired)
                            GestureDetector(
                              onTap: () {
                                Clipboard.setData(ClipboardData(text: voucher.code));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Copied code "${voucher.code}"')),
                                );
                              },
                              child: Text(
                                'COPY CODE',
                                style: TextStyle(
                                  fontSize: 10.5.sp,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
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
