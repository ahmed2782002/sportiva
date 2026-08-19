import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/chat/model/chat_conversation_model.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';
import 'chat_avatar.dart';

class ConversationTile extends StatelessWidget {
  const ConversationTile({
    super.key,
    required this.conversation,
    required this.onTap,
  });

  final ChatConversationModel conversation;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final hasUnread = conversation.unreadCount > 0;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: UserStyle.card(radius: 20),
        child: Row(
          children: [
            ChatAvatar(
              imageUrl: conversation.imageUrl,
              initials: conversation.initials,
              isOnline: conversation.isOnline,
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          conversation.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.neutral900,
                          ),
                        ),
                      ),
                      if (conversation.isMuted) ...[
                        SizedBox(width: 6.w),
                        Icon(
                          Icons.notifications_off_outlined,
                          size: 14.sp,
                          color: AppColors.neutral400,
                        ),
                      ],
                      const Spacer(),
                      Text(
                        conversation.time,
                        style: TextStyle(
                          fontSize: 11.5.sp,
                          fontWeight: hasUnread
                              ? FontWeight.w700
                              : FontWeight.w400,
                          color: hasUnread
                              ? AppColors.primaryColor
                              : UserStyle.mutedText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          conversation.lastMessage,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: hasUnread
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: hasUnread
                                ? AppColors.neutral800
                                : UserStyle.mutedText,
                          ),
                        ),
                      ),
                      if (hasUnread) ...[
                        SizedBox(width: 8.w),
                        Container(
                          width: 21.r,
                          height: 21.r,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: Text(
                            '${conversation.unreadCount}',
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w800,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
