import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:sportive/core/utils/constants/app_strings.dart';

enum BookingStatus { confirmed, pending, completed, rejected }

extension BookingStatusUi on BookingStatus {
  String get label => switch (this) {
    BookingStatus.confirmed => AppString.statusConfirmed.tr(),
    BookingStatus.pending => AppString.statusPending.tr(),
    BookingStatus.completed => AppString.statusCompleted.tr(),
    BookingStatus.rejected => AppString.statusRejected.tr(),
  };

  Color get color => switch (this) {
    BookingStatus.confirmed => const Color(0xFF2F80ED),
    BookingStatus.pending => const Color(0xFFE0A004),
    BookingStatus.completed => const Color(0xFF2E9E4F),
    BookingStatus.rejected => const Color(0xFFE04545),
  };

  Color get surface => switch (this) {
    BookingStatus.confirmed => const Color(0xFFE8F1FD),
    BookingStatus.pending => const Color(0xFFFDF4DC),
    BookingStatus.completed => const Color(0xFFE4F6E9),
    BookingStatus.rejected => const Color(0xFFFCE7E7),
  };

  bool get isUpcoming =>
      this == BookingStatus.pending || this == BookingStatus.confirmed;
}

class BookingModel {
  const BookingModel({
    required this.venueName,
    required this.sport,
    required this.court,
    required this.date,
    required this.time,
    required this.duration,
    required this.price,
    required this.status,
    required this.imageUrl,
    this.rejectionReason,
  });

  final String venueName;
  final String sport;
  final String court;
  final String date;
  final String time;
  final String duration;
  final String price;
  final BookingStatus status;
  final String imageUrl;
  final String? rejectionReason;
}
