class OnboardingModel {
  final String titleKey;
  final String? titleLine2Key; // used only when title spans two lines
  final String subtitleKey;
  final String imagePath;

  const OnboardingModel({
    required this.titleKey,
    this.titleLine2Key,
    required this.subtitleKey,
    required this.imagePath,
  });
}
