import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sportive/features/user/booking_flow/view_models/booking_flow_cubit.dart';

class BookingEquipmentState {
  const BookingEquipmentState({required this.quantities});

  factory BookingEquipmentState.fromFlow(BookingFlowCubit cubit) =>
      BookingEquipmentState(
        quantities: Map<String, int>.from(cubit.state.equipmentQuantities),
      );

  final Map<String, int> quantities;

  BookingEquipmentState copyWith({Map<String, int>? quantities}) =>
      BookingEquipmentState(quantities: quantities ?? this.quantities);
}

class BookingEquipmentCubit extends Cubit<BookingEquipmentState> {
  BookingEquipmentCubit(this.flowCubit)
    : super(BookingEquipmentState.fromFlow(flowCubit));

  final BookingFlowCubit flowCubit;

  void setQuantity(String id, int quantity) {
    flowCubit.setEquipmentQuantity(id, quantity);
    emit(
      state.copyWith(
        quantities: Map<String, int>.from(flowCubit.state.equipmentQuantities),
      ),
    );
  }

  void continueToPayment() => flowCubit.goToPayment();

  void back() => flowCubit.back();
}
