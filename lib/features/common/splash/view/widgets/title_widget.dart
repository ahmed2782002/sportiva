import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_text_font.dart';
class TitleWidget extends StatelessWidget {
  final List<AnimationController> letterControllers;
  final List<Animation<double>> letterOffsets;
  final List<Animation<double>> letterOpacities;

  const TitleWidget({
    super.key,
    required this.letterControllers,
    required this.letterOffsets,
    required this.letterOpacities,
  });

  static const String _word = 'SPORTIVA';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      textDirection: TextDirection.ltr,
      children: List.generate(_word.length, (i) {
        return AnimatedBuilder(
          animation: letterControllers[i],
          builder: (_, _) => Opacity(
            opacity: letterOpacities[i].value,
            child: Transform.translate(
              offset: Offset(letterOffsets[i].value, 0),
              child: Text(
                _word[i],
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                  fontSize: 38,
                  fontWeight: FontManger.black,
                  color: AppColors.primaryColor,
                  letterSpacing: 6,
                  height: 1,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
