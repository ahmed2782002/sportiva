import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/user/shared/datasource/user_mock_data.dart';
import 'package:sportive/features/user/shell/model/user_tab.dart';
import 'package:sportive/features/user/bookings/view_models/user_bookings_cubit.dart';
import 'package:sportive/features/user/bookings/view_models/user_bookings_state.dart';
import 'package:sportive/features/user/shell/view_models/user_shell_cubit.dart';
import 'package:sportive/features/user/bookings/view/widget/booking_card.dart';
import 'package:sportive/features/user/bookings/view/widget/booking_tabs.dart';
import 'package:sportive/features/user/shared/view/widget/user_network_image.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class UserBookingsScreen extends StatelessWidget {
  const UserBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: UserStyle.canvas,
    body: BlocBuilder<UserBookingsCubit, UserBookingsState>(
      builder: (context, state) {
        final cubit = context.read<UserBookingsCubit>();
        final bookings = state.visibleBookings;

        return SafeArea(
          bottom: false,
          child: Column(
            children: [
              const _Header(),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 0),
                child: BookingTabs(
                  currentTab: state.currentTab,
                  onTabSelected: cubit.selectTab,
                ),
              ),
              Expanded(
                child: bookings.isEmpty
                    ? const _EmptyBookings()
                    : ListView.separated(
                        padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 110.h),
                        itemCount: bookings.length,
                        separatorBuilder: (_, _) => SizedBox(height: 18.h),
                        itemBuilder: (context, index) {
                          final booking = bookings[index];
                          return BookingCard(
                            booking: booking,
                            onPrimaryAction: () {},
                            onSecondaryAction: () =>
                                cubit.cancelBooking(booking),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.fromLTRB(20.w, 6.h, 20.w, 10.h),
    child: Row(
      children: [
        Icon(Icons.menu_rounded, size: 24.sp, color: AppColors.primaryColor),
        Expanded(
          child: Text(
            AppString.myBookings.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 21.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        GestureDetector(
          onTap: () =>
              context.read<UserShellCubit>().selectTab(UserTab.profile),
          child: ClipOval(
            child: UserNetworkImage(
              url: UserMockData.userAvatar,
              width: 36.r,
              height: 36.r,
              fallbackIcon: Icons.person_rounded,
            ),
          ),
        ),
      ],
    ),
  );
}

class _EmptyBookings extends StatelessWidget {
  const _EmptyBookings();

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 88.r,
            height: 88.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary50,
            ),
            child: Icon(
              Icons.event_busy_rounded,
              size: 38.sp,
              color: AppColors.primary300,
            ),
          ),
          SizedBox(height: 18.h),
          Text(
            AppString.noBookingsTitle.tr(),
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.neutral900,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            AppString.noBookingsSubtitle.tr(),
            textAlign: TextAlign.center,
            style: UserStyle.caption(),
          ),
        ],
      ),
    ),
  );
}
