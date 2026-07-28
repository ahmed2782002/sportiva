import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/home/presentation/view/widgets/coach_home_header.dart';
import 'package:sportive/features/home/presentation/view/widgets/coach_metrics_grid.dart';
import 'package:sportive/features/home/presentation/view/widgets/coach_today_schedule.dart';
import 'package:sportive/features/home/presentation/view/widgets/coach_trainee_requests.dart';
import 'package:sportive/features/home/presentation/view/widgets/home_section_header.dart';

class CoachHomeView extends StatelessWidget {
  const CoachHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CoachHomeHeader(),
          SizedBox(height: 20.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CoachMetricsGrid(),
                SizedBox(height: 26.h),

                HomeSectionHeader(
                  title: AppString.todaysSchedule.tr(),
                  action: AppString.viewCalendar.tr(),
                ),
                SizedBox(height: 12.h),
                const CoachTodaySchedule(),
                SizedBox(height: 26.h),

                HomeSectionHeader(
                  title: AppString.newTrainingRequests.tr(),
                  action: AppString.all.tr(),
                ),
                SizedBox(height: 12.h),
                const CoachTraineeRequests(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
