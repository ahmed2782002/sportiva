import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../data/model/account_role.dart';

class RoleCard extends StatelessWidget {
  const RoleCard({
    super.key,
    required this.role,
    required this.selected,
    required this.onTap,
  });

  final AccountRole role;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.all(18.w),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryLighter : AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: selected ? AppColors.primaryColor : AppColors.borderSubtle,
            width: selected ? 1.7 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.primaryColor
                    : AppColors.primaryLighter,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Icon(
                role.icon,
                color: selected ? AppColors.white : AppColors.primaryColor,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                role.title,
                style: TextStyle(
                  fontSize: 17.sp,
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Icon(
              selected
                  ? Icons.check_circle_rounded
                  : Icons.radio_button_unchecked_rounded,
              color: selected ? AppColors.primaryColor : AppColors.gray,
            ),
          ],
        ),
      ),
    ),
  );
}
