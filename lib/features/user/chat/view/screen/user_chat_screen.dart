import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/core/utils/nav.dart';
import 'package:sportive/features/user/shared/datasource/user_mock_data.dart';
import 'package:sportive/features/user/chat/model/chat_conversation_model.dart';
import 'package:sportive/features/user/chat/view_models/user_chat_cubit.dart';
import 'package:sportive/features/user/chat/view_models/user_chat_state.dart';
import 'package:sportive/features/user/chat/view/widget/conversation_tile.dart';
import 'package:sportive/features/user/shared/view/widget/user_network_image.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';
import 'user_conversation_screen.dart';

class UserChatScreen extends StatelessWidget {
  const UserChatScreen({super.key});

  void _openConversation(ChatConversationModel conversation) =>
      navigateTo(UserConversationScreen(conversation: conversation));

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: UserStyle.canvas,
    body: BlocBuilder<UserChatCubit, UserChatState>(
      builder: (context, state) {
        final cubit = context.read<UserChatCubit>();

        return SafeArea(
          bottom: false,
          child: Column(
            children: [
              const _TopBar(),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 110.h),
                  children: [
                    Text(
                      AppString.messages.tr(),
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w900,
                        color: AppColors.neutral900,
                        letterSpacing: -0.6,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    _SearchField(
                      controller: cubit.searchController,
                      onChanged: cubit.search,
                    ),
                    SizedBox(height: 24.h),
                    if (state.conversations.isEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 50.h),
                        child: Center(
                          child: Text(
                            AppString.noConversations.tr(),
                            style: UserStyle.caption(),
                          ),
                        ),
                      ),
                    if (state.pinned.isNotEmpty) ...[
                      _GroupLabel(
                        icon: Icons.push_pin_outlined,
                        label: AppString.pinned.tr(),
                      ),
                      SizedBox(height: 12.h),
                      ...state.pinned.map(
                        (conversation) => Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: ConversationTile(
                            conversation: conversation,
                            onTap: () => _openConversation(conversation),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                    ],
                    if (state.recent.isNotEmpty) ...[
                      _GroupLabel(
                        icon: Icons.history_rounded,
                        label: AppString.recent.tr(),
                      ),
                      SizedBox(height: 12.h),
                      ...state.recent.map(
                        (conversation) => Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: ConversationTile(
                            conversation: conversation,
                            onTap: () => _openConversation(conversation),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) => Container(
    color: AppColors.white,
    padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 12.h),
    child: Row(
      children: [
        ClipOval(
          child: UserNetworkImage(
            url: UserMockData.userAvatar,
            width: 34.r,
            height: 34.r,
            fallbackIcon: Icons.person_rounded,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            AppString.appName,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.primaryColor,
              letterSpacing: -0.3,
            ),
          ),
        ),
        Icon(Icons.search_rounded, size: 22.sp, color: AppColors.primaryColor),
      ],
    ),
  );
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.controller, required this.onChanged});

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) => Container(
    height: 52.h,
    padding: EdgeInsets.symmetric(horizontal: 18.w),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(26.r),
      boxShadow: UserStyle.softShadow,
    ),
    child: Row(
      children: [
        Icon(Icons.search_rounded, size: 19.sp, color: AppColors.neutral400),
        SizedBox(width: 10.w),
        Expanded(
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            style: TextStyle(fontSize: 14.sp, color: AppColors.neutral900),
            decoration: InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              hintText: AppString.searchConversations.tr(),
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color: AppColors.neutral400,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class _GroupLabel extends StatelessWidget {
  const _GroupLabel({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Icon(icon, size: 15.sp, color: UserStyle.mutedText),
      SizedBox(width: 8.w),
      Text(
        label,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w800,
          letterSpacing: 1,
          color: UserStyle.mutedText,
        ),
      ),
    ],
  );
}
