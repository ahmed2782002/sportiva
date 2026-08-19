import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/user/shared/datasource/user_mock_data.dart';
import 'package:sportive/features/user/shell/model/user_tab.dart';
import 'package:sportive/features/user/home/view_models/user_home_cubit.dart';
import 'package:sportive/features/user/home/view_models/user_home_state.dart';
import 'package:sportive/features/user/shell/view_models/user_shell_cubit.dart';
import 'package:sportive/features/user/shared/view/widget/user_section_header.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';
import 'package:sportive/features/user/home/view/widget/community_activity_tile.dart';
import 'package:sportive/features/user/home/view/widget/featured_coach_item.dart';
import 'package:sportive/features/user/home/view/widget/featured_venue_card.dart';
import 'package:sportive/features/user/home/view/widget/flash_deal_card.dart';
import 'package:sportive/features/user/home/view/widget/home_greeting_bar.dart';
import 'package:sportive/features/user/home/view/widget/near_me_card.dart';
import 'package:sportive/features/user/home/view/widget/sport_filter_chips.dart';
import 'package:sportive/features/user/home/view/widget/upcoming_booking_card.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  void _goToTab(BuildContext context, UserTab tab) =>
      context.read<UserShellCubit>().selectTab(tab);

  @override
  Widget build(BuildContext context) {
    final horizontal = EdgeInsets.symmetric(horizontal: 20.w);

    return Scaffold(
      backgroundColor: UserStyle.canvas,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            HomeGreetingBar(
              onAvatarTap: () => _goToTab(context, UserTab.profile),
            ),
            Expanded(
              child: BlocBuilder<UserHomeCubit, UserHomeState>(
                builder: (context, state) {
                  final cubit = context.read<UserHomeCubit>();

                  return ListView(
                    padding: EdgeInsets.only(top: 22.h, bottom: 110.h),
                    children: [
                      Padding(
                        padding: horizontal,
                        child: UpcomingBookingCard(
                          onViewDetails: () =>
                              _goToTab(context, UserTab.bookings),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      SportFilterChips(
                        selectedIndex: state.selectedSportIndex,
                        onSelected: cubit.selectSport,
                      ),
                      SizedBox(height: 26.h),
                      Padding(
                        padding: horizontal,
                        child: UserSectionHeader(
                          title: AppString.featuredVenues.tr(),
                          actionLabel: AppString.seeAll.tr().toUpperCase(),
                          onActionTap: () => _goToTab(context, UserTab.search),
                        ),
                      ),
                      SizedBox(height: 14.h),
                      SizedBox(
                        height: 268.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: horizontal,
                          itemCount: UserMockData.featuredVenues.length,
                          separatorBuilder: (_, _) => SizedBox(width: 14.w),
                          itemBuilder: (context, index) => FeaturedVenueCard(
                            venue: UserMockData.featuredVenues[index],
                            onTap: () => _goToTab(context, UserTab.search),
                          ),
                        ),
                      ),
                      SizedBox(height: 28.h),
                      Padding(
                        padding: horizontal,
                        child: UserSectionHeader(title: AppString.nearMe.tr()),
                      ),
                      SizedBox(height: 14.h),
                      Padding(
                        padding: horizontal,
                        child: NearMeCard(
                          onTap: () => _goToTab(context, UserTab.search),
                        ),
                      ),
                      SizedBox(height: 28.h),
                      Padding(
                        padding: horizontal,
                        child: UserSectionHeader(
                          title: AppString.flashDeals.tr(),
                          trailing: FlashDealTimer(
                            countdown: state.dealCountdown,
                          ),
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Padding(padding: horizontal, child: const FlashDealCard()),
                      SizedBox(height: 28.h),
                      Padding(
                        padding: horizontal,
                        child: UserSectionHeader(
                          title: AppString.featuredCoaches.tr(),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 168.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: horizontal,
                          itemCount: UserMockData.featuredCoaches.length,
                          separatorBuilder: (_, _) => SizedBox(width: 16.w),
                          itemBuilder: (context, index) => FeaturedCoachItem(
                            coach: UserMockData.featuredCoaches[index],
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Padding(
                        padding: horizontal,
                        child: UserSectionHeader(
                          title: AppString.community.tr(),
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Padding(
                        padding: horizontal,
                        child: Container(
                          decoration: UserStyle.card(radius: 20),
                          child: Column(
                            children: [
                              for (
                                var index = 0;
                                index < UserMockData.community.length;
                                index++
                              ) ...[
                                CommunityActivityTile(
                                  activity: UserMockData.community[index],
                                ),
                                if (index != UserMockData.community.length - 1)
                                  Divider(
                                    height: 1,
                                    thickness: 1,
                                    indent: 64.w,
                                    endIndent: 14.w,
                                    color: AppColors.neutral200,
                                  ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
