import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';

class UpcomingMatchCard extends StatelessWidget {
  const UpcomingMatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF461A3B).withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  AppString.upcomingMatch.tr(),
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.access_time_rounded, color: AppColors.primary200, size: 14.sp),
                  SizedBox(width: 4.w),
                  Text(
                    AppString.todayMatchTime.tr(),
                    style: TextStyle(
                      color: AppColors.primary200,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 18.h),
          Text(
            AppString.demoVenueName.tr(),
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.location_on_rounded, color: AppColors.primary300, size: 14.sp),
              SizedBox(width: 4.w),
              Text(
                '${AppString.demoVenueLocation.tr()} • ${AppString.demoVenuePrice.tr()}',
                style: TextStyle(
                  color: AppColors.primary300,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              SizedBox(
                width: 70.w,
                height: 28.h,
                child: Stack(
                  children: List.generate(3, (i) {
                    return Positioned(
                      left: (i * 18).toDouble(),
                      child: Container(
                        width: 28.w,
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary400,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.primaryDark, width: 1.5),
                        ),
                        child: Icon(Icons.person, color: AppColors.white, size: 14.sp),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                '+3 لاعبين',
                style: TextStyle(color: AppColors.primary300, fontSize: 12.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
