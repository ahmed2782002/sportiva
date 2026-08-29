import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/membership/view_models/membership_cubit.dart';
import 'package:sportive/features/user/membership/view_models/membership_state.dart';
import 'package:sportive/features/user/membership/view/widget/plan_tier_card.dart';
import 'package:sportive/features/user/membership/view/widget/membership_benefit_tile.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class MembershipScreen extends StatelessWidget {
  const MembershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MembershipCubit(),
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
            'Sportiva+ Membership',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.neutral900,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<MembershipCubit, MembershipState>(
          builder: (context, state) {
            final cubit = context.read<MembershipCubit>();
            return ListView(
              padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 40.h),
              children: [
                // Header Hero Banner
                Container(
                  padding: EdgeInsets.all(22.r),
                  decoration: BoxDecoration(
                    gradient: AppColors.userHeaderGradient,
                    borderRadius: BorderRadius.circular(24.r),
                    boxShadow: UserStyle.liftedShadow,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                            decoration: BoxDecoration(
                              color: AppColors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star_rounded, color: Colors.amber, size: 16.sp),
                                SizedBox(width: 4.w),
                                Text(
                                  'ACTIVE VIP PLAN',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.white,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.workspace_premium_rounded, color: Colors.amber, size: 28.sp),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        state.activeTier,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w900,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Renews automatically on ${state.renewDate}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                // Billing Cycle Toggle
                Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    color: AppColors.neutral200,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => cubit.toggleBillingCycle(false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            decoration: BoxDecoration(
                              color: !state.isAnnualBilling ? AppColors.white : Colors.transparent,
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: !state.isAnnualBilling ? UserStyle.softShadow : [],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Monthly',
                              style: TextStyle(
                                fontSize: 13.5.sp,
                                fontWeight: FontWeight.w700,
                                color: !state.isAnnualBilling ? AppColors.primaryColor : AppColors.neutral600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => cubit.toggleBillingCycle(true),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            decoration: BoxDecoration(
                              color: state.isAnnualBilling ? AppColors.white : Colors.transparent,
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: state.isAnnualBilling ? UserStyle.softShadow : [],
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Annual',
                                  style: TextStyle(
                                    fontSize: 13.5.sp,
                                    fontWeight: FontWeight.w700,
                                    color: state.isAnnualBilling ? AppColors.primaryColor : AppColors.neutral600,
                                  ),
                                ),
                                SizedBox(width: 6.w),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.tertiaryGreen,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Text(
                                    'SAVE 20%',
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),

                // Tier Selection Cards
                PlanTierCard(
                  title: 'Sportiva+ Pro',
                  price: state.isAnnualBilling ? '199 EGP' : '249 EGP',
                  billingPeriod: 'month',
                  isSelected: state.activeTier == 'Sportiva+ Pro',
                  isPopular: true,
                  features: const [
                    '15% Discount on all venue bookings',
                    'Priority 48h advance slot reservation',
                    '2 Free equipment rentals monthly',
                    'Dedicated WhatsApp Concierge',
                  ],
                  onTap: () => cubit.selectPlan('Sportiva+ Pro'),
                ),
                SizedBox(height: 14.h),
                PlanTierCard(
                  title: 'Sportiva Starter',
                  price: state.isAnnualBilling ? '99 EGP' : '129 EGP',
                  billingPeriod: 'month',
                  isSelected: state.activeTier == 'Sportiva Starter',
                  isPopular: false,
                  features: const [
                    '5% Discount on selected venues',
                    '24h advance slot reservation',
                    '1 Free voucher per month',
                  ],
                  onTap: () => cubit.selectPlan('Sportiva Starter'),
                ),
                SizedBox(height: 24.h),

                // Exclusive Perks Section
                Text(
                  'Exclusive Member Perks',
                  style: UserStyle.sectionTitle(),
                ),
                SizedBox(height: 12.h),
                const MembershipBenefitTile(
                  icon: Icons.bolt_rounded,
                  title: 'Instant Booking Confirmation',
                  description: 'Skip waiting queues with automated court access codes.',
                ),
                const MembershipBenefitTile(
                  icon: Icons.card_giftcard_rounded,
                  title: '2X Reward Points',
                  description: 'Earn double points on every hour booked through Sportiva.',
                ),
                const MembershipBenefitTile(
                  icon: Icons.headset_mic_rounded,
                  title: '24/7 Priority Support',
                  description: 'Direct access to your dedicated personal sports assistant.',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
