import 'package:sportive/features/user/shared/model/venue_model.dart';

class BookingSport {
  const BookingSport({
    required this.name,
    required this.subtitle,
    required this.imageUrl,
    required this.icon,
  });

  final String name;
  final String subtitle;
  final String imageUrl;
  final String icon;
}

class BookingCourt {
  const BookingCourt({
    required this.name,
    required this.venue,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.surface,
    this.isAvailable = true,
  });

  final String name;
  final String venue;
  final String imageUrl;
  final double price;
  final String description;
  final String surface;
  final bool isAvailable;
}

class BookingTimeSlot {
  const BookingTimeSlot({
    required this.time,
    required this.price,
    this.isBooked = false,
    this.isPeak = false,
  });

  final String time;
  final double price;
  final bool isBooked;
  final bool isPeak;
}

class EquipmentItem {
  const EquipmentItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  final String id;
  final String name;
  final double price;
  final String imageUrl;
}

class BookingVenue {
  const BookingVenue({
    required this.name,
    required this.location,
    required this.imageUrl,
  });

  factory BookingVenue.fromVenue(VenueModel venue) => BookingVenue(
    name: venue.name,
    location: venue.location,
    imageUrl: venue.imageUrl,
  );

  final String name;
  final String location;
  final String imageUrl;
}
