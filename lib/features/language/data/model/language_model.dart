class LanguageModel {
  final String code;
  final String nativeName;
  final String englishName;
  final String flag;
  final bool isRtl;

  const LanguageModel({
    required this.code,
    required this.nativeName,
    required this.englishName,
    required this.flag,
    required this.isRtl,
  });
}
