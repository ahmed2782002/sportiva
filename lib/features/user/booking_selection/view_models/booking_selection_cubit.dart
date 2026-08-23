import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sportive/features/user/booking_flow/view_models/booking_flow_cubit.dart';

class BookingSelectionState {
  const BookingSelectionState({
    required this.selectedSportIndex,
    required this.selectedCourtIndex,
  });

  factory BookingSelectionState.fromFlow(BookingFlowCubit cubit) =>
      BookingSelectionState(
        selectedSportIndex: cubit.state.selectedSportIndex,
        selectedCourtIndex: cubit.state.selectedCourtIndex,
      );

  final int selectedSportIndex;
  final int selectedCourtIndex;

  BookingSelectionState copyWith({
    int? selectedSportIndex,
    int? selectedCourtIndex,
  }) => BookingSelectionState(
    selectedSportIndex: selectedSportIndex ?? this.selectedSportIndex,
    selectedCourtIndex: selectedCourtIndex ?? this.selectedCourtIndex,
  );
}

class BookingSelectionCubit extends Cubit<BookingSelectionState> {
  BookingSelectionCubit(this.flowCubit)
    : super(BookingSelectionState.fromFlow(flowCubit));

  final BookingFlowCubit flowCubit;

  void selectSport(int index) {
    flowCubit.selectSport(index);
    emit(state.copyWith(selectedSportIndex: index));
  }

  void selectCourt(int index) {
    flowCubit.selectCourt(index);
    emit(state.copyWith(selectedCourtIndex: index));
  }

  void continueToSchedule() => flowCubit.goToSchedule();

  void back() => flowCubit.back();
}
