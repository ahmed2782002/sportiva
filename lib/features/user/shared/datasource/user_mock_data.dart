import 'package:flutter/material.dart';

import 'package:sportive/features/user/bookings/model/booking_model.dart';
import 'package:sportive/features/user/chat/model/chat_conversation_model.dart';
import 'package:sportive/features/user/chat/model/chat_message_model.dart';
import 'package:sportive/features/user/shared/model/coach_model.dart';
import 'package:sportive/features/user/shared/model/community_activity_model.dart';
import 'package:sportive/features/user/shared/model/sport_filter_model.dart';
import 'package:sportive/features/user/shared/model/venue_model.dart';

/// Static presentation data used while the API layer is not wired yet.
class UserMockData {
  UserMockData._();

  static const String _avatarUser =
      'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200&q=70';

  static const String userName = 'Ahmed';
  static const String userAvatar = _avatarUser;
  static const String weather = '24°C, Sunny';

  // ===== Home =====
  static const List<SportFilterModel> sportFilters = [
    SportFilterModel(label: 'All Sports', icon: Icons.auto_awesome_rounded),
    SportFilterModel(label: 'Padel', icon: Icons.sports_tennis_rounded),
    SportFilterModel(label: 'Tennis', icon: Icons.sports_tennis_outlined),
    SportFilterModel(label: 'Football', icon: Icons.sports_soccer_rounded),
    SportFilterModel(label: 'Basketball', icon: Icons.sports_basketball_rounded),
  ];

  static const List<VenueModel> featuredVenues = [
    VenueModel(
      name: 'Elite Padel Club',
      location: 'Downtown, DXB',
      imageUrl:
          'https://images.unsplash.com/photo-1626224583764-f87db24ac4ea?w=800&q=70',
      price: r'$40',
      rating: 4.9,
    ),
    VenueModel(
      name: 'Skyline Courts',
      location: 'Marina, DXB',
      imageUrl:
          'https://images.unsplash.com/photo-1546519638-68e109498ffc?w=800&q=70',
      price: r'$55',
      rating: 4.7,
    ),
    VenueModel(
      name: 'The Drive Arena',
      location: 'Business Bay, DXB',
      imageUrl:
          'https://images.unsplash.com/photo-1554068865-24cecd4e34b8?w=800&q=70',
      price: r'$35',
      rating: 4.6,
      isAvailable: false,
    ),
  ];

  static const List<CoachModel> featuredCoaches = [
    CoachModel(
      name: 'Coach Marco',
      specialty: 'Padel Pro',
      rating: 4.9,
      imageUrl:
          'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?w=300&q=70',
    ),
    CoachModel(
      name: 'Coach Sarah',
      specialty: 'Tennis Elite',
      rating: 5.0,
      imageUrl:
          'https://images.unsplash.com/photo-1594381898411-846e7d193883?w=300&q=70',
    ),
    CoachModel(
      name: 'Coach Adam',
      specialty: 'Basketball',
      rating: 4.8,
      imageUrl:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&q=70',
    ),
  ];

  static const List<CommunityActivityModel> community = [
    CommunityActivityModel(
      userName: 'Omar',
      action: 'just joined a',
      target: 'Tennis Match',
      time: '2 mins ago',
      imageUrl:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&q=70',
    ),
    CommunityActivityModel(
      userName: 'Lina',
      action: 'booked',
      target: 'Elite Padel Club',
      time: '15 mins ago',
      imageUrl:
          'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=200&q=70',
    ),
    CommunityActivityModel(
      userName: 'Yousef',
      action: 'is looking for players at',
      target: 'Skyline Courts',
      time: '32 mins ago',
      imageUrl:
          'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?w=200&q=70',
    ),
  ];

  // ===== Search =====
  static const List<String> recentSearches = [
    'Padel Courts',
    'Tennis Downtown',
    'Yoga Studio',
    'Indoor Football',
  ];

  static const List<SportFilterModel> sportCategories = [
    SportFilterModel(label: 'Tennis', icon: Icons.sports_tennis_rounded),
    SportFilterModel(label: 'Gym', icon: Icons.fitness_center_rounded),
    SportFilterModel(label: 'Swimming', icon: Icons.pool_rounded),
    SportFilterModel(label: 'Yoga', icon: Icons.self_improvement_rounded),
  ];

  static const List<VenueModel> topRatedVenues = [
    VenueModel(
      name: 'The Vertex Club',
      location: 'Downtown, DXB',
      imageUrl:
          'https://images.unsplash.com/photo-1622279457486-62dcc4a431d6?w=900&q=70',
      price: r'$45/hr',
      rating: 4.9,
      distance: '1.2 km away',
      tags: ['Indoor', 'Pro Shop'],
    ),
    VenueModel(
      name: 'Aura Wellness Space',
      location: 'Jumeirah, DXB',
      imageUrl:
          'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=900&q=70',
      price: r'$30/hr',
      rating: 4.8,
      distance: '2.5 km away',
      tags: ['Hot Yoga', 'Mats Included'],
    ),
    VenueModel(
      name: 'Iron Peak Gym',
      location: 'Business Bay, DXB',
      imageUrl:
          'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=900&q=70',
      price: r'$25/hr',
      rating: 4.7,
      distance: '3.1 km away',
      tags: ['24/7', 'Free Parking'],
    ),
  ];

