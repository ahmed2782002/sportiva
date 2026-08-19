import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:sportive/core/utils/constants/app_strings.dart';

enum UserTab { home, search, bookings, chat, profile }

extension UserTabUi on UserTab {
  String get label => switch (this) {
    UserTab.home => AppString.navHome.tr(),
    UserTab.search => AppString.navSearch.tr(),
    UserTab.bookings => AppString.navBookings.tr(),
    UserTab.chat => AppString.navChat.tr(),
    UserTab.profile => AppString.navProfile.tr(),
  };

  IconData get icon => switch (this) {
    UserTab.home => Icons.home_outlined,
    UserTab.search => Icons.search_rounded,
    UserTab.bookings => Icons.calendar_today_outlined,
    UserTab.chat => Icons.chat_bubble_outline_rounded,
    UserTab.profile => Icons.person_outline_rounded,
  };

  IconData get activeIcon => switch (this) {
    UserTab.home => Icons.home_rounded,
    UserTab.search => Icons.search_rounded,
    UserTab.bookings => Icons.calendar_month_rounded,
    UserTab.chat => Icons.chat_bubble_rounded,
    UserTab.profile => Icons.person_rounded,
  };
}
