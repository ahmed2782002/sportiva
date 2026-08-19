import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/shell/model/user_tab.dart';

/// A floating dock where the selected destination morphs into a gradient
/// capsule that carries its label, while the rest stay as quiet glyphs.
class UserBottomNavBar extends StatelessWidget {
  const UserBottomNavBar({
    super.key,
    required this.currentTab,
    required this.onTabSelected,
    this.badges = const {},
  });

  final UserTab currentTab;
  final ValueChanged<UserTab> onTabSelected;

  /// Optional unread counters keyed by destination.
  final Map<UserTab, int> badges;

  @override
  Widget build(BuildContext context) => SafeArea(
    top: false,
    child: Container(
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(26.r),
        border: Border.all(color: AppColors.primary50, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary900.withValues(alpha: 0.14),
            blurRadius: 28.r,
            offset: Offset(0, 10.h),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final inactiveWidth = 48.w;
          final activeWidth =
              constraints.maxWidth -
              ((UserTab.values.length - 1) * inactiveWidth) -
              (UserTab.values.length * 4.w);

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: UserTab.values.map((tab) {
              final isActive = tab == currentTab;
              return _NavDestination(
                tab: tab,
                isActive: isActive,
                width: isActive ? activeWidth : inactiveWidth,
                badgeCount: badges[tab] ?? 0,
                onTap: () => onTabSelected(tab),
              );
            }).toList(),
          );
        },
      ),
    ),
  );
}

class _NavDestination extends StatelessWidget {
  const _NavDestination({
    required this.tab,
    required this.isActive,
    required this.width,
    required this.badgeCount,
    required this.onTap,
  });

  final UserTab tab;
  final bool isActive;
  final double width;
  final int badgeCount;
  final VoidCallback onTap;

  static const Duration _duration = Duration(milliseconds: 320);
  static const Curve _curve = Curves.easeOutCubic;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: AnimatedContainer(
      duration: _duration,
      curve: _curve,
      width: width,
      height: 46.h,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      padding: EdgeInsets.symmetric(horizontal: isActive ? 10.w : 4.w),
      child: Container(
        decoration: BoxDecoration(
          gradient: isActive ? AppColors.primaryGradient : null,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: AppColors.primaryColor.withValues(alpha: 0.35),
                    blurRadius: 16.r,
                    offset: Offset(0, 6.h),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            if (isActive)
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 6.w),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      tab.label,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 12.5.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
  );

  Widget _icon() {
    final icon = AnimatedScale(
      duration: _duration,
      curve: _curve,
      scale: isActive ? 1.06 : 1,
      child: Icon(
        // Keep one icon widget for the destination while the selected item
        // changes. Swapping between two IconData values at the same time as
        // the flex layout changes causes a short flicker during navigation.
        // The active state is already communicated by the capsule, label and
        // color, so the icon can remain stable throughout the transition.
        tab.icon,
        size: 22.sp,
        color: isActive ? AppColors.white : AppColors.neutral400,
      ),
    );

    if (badgeCount <= 0) return icon;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        icon,
        PositionedDirectional(
          top: -3.h,
          end: -4.w,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            constraints: BoxConstraints(minWidth: 14.w),
            decoration: BoxDecoration(
              color: isActive ? AppColors.white : AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.white, width: 1.2),
            ),
            child: Text(
              badgeCount > 9 ? '9+' : '$badgeCount',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 8.5.sp,
                height: 1.2,
                fontWeight: FontWeight.w800,
                color: isActive ? AppColors.primaryColor : AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
