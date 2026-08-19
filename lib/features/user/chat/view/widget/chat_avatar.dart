import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/shared/view/widget/user_network_image.dart';

class ChatAvatar extends StatelessWidget {
  const ChatAvatar({
    super.key,
    required this.imageUrl,
    this.initials,
    this.isOnline = false,
    this.size = 52,
  });

  final String imageUrl;
  final String? initials;
  final bool isOnline;
  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: size.r,
    height: size.r,
    child: Stack(
      children: [
        if (initials != null && initials!.isNotEmpty)
          Container(
            width: size.r,
            height: size.r,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary100,
            ),
            child: Text(
              initials!,
              style: TextStyle(
                fontSize: (size * 0.32).sp,
                fontWeight: FontWeight.w800,
                color: AppColors.primaryColor,
              ),
            ),
          )
        else
          ClipOval(
            child: UserNetworkImage(
              url: imageUrl,
              width: size.r,
              height: size.r,
              fallbackIcon: Icons.person_rounded,
            ),
          ),
        if (isOnline)
          PositionedDirectional(
            bottom: 1.r,
            end: 1.r,
            child: Container(
              width: (size * 0.22).r,
              height: (size * 0.22).r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.tertiary400,
                border: Border.all(color: AppColors.white, width: 2),
              ),
            ),
          ),
      ],
    ),
  );
}
