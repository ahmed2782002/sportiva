import 'package:flutter_bloc/flutter_bloc.dart';
import 'identity_verification_state.dart';

class IdentityVerificationCubit extends Cubit<IdentityVerificationState> {
  IdentityVerificationCubit() : super(const IdentityVerificationState());

  void toggleFrontUpload() {
    emit(state.copyWith(isFrontUploaded: !state.isFrontUploaded));
  }

  void toggleBackUpload() {
    emit(state.copyWith(isBackUploaded: !state.isBackUploaded));
  }

  void submitForReview() {
    emit(state.copyWith(status: VerificationStatus.pending));
  }
}
