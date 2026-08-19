import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/user/bookings/model/booking_model.dart';
import 'package:sportive/features/user/shared/view/widget/user_network_image.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
    required this.booking,
    this.onPrimaryAction,
    this.onSecondaryAction,
  });

  final BookingModel booking;
  final VoidCallback? onPrimaryAction;
  final VoidCallback? onSecondaryAction;

  bool get _isRejected => booking.status == BookingStatus.rejected;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(10.r),
    decoration: UserStyle.card(radius: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: _cover(),
        ),
        SizedBox(height: 14.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      booking.venueName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.neutral900,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  _StatusChip(status: booking.status),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                '${booking.sport} • ${booking.court}',
                style: UserStyle.caption(),
              ),
              SizedBox(height: 14.h),
              Row(
                children: [
                  Expanded(
                    child: _detail(
                      Icons.calendar_today_outlined,
                      booking.date,
                    ),
                  ),
                  Expanded(
                    child: _detail(Icons.access_time_rounded, booking.time),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: _detail(Icons.timer_outlined, booking.duration),
                  ),
                  Expanded(
                    child: _detail(
                      Icons.payments_outlined,
                      booking.price,
                      highlight: true,
                    ),
                  ),
                ],
              ),
              if (_isRejected && booking.rejectionReason != null) ...[
                SizedBox(height: 14.h),
                Container(
                  padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 10.h),
                  decoration: BoxDecoration(
                    color: BookingStatus.rejected.surface,
                    borderRadius: BorderRadius.circular(12.r),
                    border: BorderDirectional(
                      start: BorderSide(
                        color: BookingStatus.rejected.color,
                        width: 3,
                      ),
                    ),
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: '${AppString.rejectionReason.tr()} ',
                      style: TextStyle(
                        fontSize: 12.5.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.neutral800,
                      ),
                      children: [
                        TextSpan(
                          text: booking.rejectionReason,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.neutral700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              if (!_isRejected) ...[
                SizedBox(height: 14.h),
                Divider(height: 1, thickness: 1, color: AppColors.neutral200),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Expanded(
                      child: _action(
                        label: booking.status == BookingStatus.completed
                            ? AppString.bookAgain.tr()
                            : AppString.viewDetails.tr(),
                        onTap: onPrimaryAction,
                      ),
                    ),
                    Expanded(
                      child: _action(
                        label: booking.status == BookingStatus.completed
                            ? AppString.rate.tr()
                            : AppString.cancelBooking.tr(),
                        icon: booking.status == BookingStatus.completed
                            ? Icons.star_rounded
                            : null,
                        onTap: onSecondaryAction,
                        isDestructive:
                            booking.status != BookingStatus.completed,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    ),
  );

  /// Cancelled bookings are desaturated so the list reads at a glance.
  Widget _cover() {
    final image = UserNetworkImage(
      url: booking.imageUrl,
      height: 150.h,
      width: double.infinity,
    );

    if (!_isRejected) return image;

    return ColorFiltered(
      colorFilter: const ColorFilter.matrix(<double>[
        0.2126, 0.7152, 0.0722, 0, 0, //
        0.2126, 0.7152, 0.0722, 0, 0, //
        0.2126, 0.7152, 0.0722, 0, 0, //
        0, 0, 0, 1, 0, //
      ]),
      child: image,
    );
  }

  Widget _detail(IconData icon, String value, {bool highlight = false}) => Row(
    children: [
      Icon(
        icon,
        size: 15.sp,
        color: highlight ? AppColors.primaryColor : AppColors.neutral500,
      ),
      SizedBox(width: 7.w),
      Expanded(
        child: Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12.5.sp,
            fontWeight: highlight ? FontWeight.w800 : FontWeight.w500,
            color: highlight ? AppColors.primaryColor : AppColors.neutral700,
          ),
        ),
      ),
    ],
  );

  Widget _action({
    required String label,
    VoidCallback? onTap,
    IconData? icon,
    bool isDestructive = false,
  }) => GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16.sp, color: AppColors.neutral900),
            SizedBox(width: 6.w),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: isDestructive
                  ? AppColors.neutral800
                  : AppColors.neutral900,
            ),
          ),
        ],
      ),
    ),
  );
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final BookingStatus status;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
    decoration: BoxDecoration(
      color: status.surface,
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 6.r,
          height: 6.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: status.color,
          ),
        ),
        SizedBox(width: 6.w),
        Text(
          status.label,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.4,
            color: status.color,
          ),
        ),
      ],
    ),
  );
}
