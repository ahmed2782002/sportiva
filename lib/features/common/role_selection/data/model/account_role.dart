import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/app_strings.dart';

enum AccountRole { user, coach }

extension AccountRoleText on AccountRole {
  String get title => switch (this) {
    AccountRole.user => AppString.regularUser.tr(),
    AccountRole.coach => AppString.coach.tr(),
  };

  IconData get icon => switch (this) {
    AccountRole.user => Icons.person_rounded,
    AccountRole.coach => Icons.sports_handball_rounded,
  };
}
