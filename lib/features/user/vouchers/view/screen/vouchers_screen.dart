import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/vouchers/view_models/vouchers_cubit.dart';
import 'package:sportive/features/user/vouchers/view_models/vouchers_state.dart';
import 'package:sportive/features/user/vouchers/view/widget/voucher_card_widget.dart';
import 'package:sportive/features/user/vouchers/view/widget/redeem_code_card.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class VouchersScreen extends StatelessWidget {
  const VouchersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VouchersCubit(),
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
            'Saved Vouchers',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.neutral900,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<VouchersCubit, VouchersState>(
          builder: (context, state) {
            final cubit = context.read<VouchersCubit>();
            final activeVouchers = state.vouchers.where((v) => !v.isExpired).toList();
            final expiredVouchers = state.vouchers.where((v) => v.isExpired).toList();

            return ListView(
              padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 40.h),
              children: [
                RedeemCodeCard(
                  onRedeem: (code) {
                    cubit.addVoucher(VoucherModel(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      title: 'Promo Discount ($code)',
                      discountText: '50 EGP',
                      code: code.toUpperCase(),
                      expiryDate: 'Exp: 31 Dec 2024',
                      minBooking: 'Min booking 150 EGP',
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Promo Code "$code" applied!')),
                    );
                  },
                ),
                SizedBox(height: 24.h),

                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => cubit.setTab('active'),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color: state.selectedTab == 'active' ? AppColors.primaryColor : AppColors.white,
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(
                              color: state.selectedTab == 'active' ? AppColors.primaryColor : AppColors.neutral200,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Active (${activeVouchers.length})',
                            style: TextStyle(
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w700,
                              color: state.selectedTab == 'active' ? AppColors.white : AppColors.neutral700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => cubit.setTab('used'),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color: state.selectedTab == 'used' ? AppColors.primaryColor : AppColors.white,
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(
                              color: state.selectedTab == 'used' ? AppColors.primaryColor : AppColors.neutral200,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Expired / Used (${expiredVouchers.length})',
                            style: TextStyle(
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w700,
                              color: state.selectedTab == 'used' ? AppColors.white : AppColors.neutral700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                if (state.selectedTab == 'active')
                  ...activeVouchers.map((v) => VoucherCardWidget(voucher: v))
                else
                  ...expiredVouchers.map((v) => VoucherCardWidget(voucher: v)),
              ],
            );
          },
        ),
      ),
    );
  }
}
