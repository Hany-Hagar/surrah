import '../../features/settings/model/language_model.dart';

extension LanguageListExtension on List<LanguageModel> {
  LanguageModel? getModel({required String code}) {
    try {
      return firstWhere(
        (language) => language.languageCode.toLowerCase() == code.toLowerCase(),
      );
    } catch (_) {
      return null;
    }
  }

  List<LanguageModel> getOtherModels({required LanguageModel current}) {
    return where((language) => language.id != current.id).toList();
  }
}
