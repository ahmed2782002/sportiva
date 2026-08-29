import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/terms_privacy/view_models/terms_privacy_cubit.dart';
import 'package:sportive/features/user/terms_privacy/view_models/terms_privacy_state.dart';
import 'package:sportive/features/user/terms_privacy/view/widget/terms_section_card.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class TermsPrivacyScreen extends StatelessWidget {
  const TermsPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TermsPrivacyCubit(),
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
            'Terms & Privacy Policy',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.neutral900,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<TermsPrivacyCubit, TermsPrivacyState>(
          builder: (context, state) {
            final cubit = context.read<TermsPrivacyCubit>();
            return ListView(
              padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 40.h),
              children: [
                // Segmented Tab bar
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => cubit.setTab('terms'),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color: state.activeTab == 'terms' ? AppColors.primaryColor : AppColors.white,
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(
                              color: state.activeTab == 'terms' ? AppColors.primaryColor : AppColors.neutral200,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Terms of Service',
                            style: TextStyle(
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w700,
                              color: state.activeTab == 'terms' ? AppColors.white : AppColors.neutral700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => cubit.setTab('privacy'),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color: state.activeTab == 'privacy' ? AppColors.primaryColor : AppColors.white,
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(
                              color: state.activeTab == 'privacy' ? AppColors.primaryColor : AppColors.neutral200,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w700,
                              color: state.activeTab == 'privacy' ? AppColors.white : AppColors.neutral700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),

                Text(
                  'Last updated: ${state.lastUpdated}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11.5.sp,
                    color: AppColors.neutral500,
                  ),
                ),
                SizedBox(height: 16.h),

                if (state.activeTab == 'terms') ...[
                  const TermsSectionCard(
                    title: '1. Acceptance of Terms',
                    content: 'By accessing or using Sportiva app services, you agree to be bound by these terms. If you do not agree, please do not use our court booking or coaching services.',
                  ),
                  const TermsSectionCard(
                    title: '2. Court Bookings & Cancellation Policy',
                    content: 'Bookings confirmed via Sportiva are subject to individual venue rules. Cancellations made 4+ hours in advance are eligible for 100% wallet credit refund.',
                  ),
                  const TermsSectionCard(
                    title: '3. User Conduct & Fair Play',
                    content: 'All players must arrive on time, respect court facilities, wear non-marking shoes, and maintain sportsmanship. Violations may result in account suspension.',
                  ),
                ] else ...[
                  const TermsSectionCard(
                    title: '1. Data Collection',
                    content: 'We collect information such as name, phone number, location, and booking preferences to facilitate court reservations and match recommendations.',
                  ),
                  const TermsSectionCard(
                    title: '2. Data Security & Storage',
                    content: 'Your payment credentials are processed securely using PCI-DSS certified payment gateways. Sportiva does not store raw credit card CVV numbers.',
                  ),
                  const TermsSectionCard(
                    title: '3. Third-Party Sharing',
                    content: 'We share necessary booking details (your name and slot time) with the relevant venue or coach solely for slot verification purposes.',
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
