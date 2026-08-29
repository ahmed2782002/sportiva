import 'package:flutter_bloc/flutter_bloc.dart';
import 'terms_privacy_state.dart';

class TermsPrivacyCubit extends Cubit<TermsPrivacyState> {
  TermsPrivacyCubit() : super(const TermsPrivacyState());

  void setTab(String tab) => emit(state.copyWith(activeTab: tab));
}
