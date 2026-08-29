import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';

class PointsHistoryTile extends StatelessWidget {
  final String title;
  final String date;
  final int points;
  final bool isEarned;

  const PointsHistoryTile({
    super.key,
    required this.title,
    required this.date,
    required this.points,
    required this.isEarned,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.neutral200),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: isEarned ? AppColors.tertiary50 : AppColors.secondary50,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isEarned ? Icons.add_circle_outline_rounded : Icons.remove_circle_outline_rounded,
              color: isEarned ? AppColors.tertiaryGreen : AppColors.secondary500,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13.5.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.neutral900,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 11.5.sp,
                    color: AppColors.neutral500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${isEarned ? '+' : '-'}$points PTS',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w800,
              color: isEarned ? AppColors.tertiaryGreen : AppColors.secondary500,
            ),
          ),
        ],
      ),
    );
  }
}
