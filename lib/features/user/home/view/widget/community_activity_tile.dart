import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/shared/model/community_activity_model.dart';
import 'package:sportive/features/user/shared/view/widget/user_network_image.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class CommunityActivityTile extends StatelessWidget {
  const CommunityActivityTile({
    super.key,
    required this.activity,
    this.isLiked = false,
    this.onLike,
  });

  final CommunityActivityModel activity;
  final bool isLiked;
  final VoidCallback? onLike;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
    child: Row(
      children: [
        ClipOval(
          child: UserNetworkImage(
            url: activity.imageUrl,
            width: 38.r,
            height: 38.r,
            fallbackIcon: Icons.person_rounded,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text.rich(
                TextSpan(
                  text: activity.userName,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.neutral900,
                  ),
                  children: [
                    TextSpan(
                      text: ' ${activity.action} ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: UserStyle.mutedText,
                      ),
                    ),
                    TextSpan(text: activity.target),
                  ],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 3.h),
              Text(activity.time, style: UserStyle.caption()),
            ],
          ),
        ),
        IconButton(
          onPressed: onLike,
          visualDensity: VisualDensity.compact,
          icon: Icon(
            isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            size: 19.sp,
            color: isLiked ? const Color(0xFFE04545) : AppColors.neutral400,
          ),
        ),
      ],
    ),
  );
}
