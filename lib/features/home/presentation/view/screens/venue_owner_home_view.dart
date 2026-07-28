import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/home/presentation/view/widgets/home_section_header.dart';
import 'package:sportive/features/home/presentation/view/widgets/venue_metrics_grid.dart';
import 'package:sportive/features/home/presentation/view/widgets/venue_owner_home_header.dart';
import 'package:sportive/features/home/presentation/view/widgets/venue_pitches_status.dart';
import 'package:sportive/features/home/presentation/view/widgets/venue_quick_actions.dart';
import 'package:sportive/features/home/presentation/view/widgets/venue_recent_bookings.dart';

class VenueOwnerHomeView extends StatelessWidget {
  const VenueOwnerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VenueOwnerHomeHeader(),
          SizedBox(height: 20.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VenueMetricsGrid(),
                SizedBox(height: 22.h),

                const VenueQuickActions(),
                SizedBox(height: 26.h),

                HomeSectionHeader(
                  title: AppString.pitchesStatusTitle.tr(),
                  action: AppString.managePitches.tr(),
                ),
                SizedBox(height: 12.h),
                const VenuePitchesStatus(),
                SizedBox(height: 26.h),

                HomeSectionHeader(
                  title: AppString.recentBookingsTitle.tr(),
                  action: AppString.seeAll.tr(),
                ),
                SizedBox(height: 12.h),
                const VenueRecentBookings(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
