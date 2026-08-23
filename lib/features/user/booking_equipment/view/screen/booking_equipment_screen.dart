import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/features/user/booking_equipment/view_models/booking_equipment_cubit.dart';
import 'package:sportive/features/user/booking_shared/data/datasource/booking_mock_data.dart';
import 'package:sportive/features/user/booking_shared/model/booking_models.dart';
import 'package:sportive/features/user/shared/view/widget/user_network_image.dart';

import 'package:sportive/features/user/booking_shared/view/widget/booking_buttons.dart';
import 'package:sportive/features/user/booking_shared/view/widget/booking_header.dart';
import 'package:sportive/features/user/booking_shared/view/widget/booking_style.dart';

class BookingEquipmentScreen extends StatelessWidget {
  const BookingEquipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingEquipmentCubit>();
    final flowCubit = cubit.flowCubit;
    final state = context.watch<BookingEquipmentCubit>().state;

    return Scaffold(
      backgroundColor: BookingStyle.background,
      bottomNavigationBar: BookingBottomBar(
        title: 'Total Cost',
        subtitle: '\$${flowCubit.total.toStringAsFixed(2)}',
        buttonLabel: 'Continue to Payment',
        onPressed: cubit.continueToPayment,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 135.h),
          children: [
            BookingHeader(onBack: cubit.back),
            const BookingStepProgress(step: 2, label: 'Equipment'),
            SizedBox(height: 47.h),
            Text('Equipment Rentals', style: BookingStyle.heading(31)),
            SizedBox(height: 40.h),
            ...BookingMockData.equipment.map(
              (item) => Padding(
                padding: EdgeInsets.only(bottom: 25.h),
                child: _EquipmentCard(
                  item: item,
                  quantity: state.quantities[item.id] ?? 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EquipmentCard extends StatelessWidget {
  const _EquipmentCard({required this.item, required this.quantity});

  final EquipmentItem item;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingEquipmentCubit>();
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 26.h),
      decoration: BookingStyle.card(radius: 22),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: UserNetworkImage(
              url: item.imageUrl,
              width: double.infinity,
              height: 143.h,
              fallbackIcon: Icons.sports_tennis_rounded,
            ),
          ),
          SizedBox(height: 28.h),
          Text(
            item.name,
            style: BookingStyle.heading(23, weight: FontWeight.w600),
          ),
          SizedBox(height: 3.h),
          Text(
            '+\$${item.price.toStringAsFixed(2)} / ea',
            style: BookingStyle.body(18).copyWith(color: BookingStyle.muted),
          ),
          SizedBox(height: 27.h),
          Container(
            height: 56.h,
            width: 174.w,
            decoration: BoxDecoration(
              color: BookingStyle.pale,
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(color: BookingStyle.border),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _QuantityButton(
                  icon: Icons.remove,
                  onTap: () => cubit.setQuantity(item.id, quantity - 1),
                ),
                Text(
                  '$quantity',
                  style: BookingStyle.heading(22, weight: FontWeight.w500),
                ),
                _QuantityButton(
                  icon: Icons.add,
                  onTap: () => cubit.setQuantity(item.id, quantity + 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(20.r),
    child: Padding(
      padding: EdgeInsets.all(8.r),
      child: Icon(icon, size: 22.sp, color: BookingStyle.muted),
    ),
  );
}
