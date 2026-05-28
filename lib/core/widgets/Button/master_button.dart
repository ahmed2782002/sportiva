// Flutter imports:

import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants/app_colors.dart';
// Project imports:

enum TypeButton { textOnly, iconOnly, svgOnly, iconText, svgText }

class MasterButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final double? borderWidth;
  final Color? borderColor;
  final double? iconSize;
  final TextStyle? styleColorText;
  final String? svgPath;
  final Color? svgColor;
  final double? svgSize;
  final TypeButton? typeButton;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? isLoading;

  const MasterButton({
    super.key,
    this.text,
    this.icon,
    required this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.textColor,
    this.borderWidth,
    this.borderColor,
    this.typeButton = TypeButton.iconText,
    this.iconSize,
    this.styleColorText,
    this.iconColor,
    this.svgPath,
    this.svgColor,
    this.svgSize,
    this.mainAxisAlignment,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.colorTransparent,
      child: InkWell(
        onTap: !isLoading! ? onPressed : () {},
        borderRadius: BorderRadius.circular(borderRadius ?? 20.r),
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 55.h,
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.primaryColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 20.r),
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 1.w,
            ),
          ),
          child: Center(
            child: isLoading!
                ? SpinKitCircle(color: AppColors.white, size: 30.r)
                : musterWidget(),
          ),
        ),
      ),
    );
  }

  Widget musterWidget() {
    switch (typeButton) {
      case TypeButton.textOnly:
        return textWidget();
      case TypeButton.iconOnly:
        return iconWidget();
      case TypeButton.svgOnly:
        return svgWidget();
      case TypeButton.iconText:
        return Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          spacing: 8.w,
          children: [textWidget(), iconWidget()],
        );
      case TypeButton.svgText:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
            spacing: 8.w,
            children: [svgWidget(), textWidget()],
          ),
        );
      case null:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  Widget textWidget() {
    return Text(
      text.toString(),

      style:
          styleColorText ??
          TextStyle(
            color: textColor ?? AppColors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
          ),
    );
  }

  Widget iconWidget() {
    return Icon(
      icon ?? Icons.arrow_forward,
      color: iconColor ?? AppColors.white,
      size: iconSize ?? 16.h,
    );
  }

  Widget svgWidget() {
    return SvgPicture.asset(
      svgPath.toString(),
      width: svgSize ?? 25.h,
      height: svgSize ?? 25.h,
      colorFilter: svgColor != null
          ? ColorFilter.mode(svgColor!, BlendMode.srcIn)
          : null,
    );
  }
}
