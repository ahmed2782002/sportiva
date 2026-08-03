import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/home/presentation/view/widgets/featured_venues_carousel.dart';
import 'package:sportive/features/home/presentation/view/widgets/home_section_header.dart';
import 'package:sportive/features/home/presentation/view/widgets/sports_categories_list.dart';
import 'package:sportive/features/home/presentation/view/widgets/top_coaches_card.dart';
import 'package:sportive/features/home/presentation/view/widgets/upcoming_match_card.dart';
import 'package:sportive/features/home/presentation/view/widgets/user_home_header.dart';
import 'package:sportive/features/home/presentation/view/widgets/user_search_bar.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserHomeHeader(),
          SizedBox(height: 20.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserSearchBar(),
                SizedBox(height: 20.h),

                const UpcomingMatchCard(),
                SizedBox(height: 28.h),

                HomeSectionHeader(
                  title: AppString.sportsSectionTitle.tr(),
                  action: AppString.all.tr(),
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ),

          const SportsCategoriesList(),
          SizedBox(height: 28.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: HomeSectionHeader(
              title: AppString.featuredVenuesTitle.tr(),
              action: AppString.seeAll.tr(),
            ),
          ),
          SizedBox(height: 12.h),

          const FeaturedVenuesCarousel(),
          SizedBox(height: 28.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeSectionHeader(
                  title: AppString.topCoachesTitle.tr(),
                  action: AppString.seeAll.tr(),
                ),
                SizedBox(height: 12.h),
                const TopCoachesCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
