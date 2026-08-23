import 'package:sportive/features/user/booking_shared/model/booking_models.dart';

class BookingMockData {
  BookingMockData._();

  static const List<String> dates = ['14', '15', '16', '17', '18'];
  static const List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

  static const List<BookingSport> sports = [
    BookingSport(
      name: 'Padel',
      subtitle: '4 Courts Available',
      imageUrl:
          'https://images.unsplash.com/photo-1626224583764-f87db24ac4ea?w=900&q=85',
      icon: '⌁',
    ),
    BookingSport(
      name: 'Tennis',
      subtitle: '2 Courts Available',
      imageUrl:
          'https://images.unsplash.com/photo-1595435934249-5df7ed86e1c0?w=900&q=85',
      icon: '↗',
    ),
    BookingSport(
      name: 'Squash',
      subtitle: 'Fully Booked',
      imageUrl:
          'https://images.unsplash.com/photo-1591491634026-77cd4a0b1c04?w=900&q=85',
      icon: '↗',
    ),
  ];

  static const List<BookingCourt> courts = [
    BookingCourt(
      name: 'Court 1 - Alpha',
      venue: 'Premium indoor panoramic court with professional lighting.',
      imageUrl:
          'https://images.unsplash.com/photo-1626224583764-f87db24ac4ea?w=900&q=85',
      price: 45,
      description: 'Premium indoor panoramic court with professional lighting.',
      surface: 'Mondo Turf',
    ),
    BookingCourt(
      name: 'Court 2 - Beta',
      venue: 'Outdoor exhibition court. Great for evening matches.',
      imageUrl:
          'https://images.unsplash.com/photo-1554068865-24cecd4e34b8?w=900&q=85',
      price: 35,
      description: 'Outdoor exhibition court. Great for evening matches.',
      surface: 'Outdoor',
    ),
  ];

  static const List<BookingTimeSlot> morningSlots = [
    BookingTimeSlot(time: '08:00', price: 45),
    BookingTimeSlot(time: '09:30', price: 45),
    BookingTimeSlot(time: '11:00', price: 45, isBooked: true),
  ];

  static const List<BookingTimeSlot> afternoonSlots = [
    BookingTimeSlot(time: '12:30', price: 55),
    BookingTimeSlot(time: '14:00', price: 55, isPeak: true),
    BookingTimeSlot(time: '15:30', price: 65, isPeak: true),
    BookingTimeSlot(time: '17:00', price: 65, isPeak: true),
  ];

  static const List<BookingTimeSlot> eveningSlots = [
    BookingTimeSlot(time: '18:30', price: 50),
    BookingTimeSlot(time: '20:00', price: 45),
  ];

  static const List<EquipmentItem> equipment = [
    EquipmentItem(
      id: 'racket',
      name: 'Premium Racket',
      price: 15,
      imageUrl:
          'https://images.unsplash.com/photo-1554068865-24cecd4e34b8?w=900&q=85',
    ),
    EquipmentItem(
      id: 'balls',
      name: 'Can of Balls',
      price: 8,
      imageUrl:
          'https://images.unsplash.com/photo-1622279457486-62dcc4a431d6?w=900&q=85',
    ),
  ];
}
