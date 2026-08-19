import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/user/shared/datasource/user_mock_data.dart';
import 'package:sportive/features/user/profile/view_models/user_profile_cubit.dart';
import 'package:sportive/features/user/profile/view_models/user_profile_state.dart';
import 'package:sportive/features/user/shared/view/widget/user_network_image.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';
import 'package:sportive/features/user/profile/view/widget/premium_card.dart';
import 'package:sportive/features/user/profile/view/widget/points_card.dart';
import 'package:sportive/features/user/profile/view/widget/settings_group.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  void _showComingSoon(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppString.comingSoon.tr()),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 100.h),
          backgroundColor: AppColors.primaryColor,
        ),
      );

  Future<void> _confirmLogout(BuildContext context) async {
    final cubit = context.read<UserProfileCubit>();
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        title: Text(
          AppString.logout.tr(),
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.neutral900,
          ),
        ),
        content: Text(
          AppString.loginRequiredMessage.tr(),
          style: UserStyle.caption(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(
              AppString.cancel.tr(),
              style: TextStyle(color: AppColors.neutral600),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(
              AppString.logout.tr(),
              style: const TextStyle(color: Color(0xFFE04545)),
            ),
          ),
        ],
      ),
    );

    if (shouldLogout ?? false) await cubit.logout();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: UserStyle.canvas,
    body: BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, state) {
        final cubit = context.read<UserProfileCubit>();

        return SafeArea(
          bottom: false,
          child: ListView(
            padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 110.h),
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppString.accountAndSettings.tr(),
                      style: TextStyle(
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  ClipOval(
                    child: UserNetworkImage(
                      url: UserMockData.userAvatar,
                      width: 38.r,
                      height: 38.r,
                      fallbackIcon: Icons.person_rounded,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              PremiumCard(
                renewDate: UserMockData.planRenewDate,
                onManage: () => _showComingSoon(context),
              ),
              SizedBox(height: 14.h),
              PointsCard(
                points: UserMockData.points,
                pointsToReward: UserMockData.pointsToNextReward,
                onTap: () => _showComingSoon(context),
              ),
              SizedBox(height: 20.h),
              SettingsGroup(
                title: AppString.personal.tr(),
                items: [
                  SettingsTile(
                    icon: Icons.badge_outlined,
                    title: AppString.identityVerification.tr(),
                    subtitle: AppString.verified.tr(),
                    onTap: () => _showComingSoon(context),
                  ),
                  SettingsTile(
                    icon: Icons.lock_outline_rounded,
                    title: AppString.privacy.tr(),
                    subtitle: AppString.profileVisibility.tr(),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          state.isProfilePublic
                              ? AppString.publicVisibility.tr()
                              : AppString.privateVisibility.tr(),
                          style: UserStyle.caption(),
                        ),
                        SizedBox(width: 6.w),
                        Switch.adaptive(
                          value: state.isProfilePublic,
                          activeThumbColor: AppColors.white,
                          activeTrackColor: AppColors.primaryColor,
                          onChanged: cubit.toggleProfileVisibility,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              SettingsGroup(
                title: AppString.payments.tr(),
                items: [
                  SettingsTile(
                    icon: Icons.credit_card_rounded,
                    title: AppString.paymentMethods.tr(),
                    subtitle: UserMockData.cardLastDigits,
                    badge: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.neutral100,
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: AppColors.neutral200),
                      ),
                      child: Text(
                        'VISA',
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w900,
                          color: AppColors.neutral700,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ),
                    onTap: () => _showComingSoon(context),
                  ),
                  SettingsTile(
                    icon: Icons.local_offer_outlined,
                    title: AppString.savedVouchers.tr(),
                    subtitle: AppString.vouchersAvailable.tr(
                      args: ['${UserMockData.vouchersCount}'],
                    ),
                    onTap: () => _showComingSoon(context),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              SettingsGroup(
                title: AppString.preferences.tr(),
                items: [
                  SettingsTile(
                    icon: Icons.notifications_none_rounded,
                    title: AppString.notificationSettings.tr(),
                    subtitle: AppString.notificationChannels.tr(),
                    onTap: () => _showComingSoon(context),
                  ),
                  SettingsTile(
                    icon: Icons.language_rounded,
                    title: AppString.language.tr(),
                    onTap: cubit.changeLanguage,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.neutral100,
                            borderRadius: BorderRadius.circular(9.r),
                          ),
                          child: Text(
                            context.locale.languageCode == 'ar'
                                ? 'العربية'
                                : 'English',
                            style: TextStyle(
                              fontSize: 11.5.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.neutral700,
                            ),
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Icon(
                          Icons.unfold_more_rounded,
                          size: 16.sp,
                          color: AppColors.neutral400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              SettingsGroup(
                title: AppString.support.tr(),
                items: [
                  SettingsTile(
                    icon: Icons.help_outline_rounded,
                    title: AppString.helpCenter.tr(),
                    onTap: () => _showComingSoon(context),
                  ),
                  SettingsTile(
                    icon: Icons.description_outlined,
                    title: AppString.termsOfService.tr(),
                    onTap: () => _showComingSoon(context),
                  ),
                ],
              ),
              SizedBox(height: 26.h),
              GestureDetector(
                onTap: () => _confirmLogout(context),
                child: Container(
                  height: 54.h,
                  alignment: Alignment.center,
                  decoration: UserStyle.card(radius: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.logout_rounded,
                        size: 19.sp,
                        color: AppColors.neutral800,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        AppString.logout.tr(),
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.neutral800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 18.h),
              Center(
                child: TextButton.icon(
                  onPressed: () => _showComingSoon(context),
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    color: Color(0xFFE04545),
                  ),
                  label: Text(
                    AppString.deleteAccount.tr(),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFE04545),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
