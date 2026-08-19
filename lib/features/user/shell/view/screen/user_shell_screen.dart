import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/shell/model/user_tab.dart';
import 'package:sportive/features/user/bookings/view_models/user_bookings_cubit.dart';
import 'package:sportive/features/user/chat/view_models/user_chat_cubit.dart';
import 'package:sportive/features/user/home/view_models/user_home_cubit.dart';
import 'package:sportive/features/user/profile/view_models/user_profile_cubit.dart';
import 'package:sportive/features/user/search/view_models/user_search_cubit.dart';
import 'package:sportive/features/user/shell/view_models/user_shell_cubit.dart';
import 'package:sportive/features/user/shell/view_models/user_shell_state.dart';
import 'package:sportive/features/user/shell/view/widget/user_bottom_nav_bar.dart';
import 'package:sportive/features/user/bookings/view/screen/user_bookings_screen.dart';
import 'package:sportive/features/user/chat/view/screen/user_chat_screen.dart';
import 'package:sportive/features/user/home/view/screen/user_home_screen.dart';
import 'package:sportive/features/user/profile/view/screen/user_profile_screen.dart';
import 'package:sportive/features/user/search/view/screen/user_search_screen.dart';


/// Entry point of the signed-in user experience: holds the five destinations
/// alive in an [IndexedStack] and hosts the floating navigation dock.
class UserShellScreen extends StatelessWidget {
  const UserShellScreen({super.key, this.initialTab = UserTab.home});

  final UserTab initialTab;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => UserShellCubit(initialTab: initialTab)),
      BlocProvider(create: (_) => UserHomeCubit()),
      BlocProvider(create: (_) => UserSearchCubit()),
      BlocProvider(create: (_) => UserBookingsCubit()),
      BlocProvider(create: (_) => UserChatCubit()),
      BlocProvider(create: (_) => UserProfileCubit()),
    ],
    child: const _UserShellView(),
  );
}

class _UserShellView extends StatelessWidget {
  const _UserShellView();

  static const List<Widget> _screens = [
    UserHomeScreen(),
    UserSearchScreen(),
    UserBookingsScreen(),
    UserChatScreen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<UserShellCubit, UserShellState>(
        builder: (context, state) {
          final cubit = context.read<UserShellCubit>();

          return PopScope(
            canPop: cubit.isOnHomeTab,
            onPopInvokedWithResult: (didPop, result) {
              if (!didPop) cubit.handleBack();
            },
            child: Scaffold(
              backgroundColor: AppColors.background,
              extendBody: true,
              body: IndexedStack(
                index: state.currentTab.index,
                children: _screens,
              ),
              bottomNavigationBar: UserBottomNavBar(
                currentTab: state.currentTab,
                onTabSelected: cubit.selectTab,
                badges: const {UserTab.chat: 4},
              ),
            ),
          );
        },
      );
}
