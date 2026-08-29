import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/core/utils/constants/app_colors.dart';

class DocumentUploadTile extends StatelessWidget {
  final String title;
  final bool isUploaded;
  final VoidCallback onTap;

  const DocumentUploadTile({
    super.key,
    required this.title,
    required this.isUploaded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isUploaded ? AppColors.tertiary300 : AppColors.neutral300,
            width: isUploaded ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: isUploaded ? AppColors.tertiary50 : AppColors.neutral100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                isUploaded ? Icons.task_alt_rounded : Icons.cloud_upload_outlined,
                color: isUploaded ? AppColors.tertiaryGreen : AppColors.neutral600,
                size: 24.sp,
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.neutral900,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    isUploaded ? 'Document Attached (Verified)' : 'Tap to select & upload image',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: isUploaded ? AppColors.tertiaryGreen : AppColors.neutral500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: AppColors.neutral400,
              size: 22.sp,
            ),
          ],
        ),
      ),
    );
  }
}
