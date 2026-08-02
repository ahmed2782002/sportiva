import '../../data/model/language_model.dart';

class LanguageSelectionState {
  final LanguageModel? selectedLanguage;
  final bool isLoading;

  const LanguageSelectionState({
    this.selectedLanguage,
    this.isLoading = false,
  });

  bool get hasSelection => selectedLanguage != null;

  LanguageSelectionState copyWith({
    LanguageModel? selectedLanguage,
    bool? isLoading,
    bool clearSelection = false,
  }) {
    return LanguageSelectionState(
      selectedLanguage:
          clearSelection ? null : selectedLanguage ?? this.selectedLanguage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
