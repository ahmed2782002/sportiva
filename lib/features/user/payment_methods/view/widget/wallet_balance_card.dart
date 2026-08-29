import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class WalletBalanceCard extends StatelessWidget {
  final double balance;
  final VoidCallback onTopUp;

  const WalletBalanceCard({
    super.key,
    required this.balance,
    required this.onTopUp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        gradient: AppColors.userHeaderGradient,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: UserStyle.liftedShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SPORTIVA WALLET',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.white.withValues(alpha: 0.7),
                  letterSpacing: 0.8,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                '${balance.toStringAsFixed(2)} EGP',
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w900,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: onTopUp,
            icon: Icon(Icons.add_rounded, size: 18.sp),
            label: const Text('Top Up'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              foregroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}
