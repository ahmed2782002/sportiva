import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/user/shared/datasource/user_mock_data.dart';
import 'package:sportive/features/user/search/view_models/user_search_cubit.dart';
import 'package:sportive/features/user/search/view_models/user_search_state.dart';
import 'package:sportive/features/user/shared/view/widget/user_section_header.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';
import 'package:sportive/features/user/search/view/widget/discover_search_field.dart';
import 'package:sportive/features/user/search/view/widget/sport_category_card.dart';
import 'package:sportive/features/user/search/view/widget/top_rated_venue_card.dart';

class UserSearchScreen extends StatelessWidget {
  const UserSearchScreen({super.key});

  void _showComingSoon(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppString.comingSoon.tr()),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 100.h),
          backgroundColor: AppColors.primaryColor,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final horizontal = EdgeInsets.symmetric(horizontal: 20.w);

    return Scaffold(
      backgroundColor: UserStyle.canvas,
      body: BlocBuilder<UserSearchCubit, UserSearchState>(
        builder: (context, state) {
          final cubit = context.read<UserSearchCubit>();

          return Stack(
            children: [
              SafeArea(
                bottom: false,
                child: ListView(
                  padding: EdgeInsets.only(top: 16.h, bottom: 120.h),
                  children: [
                    Padding(
                      padding: horizontal,
                      child: Text(
                        AppString.discover.tr(),
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w900,
                          color: AppColors.primaryColor,
                          letterSpacing: -0.6,
                        ),
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Padding(
                      padding: horizontal,
                      child: DiscoverSearchField(
                        controller: cubit.searchController,
                        onChanged: cubit.search,
                        onFilterTap: () => _showComingSoon(context),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      height: 38.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: horizontal,
                        itemCount: UserMockData.recentSearches.length,
                        separatorBuilder: (_, _) => SizedBox(width: 10.w),
                        itemBuilder: (context, index) {
                          final label = UserMockData.recentSearches[index];
                          return GestureDetector(
                            onTap: () => cubit.applyRecentSearch(label),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(19.r),
                                border: Border.all(
                                  color: AppColors.neutral200,
                                ),
                              ),
                              child: Text(
                                label,
                                style: TextStyle(
                                  fontSize: 12.5.sp,
                                  color: AppColors.neutral700,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 26.h),
                    Padding(
                      padding: horizontal,
                      child: UserSectionHeader(
                        title: AppString.searchBySport.tr(),
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Padding(
                      padding: horizontal,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: UserMockData.sportCategories.length,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 14.h,
                              crossAxisSpacing: 14.w,
                              childAspectRatio: 1.45,
                            ),
                        itemBuilder: (context, index) => SportCategoryCard(
                          sport: UserMockData.sportCategories[index],
                          isSelected: state.selectedSportIndex == index,
                          onTap: () => cubit.selectSport(index),
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Padding(
                      padding: horizontal,
                      child: UserSectionHeader(
                        title: AppString.topRatedVenues.tr(),
                        actionLabel: AppString.seeAll.tr(),
                        onActionTap: () => _showComingSoon(context),
                      ),
                    ),
                    SizedBox(height: 14.h),
                    if (state.venues.isEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 40.h),
                        child: Center(
                          child: Text(
                            AppString.noBookingsTitle.tr(),
                            style: UserStyle.caption(),
                          ),
                        ),
                      )
                    else
                      ...state.venues.map(
                        (venue) => Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 18.h),
                          child: TopRatedVenueCard(
                            venue: venue,
                            onQuickBook: () => _showComingSoon(context),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              PositionedDirectional(
                bottom: 96.h,
                start: 0,
                end: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () => _showComingSoon(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 26.w,
                        vertical: 14.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(26.r),
                        boxShadow: UserStyle.liftedShadow,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.map_outlined,
                            size: 18.sp,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(width: 9.w),
                          Text(
                            AppString.mapView.tr(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
