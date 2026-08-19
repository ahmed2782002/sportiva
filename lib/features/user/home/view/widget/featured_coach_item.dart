import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/shared/model/coach_model.dart';
import 'package:sportive/features/user/shared/view/widget/user_network_image.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class FeaturedCoachItem extends StatelessWidget {
  const FeaturedCoachItem({super.key, required this.coach, this.onTap});

  final CoachModel coach;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: 108.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(3.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
              boxShadow: UserStyle.softShadow,
            ),
            child: Container(
              padding: EdgeInsets.all(2.5.r),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
              child: ClipOval(
                child: UserNetworkImage(
                  url: coach.imageUrl,
                  width: 78.r,
                  height: 78.r,
                  fallbackIcon: Icons.person_rounded,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            coach.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.neutral900,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            coach.specialty,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 11.sp, color: UserStyle.mutedText),
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star_rounded,
                size: 13.sp,
                color: const Color(0xFFF5A623),
              ),
              SizedBox(width: 3.w),
              Text(
                coach.rating.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 11.5.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.neutral800,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
