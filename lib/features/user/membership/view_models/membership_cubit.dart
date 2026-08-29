import 'package:flutter_bloc/flutter_bloc.dart';
import 'membership_state.dart';

class MembershipCubit extends Cubit<MembershipState> {
  MembershipCubit() : super(const MembershipState());

  void toggleBillingCycle(bool isAnnual) {
    emit(state.copyWith(isAnnualBilling: isAnnual));
  }

  void selectPlan(String planName) {
    emit(state.copyWith(activeTier: planName));
  }
}
