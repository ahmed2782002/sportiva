import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sportive/features/user/booking_flow/view_models/booking_flow_cubit.dart';
import 'package:sportive/features/user/booking_shared/model/booking_models.dart';

class BookingScheduleState {
  const BookingScheduleState({
    required this.selectedDateIndex,
    required this.selectedDuration,
    required this.selectedTime,
  });

  factory BookingScheduleState.fromFlow(BookingFlowCubit cubit) =>
      BookingScheduleState(
        selectedDateIndex: cubit.state.selectedDateIndex,
        selectedDuration: cubit.state.selectedDuration,
        selectedTime: cubit.state.selectedTime,
      );

  final int selectedDateIndex;
  final int selectedDuration;
  final String selectedTime;

  BookingScheduleState copyWith({
    int? selectedDateIndex,
    int? selectedDuration,
    String? selectedTime,
  }) => BookingScheduleState(
    selectedDateIndex: selectedDateIndex ?? this.selectedDateIndex,
    selectedDuration: selectedDuration ?? this.selectedDuration,
    selectedTime: selectedTime ?? this.selectedTime,
  );
}

class BookingScheduleCubit extends Cubit<BookingScheduleState> {
  BookingScheduleCubit(this.flowCubit)
    : super(BookingScheduleState.fromFlow(flowCubit));

  final BookingFlowCubit flowCubit;

  BookingCourt get selectedCourt => flowCubit.selectedCourt;

  void selectDate(int index) {
    flowCubit.selectDate(index);
    emit(state.copyWith(selectedDateIndex: index));
  }

  void selectDuration(int duration) {
    flowCubit.selectDuration(duration);
    emit(state.copyWith(selectedDuration: duration));
  }

  void selectTime(String time) {
    flowCubit.selectTime(time);
    emit(state.copyWith(selectedTime: time));
  }

  void continueToEquipment() => flowCubit.goToEquipment();

  void back() => flowCubit.back();
}
