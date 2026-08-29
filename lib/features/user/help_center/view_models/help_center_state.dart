class FaqItemModel {
  final String id;
  final String question;
  final String answer;

  const FaqItemModel({
    required this.id,
    required this.question,
    required this.answer,
  });
}

class HelpCenterState {
  final String expandedFaqId;
  final List<FaqItemModel> faqs;

  const HelpCenterState({
    this.expandedFaqId = '',
    this.faqs = const [
      FaqItemModel(
        id: 'faq1',
        question: 'How do I cancel or reschedule a venue booking?',
        answer: 'Navigate to "My Bookings", select your upcoming match, and tap "Cancel Booking". Full refunds are credited to your Sportiva Wallet if cancelled at least 4 hours prior.',
      ),
      FaqItemModel(
        id: 'faq2',
        question: 'What happens if it rains during an outdoor session?',
        answer: 'Venues will automatically issue a rain-check voucher or full wallet refund if weather forces court closure.',
      ),
      FaqItemModel(
        id: 'faq3',
        question: 'How do Sportiva+ reward points work?',
        answer: 'You earn 10 points for every 10 EGP spent on venue or coach bookings. Points can be redeemed for court vouchers, gear, or free sessions.',
      ),
      FaqItemModel(
        id: 'faq4',
        question: 'Can I split the booking payment with my friends?',
        answer: 'Yes! When confirming a booking, choose "Split Payment" to generate a shareable payment link for your squad.',
      ),
    ],
  });

  HelpCenterState copyWith({
    String? expandedFaqId,
    List<FaqItemModel>? faqs,
  }) {
    return HelpCenterState(
      expandedFaqId: expandedFaqId ?? this.expandedFaqId,
      faqs: faqs ?? this.faqs,
    );
  }
}
