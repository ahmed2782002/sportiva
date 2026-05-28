import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/app_colors.dart';


class OnboardingIndicator extends StatelessWidget {
  final int total;
  final int current;

  const OnboardingIndicator({
    super.key,
    required this.total,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(total, (i) => _Dot(isActive: i == current)),
    );
  }
}

class _Dot extends StatelessWidget {
  final bool isActive;
  const _Dot({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      width:  isActive ? 24.w : 8.w,
      height: 6.h,
      decoration: BoxDecoration(
        color:        isActive ? AppColors.primaryColor : const Color(0xFFECDCE7),
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }
}
