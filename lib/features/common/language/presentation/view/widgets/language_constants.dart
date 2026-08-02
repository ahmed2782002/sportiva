import '../../../data/model/language_model.dart';

class LanguageConstants {
  LanguageConstants._();

  static const List<LanguageModel> supportedLanguages = [
    LanguageModel(
      code: 'ar',
      nativeName: 'العربية',
      englishName: 'Arabic',
      flag: '🇸🇦',
      isRtl: true,
    ),
    LanguageModel(
      code: 'en',
      nativeName: 'English',
      englishName: 'English',
      flag: '🇺🇸',
      isRtl: false,
    ),
  ];
}
