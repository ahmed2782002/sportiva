// Flutter imports:
// Package imports:

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Project imports:

import '../utils/constants/app_colors.dart' show AppColors;
import '../utils/constants/app_text_font.dart' show FontManger;
import 'Button/master_button.dart';
import 'custom_bottom_sheet.dart';

void bottomSheetImage({
  required BuildContext context,
  required void Function() onPressedCamera,
  required void Function() onPressedGallery,
}) {
  NewCustomBottomSheet.showModalBottom(
    context,
    child: Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
      ),
      child: Column(
        spacing: 20.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).maybePop();
            },
            child: const Icon(Icons.arrow_back_ios, color: AppColors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 50.w,
            children: [
              Column(
                spacing: 5.h,
                children: [
                  MasterButton(
                    width: 60.w,
                    onPressed: onPressedCamera,
                    typeButton: TypeButton.iconOnly,
                    icon: Icons.camera_alt_outlined,
                    iconColor: AppColors.primaryColor,
                    borderWidth: 1.w,
                    borderColor: AppColors.primaryColor,
                    backgroundColor: AppColors.colorTransparent,
                  ),
                  Text(
                    'Camera'.tr(),
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontManger.medium,
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 5.h,
                children: [
                  MasterButton(
                    width: 60.w,
                    onPressed: onPressedGallery,
                    typeButton: TypeButton.iconOnly,
                    icon: Icons.photo_outlined,
                    iconColor: AppColors.primaryColor,
                    borderWidth: 1.w,
                    borderColor: AppColors.primaryColor,
                    backgroundColor: AppColors.colorTransparent,
                  ),
                  Text(
                    'Gallery'.tr(),
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.black,
                      fontWeight: FontManger.medium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
