import 'language_model.dart';
import 'package:flutter/material.dart';

class AppUserPref {
  final LanguageModel lang;
  final ThemeMode theme;
  final bool isFirstTime;
  final bool notificationsEnabled;
  AppUserPref({
    required this.lang,
    required this.theme,
    required this.isFirstTime,
    required this.notificationsEnabled,
  });

  factory AppUserPref.standard() {
    return AppUserPref(
      lang: LanguageModel.standard(),
      isFirstTime: true,
      theme: ThemeMode.light,
      notificationsEnabled: true,
    );
  }

  AppUserPref copyWith({
    bool? isrtl,
    LanguageModel? lang,
    ThemeMode? theme,
    bool? isFirstTime,
    bool? notificationsEnabled,
  }) {
    return AppUserPref(
      lang: lang ?? this.lang,
      theme: theme ?? this.theme,
      isFirstTime: isFirstTime ?? this.isFirstTime,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }

  factory AppUserPref.fromJson(Map<String, dynamic> json) {
    return AppUserPref(
      theme: ThemeMode.values[json['theme'] as int],
      isFirstTime: json['isFirstTime'] as bool? ?? true,
      lang: LanguageModel.fromJson(json['lang'] as Map<String, dynamic>),
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'theme': theme.index,
      'lang': lang.toJson(),
      'isFirstTime': isFirstTime,
      'notificationsEnabled': notificationsEnabled,
    };
  }
}
