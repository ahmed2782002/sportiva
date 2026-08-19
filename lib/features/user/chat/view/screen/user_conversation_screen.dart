import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/core/utils/nav.dart';
import 'package:sportive/features/user/chat/model/chat_conversation_model.dart';
import 'package:sportive/features/user/chat/view_models/user_conversation_cubit.dart';
import 'package:sportive/features/user/chat/view_models/user_conversation_state.dart';
import 'package:sportive/features/user/chat/view/widget/chat_avatar.dart';
import 'package:sportive/features/user/chat/view/widget/chat_input_bar.dart';
import 'package:sportive/features/user/chat/view/widget/message_bubble.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class UserConversationScreen extends StatelessWidget {
  const UserConversationScreen({super.key, required this.conversation});

  final ChatConversationModel conversation;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => UserConversationCubit(),
    child: Scaffold(
      backgroundColor: UserStyle.canvas,
      body: BlocBuilder<UserConversationCubit, UserConversationState>(
        builder: (context, state) {
          final cubit = context.read<UserConversationCubit>();

          return Column(
            children: [
              _ConversationAppBar(conversation: conversation),
              Expanded(
                child: ListView(
                  controller: cubit.scrollController,
                  padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 10.h),
                  children: [
                    Center(child: _DateChip(label: AppString.today.tr())),
                    SizedBox(height: 18.h),
                    ...state.messages.map(
                      (message) => MessageBubble(message: message),
                    ),
                  ],
                ),
              ),
              ChatInputBar(
                controller: cubit.messageController,
                hasDraft: state.hasDraft,
                onChanged: cubit.onDraftChanged,
                onSend: cubit.sendMessage,
              ),
            ],
          );
        },
      ),
    ),
  );
}

class _ConversationAppBar extends StatelessWidget {
  const _ConversationAppBar({required this.conversation});

  final ChatConversationModel conversation;

  @override
  Widget build(BuildContext context) => Container(
    color: AppColors.white,
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: Padding(
      padding: EdgeInsets.fromLTRB(8.w, 8.h, 12.w, 12.h),
      child: Row(
        children: [
          IconButton(
            onPressed: navigateBack,
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 22.sp,
              color: AppColors.neutral900,
            ),
          ),
          ChatAvatar(
            imageUrl: conversation.imageUrl,
            initials: conversation.initials,
            isOnline: conversation.isOnline,
            size: 40,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  conversation.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.neutral900,
                  ),
                ),
                if (conversation.isOnline)
                  Text(
                    AppString.online.tr(),
                    style: TextStyle(
                      fontSize: 11.5.sp,
                      color: AppColors.tertiary400,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),
          _action(Icons.call_outlined),
          _action(Icons.videocam_outlined),
          _action(Icons.info_outline_rounded),
        ],
      ),
    ),
  );

  Widget _action(IconData icon) => Padding(
    padding: EdgeInsetsDirectional.only(start: 6.w),
    child: Icon(icon, size: 21.sp, color: AppColors.primaryColor),
  );
}

class _DateChip extends StatelessWidget {
  const _DateChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
    decoration: BoxDecoration(
      color: AppColors.neutral200,
      borderRadius: BorderRadius.circular(14.r),
    ),
    child: Text(
      label,
      style: TextStyle(
        fontSize: 11.5.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.neutral700,
      ),
    ),
  );
}
