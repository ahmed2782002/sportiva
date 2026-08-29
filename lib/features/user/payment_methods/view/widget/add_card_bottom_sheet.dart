import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/payment_methods/view_models/payment_methods_state.dart';

class AddCardBottomSheet extends StatefulWidget {
  final Function(PaymentCardModel) onCardAdded;

  const AddCardBottomSheet({super.key, required this.onCardAdded});

  @override
  State<AddCardBottomSheet> createState() => _AddCardBottomSheetState();
}

class _AddCardBottomSheetState extends State<AddCardBottomSheet> {
  final _holderController = TextEditingController();
  final _numberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  void dispose() {
    _holderController.dispose();
    _numberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _submit() {
    final number = _numberController.text.trim();
    final lastFour = number.length >= 4 ? number.substring(number.length - 4) : '9999';
    final card = PaymentCardModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      cardHolder: _holderController.text.trim().isEmpty ? 'NEW CARD HOLDER' : _holderController.text.trim().toUpperCase(),
      lastFourDigits: lastFour,
      expiryDate: _expiryController.text.trim().isEmpty ? '12/28' : _expiryController.text.trim(),
      brand: 'VISA',
    );
    widget.onCardAdded(card);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20.w,
        right: 20.w,
        top: 20.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.neutral300,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Add New Card',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.neutral900,
            ),
          ),
          SizedBox(height: 16.h),
          TextField(
            controller: _holderController,
            decoration: InputDecoration(
              labelText: 'Cardholder Name',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
            ),
          ),
          SizedBox(height: 12.h),
          TextField(
            controller: _numberController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Card Number',
              hintText: 'xxxx xxxx xxxx xxxx',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _expiryController,
                  decoration: InputDecoration(
                    labelText: 'Expiry Date',
                    hintText: 'MM/YY',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: TextField(
                  controller: _cvvController,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'CVV',
                    hintText: '123',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: _submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.white,
              minimumSize: Size(double.infinity, 50.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
            ),
            child: const Text('Save Card'),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
