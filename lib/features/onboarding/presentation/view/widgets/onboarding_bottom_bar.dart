import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/widgets/Button/master_button.dart';
import '../../view_model/onboarding_cubit.dart';
import '../../view_model/onboarding_state.dart';
import 'onboarding_constants.dart';
import 'onboarding_indicator.dart';

class OnboardingBottomBar extends StatelessWidget {
  final VoidCallback onFinish;

  const OnboardingBottomBar({super.key, required this.onFinish});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final cubit      = context.read<OnboardingCubit>();
        final isFirst    = state.currentIndex == 0;
        final isLast     = state.isLastPage;
        final total      = OnboardingConstants.pages.length;

        return Padding(
          padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 40.h),
          child: Row(
            children: [
              // Back button — hidden on first page
              AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: isFirst ? 0 : 1,
                child: IgnorePointer(
                  ignoring: isFirst,
                  child: _BackButton(onTap: cubit.back),
                ),
              ),

              SizedBox(width: 16.w),

              // Indicator
              Expanded(
                child: Center(
                  child: OnboardingIndicator(
                    total:   total,
                    current: state.currentIndex,
                  ),
                ),
              ),

              SizedBox(width: 16.w),

              // Next / Get Started
              _NextButton(
                isLast:   isLast,
                onNext:   cubit.next,
                onFinish: onFinish,
              ),
            ],
          ),
        );
      },
    );
  }
}

// ── Back Button ───────────────────────────────────────────────────────────────

class _BackButton extends StatelessWidget {
  final VoidCallback onTap;
  const _BackButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MasterButton(
      typeButton:      TypeButton.iconOnly,
      icon:            Icons.arrow_back_rounded,
      width:           52.w,
      height:          52.h,
      borderRadius:    16.r,
      backgroundColor: AppColors.primaryLighter,
      iconColor:       AppColors.primaryColor,
      onPressed:       onTap,
    );
  }
}

// ── Next / Get Started Button ─────────────────────────────────────────────────

class _NextButton extends StatelessWidget {
  final bool        isLast;
  final VoidCallback onNext;
  final VoidCallback onFinish;

  const _NextButton({
    required this.isLast,
    required this.onNext,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve:    Curves.easeInOut,
      width:    isLast ? 160.w : 52.w,
      child: MasterButton(
        typeButton:      isLast ? TypeButton.textOnly : TypeButton.iconOnly,
        text:            isLast ? AppString.getStarted.tr() : null,
        icon:            isLast ? null : Icons.arrow_forward_rounded,
        height:          52.h,
        borderRadius:    16.r,
        backgroundColor: AppColors.primaryColor,
        textColor:       AppColors.white,
        iconColor:       AppColors.white,
        onPressed:       isLast ? onFinish : onNext,
      ),
    );
  }
}
