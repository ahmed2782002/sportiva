import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/user/shared/datasource/user_mock_data.dart';
import 'package:sportive/features/user/shared/view/widget/user_network_image.dart';

class HomeGreetingBar extends StatelessWidget {
  const HomeGreetingBar({super.key, this.onAvatarTap});

  final VoidCallback? onAvatarTap;

  String get _greetingKey {
    final hour = DateTime.now().hour;
    if (hour < 12) return AppString.goodMorning;
    if (hour < 18) return AppString.goodAfternoon;
    return AppString.goodEvening;
  }

  @override
  Widget build(BuildContext context) => Container(
    color: AppColors.white,
    padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 14.h),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${_greetingKey.tr()}, ${UserMockData.userName}!',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryColor,
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 3.h),
              Row(
                children: [
                  Icon(
                    Icons.wb_sunny_outlined,
                    size: 13.sp,
                    color: AppColors.neutral500,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    UserMockData.weather,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.neutral500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onAvatarTap,
          child: Container(
            padding: EdgeInsets.all(2.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary100, width: 1.5),
            ),
            child: ClipOval(
              child: UserNetworkImage(
                url: UserMockData.userAvatar,
                width: 38.r,
                height: 38.r,
                fallbackIcon: Icons.person_rounded,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
