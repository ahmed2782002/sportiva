import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/payment_methods/view_models/payment_methods_cubit.dart';
import 'package:sportive/features/user/payment_methods/view_models/payment_methods_state.dart';
import 'package:sportive/features/user/payment_methods/view/widget/wallet_balance_card.dart';
import 'package:sportive/features/user/payment_methods/view/widget/saved_card_widget.dart';
import 'package:sportive/features/user/payment_methods/view/widget/add_card_bottom_sheet.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  void _showAddCardSheet(BuildContext context, PaymentMethodsCubit cubit) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (_) => AddCardBottomSheet(
        onCardAdded: (card) => cubit.addCard(card),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentMethodsCubit(),
      child: Scaffold(
        backgroundColor: UserStyle.canvas,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.neutral900, size: 20.sp),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Payment Methods',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.neutral900,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<PaymentMethodsCubit, PaymentMethodsState>(
          builder: (context, state) {
            final cubit = context.read<PaymentMethodsCubit>();
            return ListView(
              padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 40.h),
              children: [
                WalletBalanceCard(
                  balance: state.walletBalance,
                  onTopUp: () {
                    cubit.topUpWallet(100.00);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Added 100.00 EGP to Sportiva Wallet!')),
                    );
                  },
                ),
                SizedBox(height: 26.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Saved Credit Cards',
                      style: UserStyle.sectionTitle(),
                    ),
                    TextButton.icon(
                      onPressed: () => _showAddCardSheet(context, cubit),
                      icon: Icon(Icons.add_circle_outline_rounded, size: 18.sp, color: AppColors.primaryColor),
                      label: Text(
                        'Add Card',
                        style: TextStyle(
                          fontSize: 13.5.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),

                ...state.cards.map((card) => SavedCardWidget(
                  card: card,
                  isDefault: card.id == state.selectedDefaultCardId,
                  onSelectDefault: () => cubit.setDefaultCard(card.id),
                )),

                SizedBox(height: 20.h),

                Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.neutral200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.shield_outlined, color: AppColors.tertiaryGreen, size: 24.sp),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          '256-bit SSL Encrypted Payments. Your card details are stored securely with PCI-DSS compliance.',
                          style: TextStyle(
                            fontSize: 11.5.sp,
                            color: AppColors.neutral600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
