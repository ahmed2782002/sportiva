import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_text_font.dart';

class TaglineWidget extends StatelessWidget {
  final AnimationController taglineController;
  final Animation<double> taglineFade;
  final Animation<double> taglineSlide;

  const TaglineWidget({
    super.key,
    required this.taglineController,
    required this.taglineFade,
    required this.taglineSlide,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: taglineController,
      builder: (context, _) => Opacity(
        opacity: taglineFade.value,
        child: Transform.translate(
          offset: Offset(0, taglineSlide.value),
          child: const Text(
            'Your fitness. One platform.',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.splashText,
              letterSpacing: 0.5,
              fontWeight: FontManger.regular,
            ),
          ),
        ),
      ),
    );
  }
}
