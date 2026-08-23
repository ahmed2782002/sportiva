import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sportive/features/user/shared/view/widget/user_style.dart';

class BookingStyle {
  BookingStyle._();

  static const Color background = Color(0xFFFBF9FC);
  static const Color ink = Color(0xFF191C1D);
  static const Color muted = Color(0xFF4F444A);
  static const Color primary = Color(0xFF461A3B);
  static const Color darkPrimary = Color(0xFF2D0525);
  static const Color pink = Color(0xFFFBD9EC);
  static const Color green = Color(0xFF163105);
  static const Color greenLight = Color(0xFFC9EDAD);
  static const Color border = Color(0xFFE9E1E7);
  static const Color pale = Color(0xFFF5F2F5);

  static TextStyle heading(
    double size, {
    FontWeight weight = FontWeight.w700,
  }) => GoogleFonts.manrope(
    fontSize: size.sp,
    fontWeight: weight,
    color: ink,
    height: 1.18,
    letterSpacing: -size.sp * 0.018,
  );

  static TextStyle body(double size, {FontWeight weight = FontWeight.w400}) =>
      GoogleFonts.inter(
        fontSize: size.sp,
        fontWeight: weight,
        color: ink,
        height: 1.45,
      );

  static BoxDecoration card({double radius = 16, bool border = false}) =>
      BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius.r),
        border: border ? Border.all(color: BookingStyle.border) : null,
        boxShadow: border ? null : UserStyle.softShadow,
      );
}
