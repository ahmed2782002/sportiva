import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../core/utils/constants/app_strings.dart';
import '../../../../../../core/utils/constants/app_text_font.dart';
import '../../../../../../core/utils/nav.dart';
import 'package:sportive/features/common/auth/login/presentation/view/screens/login_screen.dart';
import '../../view_model/onboarding_cubit.dart';
import '../../view_model/onboarding_state.dart';
import '../widgets/onboarding_animations.dart';
import '../widgets/onboarding_bottom_bar.dart';
import '../widgets/onboarding_constants.dart';
import '../widgets/onboarding_page_item.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: const _OnboardingContent(),
      ),
    );
  }
}

class _OnboardingContent extends StatelessWidget {
  const _OnboardingContent();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: OnboardingEntranceAnimation(
          child: SafeArea(
            child: Column(
              children: [
                _TopBar(
                  onSkip: () => navigateFinish(const LoginScreen()),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: cubit.pageController,
                    onPageChanged: cubit.onPageChanged,
                    itemCount: OnboardingConstants.pages.length,
                    itemBuilder: (_, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: OnboardingPageItem(
                        page: OnboardingConstants.pages[index],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                OnboardingBottomBar(
                  onFinish: () => navigateFinish(const LoginScreen()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final VoidCallback onSkip;

  const _TopBar({required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SPORTIVA',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontManger.extraBold,
                color: AppColors.primaryDark,
                letterSpacing: 1.5,
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: state.isLastPage ? 0 : 1,
              child: IgnorePointer(
                ignoring: state.isLastPage,
                child: GestureDetector(
                  onTap: onSkip,
                  child: Text(
                    AppString.skip.tr(),
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontManger.semiBold,
                      color: AppColors.primaryColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
