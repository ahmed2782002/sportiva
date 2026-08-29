import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/rewards/view_models/rewards_cubit.dart';
import 'package:sportive/features/user/rewards/view_models/rewards_state.dart';
import 'package:sportive/features/user/rewards/view/widget/points_balance_header.dart';
import 'package:sportive/features/user/rewards/view/widget/reward_item_card.dart';
import 'package:sportive/features/user/rewards/view/widget/points_history_tile.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RewardsCubit(),
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
            'Points & Rewards',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.neutral900,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<RewardsCubit, RewardsState>(
          builder: (context, state) {
            final cubit = context.read<RewardsCubit>();
            return ListView(
              padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 40.h),
              children: [
                PointsBalanceHeader(
                  points: state.points,
                  pointsToNextReward: state.pointsToNextReward,
                  tier: state.currentTier,
                ),
                SizedBox(height: 24.h),

                // Segmented Tab bar
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => cubit.setTab('rewards'),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color: state.selectedTab == 'rewards' ? AppColors.primaryColor : AppColors.white,
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(
                              color: state.selectedTab == 'rewards' ? AppColors.primaryColor : AppColors.neutral200,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Redeem Catalog',
                            style: TextStyle(
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w700,
                              color: state.selectedTab == 'rewards' ? AppColors.white : AppColors.neutral700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => cubit.setTab('history'),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color: state.selectedTab == 'history' ? AppColors.primaryColor : AppColors.white,
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(
                              color: state.selectedTab == 'history' ? AppColors.primaryColor : AppColors.neutral200,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Points History',
                            style: TextStyle(
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w700,
                              color: state.selectedTab == 'history' ? AppColors.white : AppColors.neutral700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                if (state.selectedTab == 'rewards') ...[
                  RewardItemCard(
                    title: 'Free 1h Padel Court',
                    description: 'Valid for any indoor/outdoor padel venue on Sportiva.',
                    pointsCost: 1500,
                    icon: Icons.sports_tennis_rounded,
                    onRedeem: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Voucher redeemed successfully!')),
                      );
                    },
                  ),
                  RewardItemCard(
                    title: '50% Off Coach Session',
                    description: 'Get half-price pro training with top rated coaches.',
                    pointsCost: 1000,
                    icon: Icons.sports_rounded,
                    onRedeem: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Voucher redeemed successfully!')),
                      );
                    },
                  ),
                  RewardItemCard(
                    title: 'Sportiva Water Bottle',
                    description: 'Insulated stainless steel sports bottle (750ml).',
                    pointsCost: 800,
                    icon: Icons.local_drink_rounded,
                    onRedeem: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Item added to claims!')),
                      );
                    },
                  ),
                ] else ...[
                  const PointsHistoryTile(
                    title: 'Booked Elite Padel Court 3',
                    date: 'Oct 24, 2023 • 18:00',
                    points: 150,
                    isEarned: true,
                  ),
                  const PointsHistoryTile(
                    title: 'Referral Bonus (Omar H.)',
                    date: 'Oct 20, 2023 • 14:15',
                    points: 500,
                    isEarned: true,
                  ),
                  const PointsHistoryTile(
                    title: 'Redeemed 20% Discount Voucher',
                    date: 'Oct 15, 2023 • 11:30',
                    points: 300,
                    isEarned: false,
                  ),
                  const PointsHistoryTile(
                    title: 'Booked Kinetic Padel Match',
                    date: 'Oct 10, 2023 • 20:00',
                    points: 100,
                    isEarned: true,
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
