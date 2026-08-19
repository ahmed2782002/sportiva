import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';
import 'package:sportive/core/utils/constants/app_strings.dart';
import 'package:sportive/features/user/shared/view/widget/user_style.dart';

/// Map teaser with a stylised grid backdrop and venue pins — no map SDK call
/// is made here, the real map opens from [onTap].
class NearMeCard extends StatelessWidget {
  const NearMeCard({super.key, this.venuesCount = 12, this.onTap});

  final int venuesCount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      height: 175.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.r),
        gradient: const LinearGradient(
          colors: [Color(0xFFDCE9E2), Color(0xFFC9DCEB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: UserStyle.softShadow,
      ),
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: _MapGridPainter())),
          PositionedDirectional(top: 46.h, start: 70.w, child: _pin(big: true)),
          PositionedDirectional(top: 26.h, start: 190.w, child: _pin()),
          PositionedDirectional(top: 92.h, start: 250.w, child: _pin()),
          PositionedDirectional(
            bottom: 12.h,
            start: 12.w,
            end: 12.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: UserStyle.softShadow,
              ),
              child: Row(
                children: [
                  Container(
                    width: 36.r,
                    height: 36.r,
                    decoration: BoxDecoration(
                      color: AppColors.primary50,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.location_on_rounded,
                      size: 19.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppString.venuesActive.tr(args: ['$venuesCount']),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.neutral900,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          AppString.withinRadius.tr(),
                          style: UserStyle.caption(),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14.sp,
                    color: AppColors.neutral400,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _pin({bool big = false}) => big
      ? const _AnimatedPrimaryPin()
      : const _PinVisual();
}

class _AnimatedPrimaryPin extends StatefulWidget {
  const _AnimatedPrimaryPin();

  @override
  State<_AnimatedPrimaryPin> createState() => _AnimatedPrimaryPinState();
}

class _AnimatedPrimaryPinState extends State<_AnimatedPrimaryPin>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fallAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
    _fallAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: -24.0, end: 0.0).chain(
          CurveTween(curve: Curves.easeOutCubic),
        ),
        weight: 62,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: -4.0).chain(
          CurveTween(curve: Curves.easeOut),
        ),
        weight: 10,
      ),
      TweenSequenceItem(
        tween: Tween(begin: -4.0, end: 0.0).chain(
          CurveTween(curve: Curves.easeInOut),
        ),
        weight: 10,
      ),
      TweenSequenceItem(
        tween: ConstantTween(0.0),
        weight: 18,
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _fallAnimation,
    child: const _PinVisual(big: true),
    builder: (context, child) => Transform.translate(
      offset: Offset(0, _fallAnimation.value.h),
      child: child,
    ),
  );
}

class _PinVisual extends StatelessWidget {
  const _PinVisual({this.big = false});

  final bool big;

  @override
  Widget build(BuildContext context) => Container(
    width: big ? 40.r : 26.r,
    height: big ? 40.r : 26.r,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: big ? AppColors.primaryColor : AppColors.primary200,
      border: Border.all(color: AppColors.white, width: 2),
      boxShadow: [
        BoxShadow(
          color: AppColors.primary900.withValues(alpha: 0.2),
          blurRadius: 10.r,
          offset: Offset(0, 4.h),
        ),
      ],
    ),
    child: Icon(
      Icons.sports_tennis_rounded,
      size: big ? 20.sp : 13.sp,
      color: AppColors.white,
    ),
  );
}

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.white.withValues(alpha: 0.55)
      ..strokeWidth = 1.4;

    for (double x = -20; x < size.width; x += 46) {
      canvas.drawLine(Offset(x, 0), Offset(x + 30, size.height), paint);
    }
    for (double y = 0; y < size.height; y += 38) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y - 12), paint);
    }

    final water = Paint()..color = const Color(0xFF9DC6E0).withValues(alpha: 0.5);
    canvas.drawCircle(Offset(size.width * 0.12, size.height * 0.8), 58, water);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
