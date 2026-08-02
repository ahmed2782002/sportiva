

import '../../../../../../core/utils/constants/app_strings.dart';
import '../../../../../../core/utils/constants/app_images.dart';
import '../../../data/model/onboarding_model.dart';

class OnboardingConstants {
  OnboardingConstants._();

  static const List<OnboardingModel> pages = [
    OnboardingModel(
      titleKey:      AppString.onOneTitleLine1,
      titleLine2Key: AppString.onOneTitleLine2,
      subtitleKey:   AppString.onOneSubtitle,
      imagePath:     AppImages.onOne,
    ),
    OnboardingModel(
      titleKey:    AppString.onTwoTitle,
      subtitleKey: AppString.onTwoSubtitle,
      imagePath:   AppImages.onTwo,
    ),
    OnboardingModel(
      titleKey:    AppString.onThreeTitle,
      subtitleKey: AppString.onThreeSubtitle,
      imagePath:   AppImages.onThree,
    ),
  ];
}
