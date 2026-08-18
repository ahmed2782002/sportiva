import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../core/utils/constants/app_strings.dart';
import '../../../../../../core/widgets/button/master_button.dart';
import '../../view_model/language_selection_cubit.dart';
import '../../view_model/language_selection_state.dart';

class LanguageConfirmButton extends StatelessWidget {
  const LanguageConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageSelectionCubit, LanguageSelectionState>(
      builder: (context, state) {
        final isReady = state.hasSelection;

        return LanguagePulseAnimation(
          enabled: isReady,
          child: MasterButton(
            typeButton: TypeButton.iconText,
            text: AppString.continueButton.tr(),
            isLoading: state.isLoading,
            backgroundColor:
                isReady ? AppColors.primaryColor : AppColors.borderSubtle,
            textColor: isReady ? AppColors.white : AppColors.gray,
            iconColor: isReady ? AppColors.white : AppColors.gray,
            height: 60.h,
            borderRadius: 18.r,
            onPressed: isReady
                ? () => context
                    .read<LanguageSelectionCubit>()
                    .confirmSelection(context)
                : null,
          ),
        );
      },
    );
  }
}

class LanguagePulseAnimation extends StatefulWidget {
  final Widget child;
  final bool enabled;

  const LanguagePulseAnimation({
    super.key,
    required this.child,
    required this.enabled,
  });

  @override
  State<LanguagePulseAnimation> createState() => _LanguagePulseAnimationState();
}

class _LanguagePulseAnimationState extends State<LanguagePulseAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );
    _scale = Tween<double>(begin: 0.98, end: 1.02).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _updateAnimation();
  }

  @override
  void didUpdateWidget(LanguagePulseAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enabled != widget.enabled) _updateAnimation();
  }

  void _updateAnimation() {
    if (widget.enabled) {
      _controller.repeat(reverse: true);
    } else {
      _controller.stop();
      _controller.value = 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _scale,
    builder: (_, child) => Transform.scale(
      scale: widget.enabled ? _scale.value : 1,
      child: child,
    ),
    child: widget.child,
  );
}
