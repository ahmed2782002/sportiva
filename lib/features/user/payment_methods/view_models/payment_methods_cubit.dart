import 'package:flutter_bloc/flutter_bloc.dart';
import 'payment_methods_state.dart';

class PaymentMethodsCubit extends Cubit<PaymentMethodsState> {
  PaymentMethodsCubit() : super(const PaymentMethodsState());

  void setDefaultCard(String cardId) {
    emit(state.copyWith(selectedDefaultCardId: cardId));
  }

  void addCard(PaymentCardModel card) {
    final updated = List<PaymentCardModel>.from(state.cards)..add(card);
    emit(state.copyWith(cards: updated));
  }

  void topUpWallet(double amount) {
    emit(state.copyWith(walletBalance: state.walletBalance + amount));
  }
}
