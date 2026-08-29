import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/features/user/identity_verification/view_models/identity_verification_cubit.dart';
import 'package:sportive/features/user/identity_verification/view_models/identity_verification_state.dart';
import 'package:sportive/features/user/identity_verification/view/widget/verification_status_card.dart';
import 'package:sportive/features/user/identity_verification/view/widget/document_upload_tile.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class IdentityVerificationScreen extends StatelessWidget {
  const IdentityVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => IdentityVerificationCubit(),
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
            'Identity Verification',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.neutral900,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<IdentityVerificationCubit, IdentityVerificationState>(
          builder: (context, state) {
            final cubit = context.read<IdentityVerificationCubit>();
            return ListView(
              padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 40.h),
              children: [
                VerificationStatusCard(status: state.status),
                SizedBox(height: 24.h),

                Text(
                  'Verified Information',
                  style: UserStyle.sectionTitle(),
                ),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.all(18.r),
                  decoration: UserStyle.card(radius: 18),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Full Legal Name', style: UserStyle.caption()),
                          Text(
                            state.fullName,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.neutral900,
                            ),
                          ),
                        ],
                      ),
                      Divider(color: AppColors.neutral200, height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('National ID / Passport', style: UserStyle.caption()),
                          Text(
                            state.nationalId,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.neutral900,
                            ),
                          ),
                        ],
                      ),
                      Divider(color: AppColors.neutral200, height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Document Type', style: UserStyle.caption()),
                          Text(
                            state.documentType,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.neutral900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                Text(
                  'Upload Required Documents',
                  style: UserStyle.sectionTitle(),
                ),
                SizedBox(height: 12.h),
                DocumentUploadTile(
                  title: 'National ID (Front Side)',
                  isUploaded: state.isFrontUploaded,
                  onTap: cubit.toggleFrontUpload,
                ),
                DocumentUploadTile(
                  title: 'National ID (Back Side)',
                  isUploaded: state.isBackUploaded,
                  onTap: cubit.toggleBackUpload,
                ),
                SizedBox(height: 20.h),

                ElevatedButton(
                  onPressed: state.status == VerificationStatus.verified
                      ? null
                      : cubit.submitForReview,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.white,
                    disabledBackgroundColor: AppColors.neutral300,
                    minimumSize: Size(double.infinity, 52.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    state.status == VerificationStatus.verified
                        ? 'Verification Completed'
                        : 'Submit Verification Documents',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
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
