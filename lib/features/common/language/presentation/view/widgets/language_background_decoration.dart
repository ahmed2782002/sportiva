import 'package:flutter/material.dart';
import '../../../../../../core/utils/constants/app_colors.dart';

class LanguageBackgroundDecoration extends StatelessWidget {
  const LanguageBackgroundDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -80,
          right: -80,
          child: _Circle(size: 280, color: AppColors.primaryColor.withValues(alpha: 0.06)),
        ),
        Positioned(
          bottom: -60,
          left: -60,
          child: _Circle(size: 220, color: AppColors.primaryLighter.withValues(alpha: 0.7)),
        ),
        Positioned(
          top: 160,
          left: -40,
          child: _Circle(size: 120, color: AppColors.borderSubtle.withValues(alpha: 0.5)),
        ),
      ],
    );
  }
}

class _Circle extends StatelessWidget {
  final double size;
  final Color color;

  const _Circle({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
