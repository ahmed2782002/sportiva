import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/notification_settings/view_models/notification_settings_cubit.dart';
import 'package:sportive/features/user/notification_settings/view_models/notification_settings_state.dart';
import 'package:sportive/features/user/notification_settings/view/widget/notification_toggle_tile.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationSettingsCubit(),
      child: Scaffold(
        backgroundColor: UserStyle.canvas,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.neutral900, size: 20.sp),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Notification Settings',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.neutral900,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<NotificationSettingsCubit, NotificationSettingsState>(
          builder: (context, state) {
            final cubit = context.read<NotificationSettingsCubit>();
            return ListView(
              padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 40.h),
              children: [
                Text(
                  'Alert Channels & Updates',
                  style: UserStyle.sectionTitle(),
                ),
                SizedBox(height: 12.h),
                NotificationToggleTile(
                  icon: Icons.sports_tennis_rounded,
                  title: 'Upcoming Match Reminders',
                  subtitle: 'Push alerts 1 hour before scheduled match time.',
                  value: state.matchReminders,
                  onChanged: cubit.toggleMatchReminders,
                ),
                NotificationToggleTile(
                  icon: Icons.calendar_today_rounded,
                  title: 'Booking Status & Receipts',
                  subtitle: 'Instant updates on court confirmations & changes.',
                  value: state.bookingUpdates,
                  onChanged: cubit.toggleBookingUpdates,
                ),
                NotificationToggleTile(
                  icon: Icons.forum_rounded,
                  title: 'Chat & Community Messages',
                  subtitle: 'Alerts for direct messages & player invites.',
                  value: state.chatMessages,
                  onChanged: cubit.toggleChatMessages,
                ),
                NotificationToggleTile(
                  icon: Icons.local_offer_rounded,
                  title: 'Promotions & Vouchers',
                  subtitle: 'Exclusive discounts, flash deals, and partner offers.',
                  value: state.promotionalDeals,
                  onChanged: cubit.togglePromotionalDeals,
                ),
                SizedBox(height: 24.h),

                Text(
                  'Quiet Hours Mode',
                  style: UserStyle.sectionTitle(),
                ),
                SizedBox(height: 12.h),
                NotificationToggleTile(
                  icon: Icons.do_not_disturb_on_rounded,
                  title: 'Silence Night Notifications',
                  subtitle: 'Mute non-urgent push alerts between 11:00 PM and 7:00 AM.',
                  value: state.quietHoursEnabled,
                  onChanged: cubit.toggleQuietHours,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
