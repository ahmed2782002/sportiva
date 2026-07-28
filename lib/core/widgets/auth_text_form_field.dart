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
    final effectiveFillColor = fillColor ?? AppColors.white;

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
            color: AppColors.primaryDark,
            fontSize: 15.sp,
            fontWeight: FontManger.medium,
          ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        errorStyle: errorStyle ?? TextStyle(fontSize: 12.sp, height: 1.2),
        counterText: "",
        prefixIconConstraints: BoxConstraints(minWidth: 48.w, minHeight: 48.h),
        suffixIconConstraints: BoxConstraints(minWidth: 48.w, minHeight: 48.h),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffix: suffix,
        filled: true,
        fillColor: effectiveFillColor,
        hintText: hintText,
        hintStyle:
            hintStyle ??
            GoogleFonts.roboto(
              color: AppColors.gray.withValues(alpha: 0.7),
              fontSize: 14.sp,
              fontWeight: FontManger.regular,
            ),
        border: border ?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: AppColors.borderSubtle, width: 1.2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: AppColors.borderSubtle, width: 1.2),
        ),
        focusedBorder: focusedBorder ?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.8),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: AppColors.red, width: 1.2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: AppColors.red, width: 1.8),
        ),
      ),
    );
  }
}
