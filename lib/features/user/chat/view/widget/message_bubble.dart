import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/user/chat/model/chat_message_model.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message, this.onViewBooking});

  final ChatMessageModel message;
  final VoidCallback? onViewBooking;

  @override
  Widget build(BuildContext context) {
    if (message.type == MessageType.booking) return _bookingCard();

    final isMine = message.isMine;

    return Align(
      alignment: isMine
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Container(
        constraints: BoxConstraints(maxWidth: 280.w),
        margin: EdgeInsets.only(bottom: 14.h),
        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 8.h),
        decoration: BoxDecoration(
          color: isMine ? AppColors.primary700 : AppColors.primary50,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(20.r),
            topEnd: Radius.circular(20.r),
            bottomStart: Radius.circular(isMine ? 20.r : 6.r),
            bottomEnd: Radius.circular(isMine ? 6.r : 20.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message.text,
              style: TextStyle(
                fontSize: 14.5.sp,
                height: 1.4,
                color: isMine ? AppColors.white : AppColors.neutral900,
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  message.time,
                  style: TextStyle(
                    fontSize: 10.5.sp,
                    color: isMine
                        ? AppColors.white.withValues(alpha: 0.65)
                        : UserStyle.mutedText,
                  ),
                ),
                if (isMine) ...[
                  SizedBox(width: 5.w),
                  Icon(
                    message.isRead ? Icons.done_all_rounded : Icons.done_rounded,
                    size: 13.sp,
                    color: AppColors.white.withValues(alpha: 0.8),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bookingCard() => Align(
    alignment: message.isMine
        ? AlignmentDirectional.centerEnd
        : AlignmentDirectional.centerStart,
    child: Container(
      width: 250.w,
      margin: EdgeInsets.only(bottom: 14.h),
      padding: EdgeInsets.all(14.r),
      decoration: UserStyle.card(radius: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 38.r,
                height: 38.r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary50,
                ),
                child: Icon(
                  Icons.sports_tennis_rounded,
                  size: 19.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(width: 11.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message.bookingVenue ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.neutral900,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      message.bookingDetails ?? '',
                      style: UserStyle.caption(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          GestureDetector(
            onTap: onViewBooking,
            child: Container(
              height: 42.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.neutral200),
              ),
              child: Text(
                AppString.viewDetails.tr(),
                style: TextStyle(
                  fontSize: 13.5.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.neutral900,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
