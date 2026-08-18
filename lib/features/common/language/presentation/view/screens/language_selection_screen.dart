import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constants/app_colors.dart';
import '../../view_model/language_selection_cubit.dart';
import '../widgets/language_background_decoration.dart';
import '../widgets/language_confirm_button.dart';
import '../widgets/language_header_text.dart';
import '../widgets/language_logo_mark.dart';
import '../widgets/language_animations.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

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
              child: LanguageEntranceAnimation(
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
                        const LanguageCardsAnimation(),
                        const Spacer(),
                        const LanguageConfirmButton(),
                        SizedBox(height: 40.h),
                      ],
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
