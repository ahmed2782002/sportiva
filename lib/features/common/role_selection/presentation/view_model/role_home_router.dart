import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/nav.dart';
import 'package:sportive/features/user/shell/view/screen/user_shell_screen.dart';
import '../../data/model/account_role.dart';

/// Sends a signed-in account to the experience that belongs to its role.
void navigateToRoleHome(BuildContext context, AccountRole role) {
  switch (role) {
    case AccountRole.user:
      navigateFinish(const UserShellScreen());
    case AccountRole.coach:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppString.comingSoon.tr()),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }
}
