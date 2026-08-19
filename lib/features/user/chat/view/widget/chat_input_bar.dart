import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class ChatInputBar extends StatelessWidget {
  const ChatInputBar({
    super.key,
    required this.controller,
    required this.hasDraft,
    required this.onChanged,
    required this.onSend,
    this.onAttach,
  });

  final TextEditingController controller;
  final bool hasDraft;
  final ValueChanged<String> onChanged;
  final VoidCallback onSend;
  final VoidCallback? onAttach;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 12.h),
    child: Container(
      padding: EdgeInsetsDirectional.only(start: 8.w, end: 6.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: UserStyle.softShadow,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onAttach,
            icon: Icon(
              Icons.add_rounded,
              size: 24.sp,
              color: AppColors.neutral600,
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              onSubmitted: (_) => onSend(),
              textInputAction: TextInputAction.send,
              style: TextStyle(fontSize: 14.5.sp, color: AppColors.neutral900),
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                hintText: AppString.typeMessage.tr(),
                hintStyle: TextStyle(
                  fontSize: 14.5.sp,
                  color: AppColors.neutral400,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: hasDraft ? onSend : null,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              width: 46.r,
              height: 46.r,
              margin: EdgeInsets.symmetric(vertical: 6.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.primaryGradient,
              ),
              child: Icon(
                hasDraft ? Icons.send_rounded : Icons.mic_none_rounded,
                size: 21.sp,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
