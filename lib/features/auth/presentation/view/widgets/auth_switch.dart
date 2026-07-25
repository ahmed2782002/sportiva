import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/app_colors.dart';

class AuthSwitch extends StatelessWidget {
  const AuthSwitch({
    super.key,
    required this.text,
    required this.action,
    required this.onTap,
  });

  final String text;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Center(
    child: Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text('$text ', style: TextStyle(color: AppColors.gray)),
        TextButton(
          onPressed: onTap,
          child: Text(
            action,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    ),
  );
}
