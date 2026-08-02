import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sportive/core/cache/shared_preferences_manager.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/common/role_selection/data/model/account_role.dart';

import 'layout_state.dart';

class NavItemData {
  const NavItemData({
    required this.icon,
    required this.selectedIcon,
    required this.labelKey,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String labelKey;
}

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit({AccountRole? initialRole})
      : super(LayoutState(role: initialRole ?? _loadRoleFromCache()));

  static AccountRole _loadRoleFromCache() {
    final cachedRoleName = SharedPref.getString(AppString.selectedAccountRole);
    if (cachedRoleName == null) return AccountRole.user;
    return AccountRole.values.firstWhere(
      (r) => r.name == cachedRoleName,
      orElse: () => AccountRole.user,
    );
  }

  void changeTab(int index) {
    if (state.currentIndex == index) return;
    emit(state.copyWith(currentIndex: index));
  }

  void updateRole(AccountRole role) {
    emit(state.copyWith(role: role, currentIndex: 0));
  }

  List<NavItemData> get navItems {
    switch (state.role) {
      case AccountRole.user:
        return const [
          NavItemData(
            icon: Icons.grid_view_outlined,
            selectedIcon: Icons.grid_view_rounded,
            labelKey: AppString.home,
          ),
          NavItemData(
            icon: Icons.sports_soccer_outlined,
            selectedIcon: Icons.sports_soccer_rounded,
            labelKey: AppString.myBookings,
          ),
          NavItemData(
            icon: Icons.sports_handball_outlined,
            selectedIcon: Icons.sports_handball_rounded,
            labelKey: AppString.coaches,
          ),
          NavItemData(
            icon: Icons.person_outline_rounded,
            selectedIcon: Icons.person_rounded,
            labelKey: AppString.profile,
          ),
        ];

      case AccountRole.venueOwner:
        return const [
          NavItemData(
            icon: Icons.space_dashboard_outlined,
            selectedIcon: Icons.space_dashboard_rounded,
            labelKey: AppString.home,
          ),
          NavItemData(
            icon: Icons.stadium_outlined,
            selectedIcon: Icons.stadium_rounded,
            labelKey: AppString.pitches,
          ),
          NavItemData(
            icon: Icons.confirmation_number_outlined,
            selectedIcon: Icons.confirmation_number_rounded,
            labelKey: AppString.myBookings,
          ),
          NavItemData(
            icon: Icons.storefront_outlined,
            selectedIcon: Icons.storefront_rounded,
            labelKey: AppString.profile,
          ),
        ];

      case AccountRole.coach:
        return const [
          NavItemData(
            icon: Icons.dashboard_outlined,
            selectedIcon: Icons.dashboard_rounded,
            labelKey: AppString.home,
          ),
          NavItemData(
            icon: Icons.fitness_center_outlined,
            selectedIcon: Icons.fitness_center_rounded,
            labelKey: AppString.sessions,
          ),
          NavItemData(
            icon: Icons.groups_outlined,
            selectedIcon: Icons.groups_rounded,
            labelKey: AppString.trainees,
          ),
          NavItemData(
            icon: Icons.person_pin_outlined,
            selectedIcon: Icons.person_pin_rounded,
            labelKey: AppString.profile,
          ),
        ];
    }
  }
}
