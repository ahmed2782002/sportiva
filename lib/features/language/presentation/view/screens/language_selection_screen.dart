import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../onboarding/presentation/view/screens/onboarding_screen.dart';
import '../../../data/model/language_model.dart';
import '../../view_model/language_selection_cubit.dart';
import '../../view_model/language_selection_state.dart';
import '../widgets/language_background_decoration.dart';
import '../widgets/language_card.dart';
import '../widgets/language_confirm_button.dart';
import '../widgets/language_constants.dart';
import '../widgets/language_header_text.dart';
import '../widgets/language_logo_mark.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen>
    with TickerProviderStateMixin {
  late final AnimationController _entranceController;

  late final Animation<double> _fadeIn;
  late final Animation<Offset> _slideIn;
  late final List<Animation<double>> _cardFades;
  late final Animation<double> _buttonFade;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeIn = CurvedAnimation(
      parent: _entranceController,
      curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
    );

    _slideIn = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _entranceController,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
    ));

    _cardFades = List.generate(
      LanguageConstants.supportedLanguages.length,
      (i) => CurvedAnimation(
        parent: _entranceController,
        curve: Interval(
          0.3 + i * 0.15,
          0.75 + i * 0.1,
          curve: Curves.easeOut,
        ),
      ),
    );

    _buttonFade = CurvedAnimation(
      parent: _entranceController,
      curve: const Interval(0.65, 1.0, curve: Curves.easeOut),
    );

    _entranceController.forward();
  }

  @override
  void dispose() {
    _entranceController.dispose();
    super.dispose();
  }

  void _onLanguageConfirmed(LanguageModel language) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LanguageSelectionCubit(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            const LanguageBackgroundDecoration(),
            SafeArea(
              child: FadeTransition(
                opacity: _fadeIn,
                child: SlideTransition(
                  position: _slideIn,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 56.h),
                        const LanguageLogoMark(),
                        SizedBox(height: 32.h),
                        const LanguageHeaderText(),
                        SizedBox(height: 52.h),
                        ..._buildCards(),
                        const Spacer(),
                        FadeTransition(
                          opacity: _buttonFade,
                          child: LanguageConfirmButton(
                            onConfirmed: _onLanguageConfirmed,
                          ),
                        ),
                        SizedBox(height: 40.h),
                      ],
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

  List<Widget> _buildCards() {
    final languages = LanguageConstants.supportedLanguages;
    final List<Widget> cards = [];

    for (int i = 0; i < languages.length; i++) {
      cards.add(
        FadeTransition(
          opacity: _cardFades[i],
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, 0.12 + i * 0.06),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: _entranceController,
              curve: Interval(
                0.3 + i * 0.15,
                0.75 + i * 0.1,
                curve: Curves.easeOut,
              ),
            )),
            child: BlocBuilder<LanguageSelectionCubit, LanguageSelectionState>(
              builder: (context, state) => LanguageCard(
                language: languages[i],
                isSelected: state.selectedLanguage?.code == languages[i].code,
                onTap: () => context
                    .read<LanguageSelectionCubit>()
                    .selectLanguage(languages[i]),
              ),
            ),
          ),
        ),
      );
      if (i < languages.length - 1) cards.add(SizedBox(height: 16.h));
    }

    return cards;
  }
}
