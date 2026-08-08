import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';

class LanguageModel {
  final int id;
  final bool isRTL;
  final String country;
  final String language;
  final String countryCode;
  final String languageCode;

  const LanguageModel({
    required this.id,
    required this.isRTL,
    required this.language,
    required this.country,
    required this.countryCode,
    required this.languageCode,
  });

  factory LanguageModel.standard() {
    return const LanguageModel(
      id: 1,
      isRTL: false,
      language: "English",
      country: "United States",
      countryCode: "US",
      languageCode: "en",
    );
  }

  // Copy with
  LanguageModel copyWith({
    int? id,
    bool? isRTL,
    String? language,
    String? country,
    String? countryCode,
    String? languageCode,
  }) {
    return LanguageModel(
      id: id ?? this.id,
      isRTL: isRTL ?? this.isRTL,
      language: language ?? this.language,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      languageCode: languageCode ?? this.languageCode,
    );
  }

  // From JSON
  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      id: json['id'] as int,
      isRTL: json['isRTL'] as bool,
      language: json['language'] as String,
      country: json['country'] as String,
      countryCode: json['countryCode'] as String,
      languageCode: json['languageCode'] as String,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isRTL': isRTL,
      'language': language,
      'country': country,
      'countryCode': countryCode,
      'languageCode': languageCode,
    };
  }
}

List<LanguageModel> languagesData(BuildContext context) => [
  LanguageModel(
    id: 1,
    isRTL: false,
    language: S.of(context).english,
    country: S.of(context).unitedStates,
    countryCode: "US",
    languageCode: "en",
  ),
  LanguageModel(
    id: 2,
    isRTL: true,
    language: S.of(context).arabic,
    country: S.of(context).egypt,
    countryCode: "EG",
    languageCode: "ar",
  ),
];

// Languages
