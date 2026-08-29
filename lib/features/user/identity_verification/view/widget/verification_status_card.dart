import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/identity_verification/view_models/identity_verification_state.dart';

class VerificationStatusCard extends StatelessWidget {
  final VerificationStatus status;

  const VerificationStatusCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color border;
    IconData icon;
    String title;
    String subtitle;

    switch (status) {
      case VerificationStatus.verified:
        bg = AppColors.tertiary50;
        border = AppColors.tertiary300;
        icon = Icons.verified_user_rounded;
        title = 'Identity Verified';
        subtitle = 'Your identity documents have been authenticated & verified.';
        break;
      case VerificationStatus.pending:
        bg = Colors.amber.shade50;
        border = Colors.amber.shade400;
        icon = Icons.hourglass_top_rounded;
        title = 'Verification Pending';
        subtitle = 'Your documents are being reviewed by our compliance team.';
        break;
      case VerificationStatus.unverified:
        bg = AppColors.primary50;
        border = AppColors.primary200;
        icon = Icons.gpp_maybe_rounded;
        title = 'Identity Not Verified';
        subtitle = 'Upload your ID to unlock premium venue features & competitions.';
        break;
    }

    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: border, width: 1.5),
      ),
      child: Row(
        children: [
          Icon(icon, color: border, size: 36.sp),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.neutral900,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.neutral700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
