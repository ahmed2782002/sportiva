import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';

class CoachMetricsGrid extends StatelessWidget {
  const CoachMetricsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final metrics = [
      {
        'titleKey': AppString.coachSessionsToday,
        'valueKey': AppString.coachSessionsValue,
        'trendKey': AppString.coachSessionsTrend,
        'icon': Icons.sports_rounded,
        'color': AppColors.primaryColor,
        'bg': AppColors.primary50,
      },
      {
        'titleKey': AppString.coachTraineesTitle,
        'valueKey': AppString.coachTraineesValue,
        'trendKey': AppString.coachTraineesTrend,
        'icon': Icons.groups_rounded,
        'color': AppColors.tertiaryColor,
        'bg': AppColors.tertiary50,
      },
      {
        'titleKey': AppString.coachEarningsTitle,
        'valueKey': AppString.coachEarningsValue,
        'trendKey': AppString.coachEarningsTrend,
        'icon': Icons.payments_rounded,
        'color': AppColors.secondary500,
        'bg': AppColors.secondary50,
      },
      {
        'titleKey': AppString.coachRatingTitle,
        'valueKey': AppString.coachRatingValue,
        'trendKey': AppString.coachRatingTrend,
        'icon': Icons.workspace_premium_rounded,
        'color': Colors.amber.shade800,
        'bg': Colors.amber.shade50,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 1.4,
      ),
      itemCount: metrics.length,
      itemBuilder: (context, index) {
        final item = metrics[index];
        final color = item['color'] as Color;
        final bg = item['bg'] as Color;
        return Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppColors.borderSubtle),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.06),
                blurRadius: 14,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: bg,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(item['icon'] as IconData, size: 18.sp, color: color),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: AppColors.primary50,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      (item['trendKey'] as String).tr(),
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (item['valueKey'] as String).tr(),
                    style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    (item['titleKey'] as String).tr(),
                    style: TextStyle(color: AppColors.neutral600, fontSize: 11.sp),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
