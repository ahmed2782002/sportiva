import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../role_selection/data/model/account_role.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.role});
  final AccountRole role;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.background,
        bottomNavigationBar: NavigationBar(
          selectedIndex: 0,
          indicatorColor: AppColors.primaryLighter,
          destinations: [
            NavigationDestination(icon: const Icon(Icons.explore_outlined), selectedIcon: const Icon(Icons.explore), label: AppString.explore.tr()),
            NavigationDestination(icon: const Icon(Icons.calendar_month_outlined), selectedIcon: const Icon(Icons.calendar_month), label: AppString.myBookings.tr()),
            NavigationDestination(icon: const Icon(Icons.person_outline), selectedIcon: const Icon(Icons.person), label: AppString.profile.tr()),
          ],
        ),
        body: SafeArea(child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('SPORTIVA', style: TextStyle(color: AppColors.primaryColor, fontSize: 18.sp, fontWeight: FontWeight.w800, letterSpacing: 1.6)),
            SizedBox(height: 38.h),
            Text(AppString.homeGreeting.tr(), style: TextStyle(color: AppColors.primaryDark, fontSize: 28.sp, fontWeight: FontWeight.w800)),
            SizedBox(height: 8.h),
            Text(AppString.homeSubtitle.tr(), style: TextStyle(color: AppColors.gray, fontSize: 15.sp)),
            SizedBox(height: 30.h),
            Container(width: double.infinity, padding: EdgeInsets.all(24.w), decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(24.r)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(role.icon, color: AppColors.white, size: 32.sp), SizedBox(height: 20.h),
              Text(role.title, style: TextStyle(color: AppColors.white, fontSize: 21.sp, fontWeight: FontWeight.w700)),
              SizedBox(height: 6.h),
              Text(AppString.homeSubtitle.tr(), style: TextStyle(color: AppColors.primaryLighter, fontSize: 13.sp)),
            ])),
          ]),
        )),
      );
}
