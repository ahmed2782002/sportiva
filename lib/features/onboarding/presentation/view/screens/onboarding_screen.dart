import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/constants/app_text_font.dart';
import '../../../../../core/utils/nav.dart';
import '../../../../auth/presentation/view/screens/login_screen.dart';
import '../../view_model/onboarding_cubit.dart';
import '../../view_model/onboarding_state.dart';
import '../widgets/onboarding_bottom_bar.dart';
import '../widgets/onboarding_constants.dart';
import '../widgets/onboarding_page_item.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  void _onFinish(BuildContext context) {
    navigateFinish(const LoginScreen());
  }

  void _onSkip(BuildContext context) {
    context.read<OnboardingCubit>().skip(() => _onFinish(context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: _OnboardingView(
        onFinish: (ctx) => _onFinish(ctx),
        onSkip:   (ctx) => _onSkip(ctx),
      ),
    );
  }
}

class _OnboardingView extends StatefulWidget {
  final void Function(BuildContext) onFinish;
  final void Function(BuildContext) onSkip;

  const _OnboardingView({required this.onFinish, required this.onSkip});

  @override
  State<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<_OnboardingView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entranceCtrl;
  late final Animation<double>   _fadeIn;
  late final Animation<Offset>   _slideIn;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor:           Colors.transparent,
      statusBarIconBrightness:  Brightness.dark,
    ));

    _entranceCtrl = AnimationController(
      vsync:    this,
      duration: const Duration(milliseconds: 700),
    );

    _fadeIn = CurvedAnimation(
      parent: _entranceCtrl,
      curve:  const Interval(0.0, 0.6, curve: Curves.easeOut),
    );

    _slideIn = Tween<Offset>(
      begin: const Offset(0, 0.05),
      end:   Offset.zero,
    ).animate(CurvedAnimation(
      parent: _entranceCtrl,
      curve:  const Interval(0.0, 0.7, curve: Curves.easeOut),
    ));

    _entranceCtrl.forward();
  }

  @override
  void dispose() {
    _entranceCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: FadeTransition(
        opacity: _fadeIn,
        child: SlideTransition(
          position: _slideIn,
          child: SafeArea(
            child: Column(
              children: [
                _TopBar(onSkip: () => widget.onSkip(context)),
                Expanded(
                  child: PageView.builder(
                    controller:  cubit.pageController,
                    onPageChanged: cubit.onPageChanged,
                    itemCount:   OnboardingConstants.pages.length,
                    itemBuilder: (_, i) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: OnboardingPageItem(
                        page: OnboardingConstants.pages[i],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24.h),

                OnboardingBottomBar(
                  onFinish: () => widget.onFinish(context),
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
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SPORTIVA',
                style: TextStyle(
                  fontSize:      16.sp,
                  fontWeight:    FontManger.extraBold,
                  color:         AppColors.primaryDark,
                  letterSpacing: 1.5,
                ),
              ),

              AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity:  state.isLastPage ? 0 : 1,
                child: IgnorePointer(
                  ignoring: state.isLastPage,
                  child: GestureDetector(
                    onTap: onSkip,
                    child: Text(
                      AppString.skip.tr(),
                      style: TextStyle(
                        fontSize:      13.sp,
                        fontWeight:    FontManger.semiBold,
                        color:         AppColors.gray,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
