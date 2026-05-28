import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/widgets/Button/master_button.dart';
import '../../../data/model/language_model.dart';
import '../../view_model/language_selection_cubit.dart';
import '../../view_model/language_selection_state.dart';

class LanguageConfirmButton extends StatefulWidget {
  final void Function(LanguageModel) onConfirmed;

  const LanguageConfirmButton({super.key, required this.onConfirmed});

  @override
  State<LanguageConfirmButton> createState() => _LanguageConfirmButtonState();
}

class _LanguageConfirmButtonState extends State<LanguageConfirmButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _pulse = Tween<double>(begin: 0.97, end: 1.03).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageSelectionCubit, LanguageSelectionState>(
      builder: (context, state) {
        final isReady = state.hasSelection;

        return AnimatedBuilder(
          animation: _pulse,
          builder: (_, child) => Transform.scale(
            scale: isReady ? _pulse.value : 1.0,
            child: child,
          ),
          child: MasterButton(
            typeButton: TypeButton.iconText,
            text: AppString.continueButton,
            isLoading: state.isLoading,
            backgroundColor: isReady ? AppColors.primaryColor : AppColors.borderSubtle,
            textColor: isReady ? AppColors.white : AppColors.gray,
            iconColor: isReady ? AppColors.white : AppColors.gray,
            height: 60.h,
            borderRadius: 18.r,
            onPressed: isReady
                ? () => context
                    .read<LanguageSelectionCubit>()
                    .confirmSelection(context, widget.onConfirmed)
                : null,
          ),
        );
      },
    );
  }
}
