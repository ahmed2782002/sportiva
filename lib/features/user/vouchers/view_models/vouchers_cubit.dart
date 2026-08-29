import 'package:flutter_bloc/flutter_bloc.dart';
import 'vouchers_state.dart';

class VouchersCubit extends Cubit<VouchersState> {
  VouchersCubit() : super(const VouchersState());

  void setTab(String tab) {
    emit(state.copyWith(selectedTab: tab));
  }

  void addVoucher(VoucherModel voucher) {
    final updated = List<VoucherModel>.from(state.vouchers)..add(voucher);
    emit(state.copyWith(vouchers: updated));
  }
}
