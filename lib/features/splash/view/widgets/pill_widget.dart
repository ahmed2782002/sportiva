import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_text_font.dart';

class PillWidget extends StatelessWidget {
  final AnimationController pillController;
  final Animation<double> pillFade;
  final Animation<double> pillSlide;

  const PillWidget({
    super.key,
    required this.pillController,
    required this.pillFade,
    required this.pillSlide,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pillController,
      builder: (context, _) => Opacity(
        opacity: pillFade.value,
        child: Transform.translate(
          offset: Offset(0, pillSlide.value),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: AppColors.primaryColor.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            child: const Text(
              'GYMS • STUDIOS • ACADEMIES',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontManger.extraBold,
                letterSpacing: 1.2,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
