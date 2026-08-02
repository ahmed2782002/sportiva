import 'package:flutter/material.dart';
import 'package:sportive/features/home/presentation/view/screens/user_home_view.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../common/role_selection/data/model/account_role.dart';
import 'coach_home_view.dart';
import 'venue_owner_home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.role});

  final AccountRole role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: switch (role) {
        AccountRole.user => const UserHomeView(),
        AccountRole.venueOwner => const VenueOwnerHomeView(),
        AccountRole.coach => const CoachHomeView(),
      },
    );
  }
}
