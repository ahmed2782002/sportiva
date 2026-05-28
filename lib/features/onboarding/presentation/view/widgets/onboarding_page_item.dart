import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_text_font.dart';
import '../../../data/model/onboarding_model.dart';

class OnboardingPageItem extends StatelessWidget {
  final OnboardingModel page;

  const OnboardingPageItem({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20.h),
        _ImageSection(imagePath: page.imagePath),
        SizedBox(height: 40.h),
        _TitleSection(
          titleKey:      page.titleKey,
          titleLine2Key: page.titleLine2Key,
        ),
        SizedBox(height: 12.h),
        _SubtitleSection(subtitleKey: page.subtitleKey),
      ],
    );
  }
}


class _ImageSection extends StatelessWidget {
  final String imagePath;
  const _ImageSection({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Image.asset(
        imagePath,
        width:  double.infinity,
        height: 340.h,
        fit:    BoxFit.cover,
      ),
    );
  }
}


class _TitleSection extends StatelessWidget {
  final String  titleKey;
  final String? titleLine2Key;

  const _TitleSection({required this.titleKey, this.titleLine2Key});

  @override
  Widget build(BuildContext context) {
    if (titleLine2Key != null) {
      // Two-line title (page 1)
      return Column(
        children: [
          Text(
            titleKey.tr(),
            style: _titleStyle,
            textAlign: TextAlign.center,
          ),
          Text(
            titleLine2Key!.tr(),
            style: _titleStyle,
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    return Text(
      titleKey.tr(),
      style:     _titleStyle,
      textAlign: TextAlign.center,
    );
  }

  TextStyle get _titleStyle => TextStyle(
        fontSize:   26.sp,
        fontWeight: FontManger.extraBold,
        color:      AppColors.primaryDark,
        height:     1.3,
      );
}



class _SubtitleSection extends StatelessWidget {
  final String subtitleKey;
  const _SubtitleSection({required this.subtitleKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Text(
        subtitleKey.tr(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize:   15.sp,
          fontWeight: FontManger.regular,
          color:      AppColors.gray,
          height:     1.5,
        ),
      ),
    );
  }
}
