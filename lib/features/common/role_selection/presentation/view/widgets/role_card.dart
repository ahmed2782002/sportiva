import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constants/app_colors.dart';
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
      borderRadius: BorderRadius.circular(22.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          gradient: selected ? AppColors.primaryGradient : null,
          color: selected ? null : AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(
            color: selected ? AppColors.primaryColor : AppColors.borderSubtle,
            width: selected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryDark.withValues(
                alpha: selected ? 0.14 : 0.04,
              ),
              blurRadius: selected ? 14 : 8,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Icon(
                selected ? Icons.check_circle_rounded : Icons.circle_outlined,
                size: 22.sp,
                color: selected ? AppColors.white : AppColors.neutral400,
              ),
            ),
            const Spacer(),
            Container(
              width: 64.w,
              height: 64.w,
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.white.withValues(alpha: 0.18)
                    : AppColors.primaryLighter,
                shape: BoxShape.circle,
              ),
              child: Icon(
                role.icon,
                size: 30.sp,
                color: selected ? AppColors.white : AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              role.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15.sp,
                color: selected ? AppColors.white : AppColors.primaryDark,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    ),
  );
}
