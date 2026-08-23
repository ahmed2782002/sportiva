import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportive/features/user/booking_confirmation/view/screen/booking_confirmation_screen.dart';
import 'package:sportive/features/user/booking_equipment/view/screen/booking_equipment_screen.dart';
import 'package:sportive/features/user/booking_payment/view/screen/booking_payment_screen.dart';
import 'package:sportive/features/user/booking_schedule/view/screen/booking_schedule_screen.dart';
import 'package:sportive/features/user/booking_selection/view/screen/booking_selection_screen.dart';
import 'package:sportive/features/user/booking_shared/model/booking_models.dart';
import 'package:sportive/features/user/booking_status/view/screen/booking_status_screen.dart';
import 'package:sportive/features/user/booking_flow/view_models/booking_flow_cubit.dart';
import 'package:sportive/features/user/booking_flow/view_models/booking_flow_state.dart';
import 'package:sportive/features/user/booking_equipment/view_models/booking_equipment_cubit.dart';
import 'package:sportive/features/user/booking_payment/view_models/booking_payment_cubit.dart';
import 'package:sportive/features/user/booking_schedule/view_models/booking_schedule_cubit.dart';
import 'package:sportive/features/user/booking_selection/view_models/booking_selection_cubit.dart';

class BookingFlowScreen extends StatelessWidget {
  const BookingFlowScreen({super.key, this.venue});

  final BookingVenue? venue;

  static void open(BuildContext context, {BookingVenue? venue}) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => BookingFlowScreen(venue: venue)),
    );
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => BookingFlowCubit(venue: venue),
    child: const _BookingFlowView(),
  );
}

class _BookingFlowView extends StatelessWidget {
  const _BookingFlowView();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<BookingFlowCubit, BookingFlowState>(
        builder: (context, state) => PopScope(
          canPop: state.step == BookingStep.venue,
          onPopInvokedWithResult: (didPop, _) {
            if (!didPop) context.read<BookingFlowCubit>().back();
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 240),
            child: _stepFor(context, state.step),
          ),
        ),
      );

  Widget _stepFor(BuildContext context, BookingStep step) {
    final flowCubit = context.read<BookingFlowCubit>();

    return switch (step) {
      BookingStep.venue => BlocProvider(
        key: const ValueKey('venue-provider'),
        create: (_) => BookingSelectionCubit(flowCubit),
        child: const BookingSelectionScreen(key: ValueKey('venue')),
      ),
      BookingStep.schedule => BlocProvider(
        key: const ValueKey('schedule-provider'),
        create: (_) => BookingScheduleCubit(flowCubit),
        child: const BookingScheduleScreen(key: ValueKey('schedule')),
      ),
      BookingStep.equipment => BlocProvider(
        key: const ValueKey('equipment-provider'),
        create: (_) => BookingEquipmentCubit(flowCubit),
        child: const BookingEquipmentScreen(key: ValueKey('equipment')),
      ),
      BookingStep.payment => BlocProvider(
        key: const ValueKey('payment-provider'),
        create: (_) => BookingPaymentCubit(flowCubit),
        child: const BookingPaymentScreen(key: ValueKey('payment')),
      ),
      BookingStep.confirmation => const BookingConfirmationScreen(
        key: ValueKey('confirmation'),
      ),
      BookingStep.status => const BookingStatusScreen(key: ValueKey('status')),
    };
  }
}
