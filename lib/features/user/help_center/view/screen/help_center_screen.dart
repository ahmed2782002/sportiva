import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/help_center/view_models/help_center_cubit.dart';
import 'package:sportive/features/user/help_center/view_models/help_center_state.dart';
import 'package:sportive/features/user/help_center/view/widget/faq_accordion_tile.dart';
import 'package:sportive/features/user/help_center/view/widget/support_contact_card.dart';
import 'package:sportive/features/user/help_center/view/widget/support_ticket_sheet.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  void _showTicketSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (_) => const SupportTicketSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HelpCenterCubit(),
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
            'Help Center & Support',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.neutral900,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<HelpCenterCubit, HelpCenterState>(
          builder: (context, state) {
            final cubit = context.read<HelpCenterCubit>();
            return ListView(
              padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 40.h),
              children: [
                // Search Banner
                Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.neutral200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search_rounded, color: AppColors.neutral400, size: 22.sp),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          'Search help articles or topics...',
                          style: TextStyle(
                            fontSize: 13.5.sp,
                            color: AppColors.neutral400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                Text(
                  'Quick Contact',
                  style: UserStyle.sectionTitle(),
                ),
                SizedBox(height: 12.h),
                SupportContactCard(
                  icon: Icons.chat_bubble_outline_rounded,
                  title: 'Live Chat Support',
                  subtitle: 'Typical reply time under 2 minutes',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Connecting to Sportiva Live Agent...')),
                    );
                  },
                ),
                SupportContactCard(
                  icon: Icons.mark_email_read_outlined,
                  title: 'Submit Support Ticket',
                  subtitle: 'Send us detailed logs or screenshot reports',
                  onTap: () => _showTicketSheet(context),
                ),
                SupportContactCard(
                  icon: Icons.phone_in_talk_outlined,
                  title: 'Call Support Hotline',
                  subtitle: '+20 100 000 7890 (Mon-Sat, 9AM - 10PM)',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Calling Sportiva Support...')),
                    );
                  },
                ),
                SizedBox(height: 24.h),

                Text(
                  'Frequently Asked Questions',
                  style: UserStyle.sectionTitle(),
                ),
                SizedBox(height: 12.h),
                ...state.faqs.map((faq) => FaqAccordionTile(
                  item: faq,
                  isExpanded: state.expandedFaqId == faq.id,
                  onTap: () => cubit.toggleFaq(faq.id),
                )),
              ],
            );
          },
        ),
      ),
    );
  }
}
