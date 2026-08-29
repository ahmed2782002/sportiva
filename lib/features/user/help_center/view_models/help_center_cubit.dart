import 'package:flutter_bloc/flutter_bloc.dart';
import 'help_center_state.dart';

class HelpCenterCubit extends Cubit<HelpCenterState> {
  HelpCenterCubit() : super(const HelpCenterState());

  void toggleFaq(String id) {
    if (state.expandedFaqId == id) {
      emit(state.copyWith(expandedFaqId: ''));
    } else {
      emit(state.copyWith(expandedFaqId: id));
    }
  }
}
