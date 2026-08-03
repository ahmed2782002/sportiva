import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/coach/presentation/view/screens/coach_account_screen.dart';
import 'package:sportive/features/common/role_selection/data/model/account_role.dart';
import 'package:sportive/features/home/presentation/view/screens/home_screen.dart';
import 'package:sportive/features/owner/presentation/view/screens/owner_account_screen.dart';
import 'package:sportive/features/user/presentation/view/screens/user_account_screen.dart';

import '../../../../owner/ presentation/view/screens/ owner_account_screen.dart';
import '../../view_model/layout_cubit.dart';
import '../../view_model/layout_state.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'role_tab_placeholder.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({
    super.key,
    required this.role,
  });

  final AccountRole role;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LayoutCubit(
        initialRole: role,
      ),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          final cubit = context.read<LayoutCubit>();
          final navItems = cubit.navItems;

          Widget getBodyScreen(int index) {
            // الصفحة الرئيسية
            if (index == 0) {
              return HomeScreen(
                role: state.role,
              );
            }

            // آخر أيقونة هي صفحة الحساب
            if (index == navItems.length - 1) {
              if (state.role == AccountRole.coach) {
                return const CoachAccountScreen();
              }

              if (state.role == AccountRole.venueOwner) {
                return const OwnerAccountScreen();
              }

              // ✅ ده اللي كان ناقص — حساب الـ User العادي
              if (state.role == AccountRole.user) {
                return const UserAccountScreen();
              }

              return const SizedBox.shrink();
            }

            // باقي الصفحات
            final currentNavItem = navItems[index];

            return RoleTabPlaceholder(
              titleKey: currentNavItem.labelKey,
              icon: currentNavItem.selectedIcon,
              role: state.role,
            );
          }

          return Scaffold(
            backgroundColor: AppColors.background,
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.easeInCubic,
              transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  ) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: Tween<double>(
                      begin: 0.98,
                      end: 1.0,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: KeyedSubtree(
                key: ValueKey('${state.role.name}_${state.currentIndex}'),
                child: getBodyScreen(state.currentIndex),
              ),
            ),
            bottomNavigationBar: CustomBottomNavBar(
              currentIndex: state.currentIndex,
              items: navItems,
              onTap: cubit.changeTab,
            ),
          );
        },
      ),
    );
  }
}