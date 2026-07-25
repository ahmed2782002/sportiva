import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/app_colors.dart';

class AuthLabel extends StatelessWidget {
  const AuthLabel(this.value, {super.key});

  final String value;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(bottom: 8.h),
    child: Text(
      value,
      style: TextStyle(
        color: AppColors.primaryDark,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
