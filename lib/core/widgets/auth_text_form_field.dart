import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants/app_colors.dart';
import '../utils/constants/app_text_font.dart';

class AuthTextFormField extends StatelessWidget {
  final String? hintText;
  final int? maxLength;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? suffix;
  final bool? obscureText;
  final bool? readOnly;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Function()? onTap;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Function(String value)? onChanged;
  final String? Function(String?)? validator;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextStyle? errorStyle;
  final List<TextInputFormatter>? inputFormatters;

  const AuthTextFormField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.obscureText,
    this.focusNode,
    this.prefixIcon,
    this.onTap,
    this.controller,
    this.textInputType,
    this.onChanged,
    this.validator,
    this.maxLength,
    this.maxLines,
    this.border,
    this.focusedBorder,
    this.inputFormatters,
    this.textStyle,
    this.fillColor,
    this.hintStyle,
    this.readOnly,
    this.errorStyle,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: obscureText == true ? 1 : maxLines,
      readOnly: readOnly ?? false,
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      maxLength: maxLength,
      onChanged: onChanged,
      autofocus: false,
      keyboardType: textInputType,
      controller: controller,
      focusNode: focusNode,
      onTap: onTap,
      cursorColor: AppColors.primaryColor,
      obscureText: obscureText ?? false,
      style:
          textStyle ??
          TextStyle(
            color: AppColors.black,
            fontSize: 16.sp,
            fontWeight: FontManger.regular,
          ),
      decoration: InputDecoration(
        errorStyle: errorStyle,
        counterText: "",
        prefixIconConstraints: BoxConstraints(minWidth: 40.w, minHeight: 40.h),
        suffixIconConstraints: BoxConstraints(minWidth: 40.w, minHeight: 40.h),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffix: suffix,
        filled: false,
        focusColor: AppColors.colorTransparent,
        fillColor: Colors.transparent,
        hintText: hintText,
        hintStyle:
            hintStyle ??
            GoogleFonts.roboto(
              color: AppColors.black,
              fontSize: 12.sp,
              fontWeight: FontManger.regular,
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.gray, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.gray, width: 1),
        ),
      ),
    );
  }
}
