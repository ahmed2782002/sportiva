import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/features/user/booking_selection/view_models/booking_selection_cubit.dart';
import 'package:sportive/features/user/booking_shared/data/datasource/booking_mock_data.dart';
import 'package:sportive/features/user/booking_shared/model/booking_models.dart';
import 'package:sportive/features/user/shared/view/widget/user_network_image.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

import 'package:sportive/features/user/booking_shared/view/widget/booking_buttons.dart';
import 'package:sportive/features/user/booking_shared/view/widget/booking_header.dart';
import 'package:sportive/features/user/booking_shared/view/widget/booking_style.dart';

class BookingSelectionScreen extends StatelessWidget {
  const BookingSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingSelectionCubit>();
    final state = context.watch<BookingSelectionCubit>().state;

    return Scaffold(
      backgroundColor: BookingStyle.background,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(bottom: 30.h),
          children: [
            BookingHeader(onBack: () => Navigator.of(context).pop()),
            const BookingStepProgress(step: 1, label: 'Select Sport'),
            SizedBox(height: 31.h),
            Text(
              'Choose your arena',
              textAlign: TextAlign.center,
              style: BookingStyle.body(14, weight: FontWeight.w600),
            ),
            SizedBox(height: 4.h),
            Text(
              'Select a sport to view available courts.',
              textAlign: TextAlign.center,
              style: BookingStyle.body(12).copyWith(color: BookingStyle.muted),
            ),
            SizedBox(height: 23.h),
            SizedBox(
              height: 248.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                itemCount: BookingMockData.sports.length,
                separatorBuilder: (_, _) => SizedBox(width: 12.w),
                itemBuilder: (context, index) => _SportCard(
                  sport: BookingMockData.sports[index],
                  selected: state.selectedSportIndex == index,
                  onTap: () => cubit.selectSport(index),
                ),
              ),
            ),
            SizedBox(height: 33.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                'Available ${BookingMockData.sports[state.selectedSportIndex].name} Courts',
                style: BookingStyle.body(13, weight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 14.h),
            ...List.generate(
              BookingMockData.courts.length,
              (index) => Padding(
                padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 17.h),
                child: _CourtCard(
                  court: BookingMockData.courts[index],
                  selected: state.selectedCourtIndex == index,
                  onTap: () => cubit.selectCourt(index),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.w, 2.h, 15.w, 0),
              child: BookingPrimaryButton(
                label: 'Continue',
                icon: Icons.arrow_forward_rounded,
                onPressed: cubit.continueToSchedule,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SportCard extends StatelessWidget {
  const _SportCard({
    required this.sport,
    required this.selected,
    required this.onTap,
  });

  final BookingSport sport;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: SizedBox(
        width: 248.w,
        child: Stack(
          fit: StackFit.expand,
          children: [
            UserNetworkImage(
              url: sport.imageUrl,
              fallbackIcon: Icons.sports_tennis_rounded,
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xD9000000)],
                ),
              ),
            ),
            Positioned(
              left: 16.w,
              right: 16.w,
              bottom: 17.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sport.name,
                    style: BookingStyle.body(
                      14,
                      weight: FontWeight.w600,
                    ).copyWith(color: Colors.white),
                  ),
                  Text(
                    sport.subtitle,
                    style: BookingStyle.body(12).copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 12.h,
              right: 12.w,
              child: Container(
                width: 32.r,
                height: 32.r,
                decoration: BoxDecoration(
                  color: selected
                      ? BookingStyle.primary
                      : BookingStyle.primary.withValues(alpha: 0.85),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  selected ? Icons.check_rounded : Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 18.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _CourtCard extends StatelessWidget {
  const _CourtCard({
    required this.court,
    required this.selected,
    required this.onTap,
  });

  final BookingCourt court;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: selected ? BookingStyle.primary : BookingStyle.border,
          width: selected ? 1.4 : 1,
        ),
        boxShadow: selected ? UserStyle.softShadow : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(7.r),
                child: UserNetworkImage(
                  url: court.imageUrl,
                  width: double.infinity,
                  height: 91.h,
                ),
              ),
              Positioned(
                left: 8.w,
                top: 8.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: BookingStyle.green,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    '● Available',
                    style: BookingStyle.body(
                      10,
                      weight: FontWeight.w600,
                    ).copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 13.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  court.name,
                  style: BookingStyle.body(12, weight: FontWeight.w500),
                ),
              ),
              Text(
                '\$${court.price.toStringAsFixed(0)}/hr',
                style: BookingStyle.body(12, weight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Text(
            court.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: BookingStyle.body(12).copyWith(color: BookingStyle.muted),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(
                Icons.groups_2_outlined,
                size: 14.sp,
                color: BookingStyle.muted,
              ),
              SizedBox(width: 4.w),
              Text(
                '4 Players',
                style: BookingStyle.body(
                  11,
                ).copyWith(color: BookingStyle.muted),
              ),
              SizedBox(width: 13.w),
              Icon(
                Icons.wb_sunny_outlined,
                size: 14.sp,
                color: BookingStyle.muted,
              ),
              SizedBox(width: 4.w),
              Text(
                court.surface,
                style: BookingStyle.body(
                  11,
                ).copyWith(color: BookingStyle.muted),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
