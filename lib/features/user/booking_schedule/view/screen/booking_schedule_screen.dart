import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/features/user/booking_schedule/view_models/booking_schedule_cubit.dart';
import 'package:sportive/features/user/booking_shared/data/datasource/booking_mock_data.dart';
import 'package:sportive/features/user/booking_shared/model/booking_models.dart';

import 'package:sportive/features/user/booking_shared/view/widget/booking_buttons.dart';
import 'package:sportive/features/user/booking_shared/view/widget/booking_style.dart';

class BookingScheduleScreen extends StatelessWidget {
  const BookingScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BookingScheduleCubit>().state;
    final cubit = context.read<BookingScheduleCubit>();

    return Scaffold(
      backgroundColor: BookingStyle.background,
      bottomNavigationBar: BookingBottomBar(
        title: cubit.selectedCourt.name,
        subtitle:
            '${BookingMockData.days[state.selectedDateIndex]}, Oct ${BookingMockData.dates[state.selectedDateIndex]} • ${state.selectedTime} (${state.selectedDuration}m)',
        buttonLabel: 'Continue',
        onPressed: cubit.continueToEquipment,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(20.w, 11.h, 20.w, 115.h),
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: cubit.back,
                  icon: const Icon(Icons.arrow_back_rounded),
                  color: BookingStyle.primary,
                  iconSize: 25.sp,
                  padding: EdgeInsets.zero,
                ),
                const Spacer(),
                Text(
                  'Skip',
                  style: BookingStyle.body(
                    14,
                  ).copyWith(color: BookingStyle.primary),
                ),
              ],
            ),
            SizedBox(height: 48.h),
            Text('When do you want to\nplay?', style: BookingStyle.heading(32)),
            SizedBox(height: 13.h),
            Text(
              'Select a date and duration for your booking.',
              style: BookingStyle.body(17).copyWith(color: BookingStyle.muted),
            ),
            SizedBox(height: 49.h),
            Text(
              'October',
              style: BookingStyle.heading(29, weight: FontWeight.w500),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 110.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: BookingMockData.dates.length,
                separatorBuilder: (_, _) => SizedBox(width: 12.w),
                itemBuilder: (context, index) => _DateCard(
                  day: BookingMockData.days[index],
                  date: BookingMockData.dates[index],
                  selected: state.selectedDateIndex == index,
                  onTap: () => cubit.selectDate(index),
                ),
              ),
            ),
            SizedBox(height: 69.h),
            Text(
              'Duration',
              style: BookingStyle.heading(29, weight: FontWeight.w500),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                for (final duration in [60, 90, 120]) ...[
                  Expanded(
                    child: _ChoicePill(
                      label: '$duration min',
                      selected: state.selectedDuration == duration,
                      onTap: () => cubit.selectDuration(duration),
                    ),
                  ),
                  if (duration != 120) SizedBox(width: 12.w),
                ],
              ],
            ),
            SizedBox(height: 49.h),
            Row(
              children: [
                Text(
                  'Available Times',
                  style: BookingStyle.heading(27, weight: FontWeight.w500),
                ),
                const Spacer(),
                Text(
                  'Prices vary by demand',
                  style: BookingStyle.body(
                    12,
                  ).copyWith(color: BookingStyle.muted),
                ),
              ],
            ),
            SizedBox(height: 28.h),
            const BookingTimeSection(
              title: 'MORNING',
              slots: BookingMockData.morningSlots,
            ),
            SizedBox(height: 30.h),
            const BookingTimeSection(
              title: 'AFTERNOON',
              slots: BookingMockData.afternoonSlots,
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                Container(
                  width: 10.r,
                  height: 10.r,
                  decoration: const BoxDecoration(
                    color: Color(0xFFAED193),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 7.w),
                Text(
                  'Peak Hours',
                  style: BookingStyle.body(
                    13,
                  ).copyWith(color: BookingStyle.muted),
                ),
              ],
            ),
            SizedBox(height: 33.h),
            const BookingTimeSection(
              title: 'EVENING',
              slots: BookingMockData.eveningSlots,
            ),
          ],
        ),
      ),
    );
  }
}

class _DateCard extends StatelessWidget {
  const _DateCard({
    required this.day,
    required this.date,
    required this.selected,
    required this.onTap,
  });

  final String day;
  final String date;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 160),
      width: 88.w,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: selected ? BookingStyle.primary : Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: selected ? BookingStyle.primary : BookingStyle.border,
        ),
        boxShadow: selected ? const [] : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: BookingStyle.body(
              14,
              weight: FontWeight.w500,
            ).copyWith(color: selected ? Colors.white : BookingStyle.muted),
          ),
          SizedBox(height: 4.h),
          Text(
            date,
            style: BookingStyle.heading(
              27,
            ).copyWith(color: selected ? Colors.white : BookingStyle.ink),
          ),
        ],
      ),
    ),
  );
}

class _ChoicePill extends StatelessWidget {
  const _ChoicePill({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 160),
      height: 64.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selected ? BookingStyle.primary : Colors.white,
        borderRadius: BorderRadius.circular(32.r),
        border: Border.all(
          color: selected ? BookingStyle.primary : const Color(0xFFDCD5DB),
        ),
      ),
      child: Text(
        label,
        style: BookingStyle.body(
          16,
          weight: FontWeight.w600,
        ).copyWith(color: selected ? Colors.white : BookingStyle.ink),
      ),
    ),
  );
}

class BookingTimeSection extends StatelessWidget {
  const BookingTimeSection({
    super.key,
    required this.title,
    required this.slots,
  });

  final String title;
  final List<BookingTimeSlot> slots;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingScheduleCubit>();
    final state = context.watch<BookingScheduleCubit>().state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: BookingStyle.body(
            13,
            weight: FontWeight.w500,
          ).copyWith(color: BookingStyle.muted, letterSpacing: 1.1),
        ),
        SizedBox(height: 16.h),
        Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: slots.map((slot) {
            final selected = state.selectedTime == slot.time;
            return GestureDetector(
              onTap: slot.isBooked ? null : () => cubit.selectTime(slot.time),
              child: Container(
                width: 151.w,
                height: 92.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: slot.isBooked
                      ? const Color(0xFFEDEBED)
                      : selected
                      ? BookingStyle.primary
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: selected
                        ? BookingStyle.primary
                        : BookingStyle.border,
                    width: selected ? 1.3 : 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      slot.time,
                      style: BookingStyle.heading(18, weight: FontWeight.w600)
                          .copyWith(
                            color: slot.isBooked
                                ? const Color(0xFF9D989E)
                                : selected
                                ? Colors.white
                                : BookingStyle.ink,
                            decoration: slot.isBooked
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      slot.isBooked
                          ? 'Booked'
                          : '\$${slot.price.toStringAsFixed(0)}',
                      style: BookingStyle.body(14).copyWith(
                        color: slot.isBooked
                            ? const Color(0xFF9D989E)
                            : selected
                            ? Colors.white
                            : BookingStyle.muted,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
