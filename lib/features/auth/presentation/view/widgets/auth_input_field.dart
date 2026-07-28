import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/widgets/auth_text_form_field.dart';
import 'auth_label.dart';

class AuthInputField extends StatelessWidget {
  const AuthInputField({
    super.key,
    required this.label,
    required this.controller,
    required this.icon,
    required this.validator,
    this.obscureText = false,
    this.textInputType,
    this.suffixIcon,
  });

  final String label;
  final TextEditingController controller;
  final IconData icon;
  final String? Function(String?) validator;
  final bool obscureText;
  final TextInputType? textInputType;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AuthLabel(label),
      AuthTextFormField(
        controller: controller,
        hintText: label,
        prefixIcon: Icon(
          icon,
          color: AppColors.primaryColor.withValues(alpha: 0.8),
          size: 20.sp,
        ),
        obscureText: obscureText,
        textInputType: textInputType,
        suffixIcon: suffixIcon,
        validator: validator,
      ),
    ],
  );
}