  // ===== Bookings =====
  static const List<BookingModel> bookings = [
    BookingModel(
      venueName: 'The Drive Padel',
      sport: 'Padel',
      court: 'Court 3',
      date: 'Oct 24, 2023',
      time: '18:00 - 19:30',
      duration: '90 min',
      price: '450 EGP',
      status: BookingStatus.pending,
      imageUrl:
          'https://images.unsplash.com/photo-1626224583764-f87db24ac4ea?w=900&q=70',
    ),
    BookingModel(
      venueName: 'Kinetic Padel Club',
      sport: 'Padel',
      court: 'Court 1',
      date: 'Oct 26, 2023',
      time: '20:00 - 21:00',
      duration: '60 min',
      price: '300 EGP',
      status: BookingStatus.confirmed,
      imageUrl:
          'https://images.unsplash.com/photo-1554068865-24cecd4e34b8?w=900&q=70',
    ),
    BookingModel(
      venueName: 'Smouha Club',
      sport: 'Tennis',
      court: 'Court 1',
      date: 'Oct 15, 2023',
      time: '16:00 - 18:00',
      duration: '120 min',
      price: '600 EGP',
      status: BookingStatus.completed,
      imageUrl:
          'https://images.unsplash.com/photo-1595435934249-5df7ed86e1c0?w=900&q=70',
    ),
    BookingModel(
      venueName: 'Heliopolis Club',
      sport: 'Squash',
      court: 'Court 5',
      date: 'Oct 10, 2023',
      time: '19:00 - 20:00',
      duration: '60 min',
      price: '250 EGP',
      status: BookingStatus.rejected,
      imageUrl:
          'https://images.unsplash.com/photo-1591491634026-77cd4a0b1c04?w=900&q=70',
      rejectionReason:
          'Court required unexpected maintenance work during this time slot.',
    ),
  ];

  // ===== Chat =====
  static const List<ChatConversationModel> conversations = [
    ChatConversationModel(
      name: 'Sarah Jenkins',
      lastMessage: "See you at the court! Don't forget your racket.",
      time: '10:42 AM',
      imageUrl:
          'https://images.unsplash.com/photo-1594381898411-846e7d193883?w=200&q=70',
      isOnline: true,
      isPinned: true,
    ),
    ChatConversationModel(
      name: 'Marcus K.',
      lastMessage: 'Are we still on for the morning session tomorrow?',
      time: 'Yesterday',
      imageUrl: '',
      initials: 'MK',
      unreadCount: 1,
      isPinned: true,
    ),
    ChatConversationModel(
      name: 'David Chen',
      lastMessage: "I've sent the updated schedule for next week.",
      time: '9:15 AM',
      imageUrl:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&q=70',
      unreadCount: 3,
    ),
    ChatConversationModel(
      name: 'Weekend Ride Group',
      lastMessage: 'Alex: Sounds like a plan!',
      time: 'Tue',
      imageUrl:
          'https://images.unsplash.com/photo-1517649763962-0c623066013b?w=200&q=70',
      isMuted: true,
    ),
    ChatConversationModel(
      name: 'Alex Rivera',
      lastMessage: 'See you there!',
      time: 'Mon',
      imageUrl:
          'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?w=200&q=70',
      isOnline: true,
    ),
    ChatConversationModel(
      name: 'Coach Marco',
      lastMessage: 'Great progress on your backhand today 👏',
      time: 'Sun',
      imageUrl:
          'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?w=200&q=70',
    ),
  ];

  static const List<ChatMessageModel> conversationThread = [
    ChatMessageModel(
      text: 'Hey! Are we still on for padel at 6?',
      time: '14:23',
      isMine: true,
      isRead: true,
    ),
    ChatMessageModel(
      text: 'Absolutely, already booked the court.',
      time: '14:25',
      isMine: false,
    ),
    ChatMessageModel(
      text: '',
      time: '14:25',
      isMine: false,
      type: MessageType.booking,
      bookingVenue: 'Kinetic Padel Club',
      bookingDetails: 'Court 3 • 18:00 - 19:30',
    ),
    ChatMessageModel(text: 'See you there!', time: '14:26', isMine: false),
  ];

  // ===== Profile =====
  static const String planRenewDate = 'Oct 15, 2024';
  static const String cardLastDigits = '•••• 4242';
  static const int vouchersCount = 2;
  static const int points = 2450;
  static const int pointsToNextReward = 550;
}
