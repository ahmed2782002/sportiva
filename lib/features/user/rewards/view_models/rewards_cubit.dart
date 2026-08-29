import 'package:flutter_bloc/flutter_bloc.dart';
import 'rewards_state.dart';

class RewardsCubit extends Cubit<RewardsState> {
  RewardsCubit() : super(const RewardsState());

  void setTab(String tab) {
    emit(state.copyWith(selectedTab: tab));
  }
}
