import 'package:flutter/material.dart';

class AppUserPref {
  final String lang;
  final bool isrtl;
  final ThemeMode theme;
  final bool isFirstTime;
  final bool notificationsEnabled;
  AppUserPref({
    required this.lang,
    required this.theme,
    required this.isrtl,
    required this.isFirstTime,
    required this.notificationsEnabled,
  });

  factory AppUserPref.standard() {
    return AppUserPref(
      lang: "en",
      isrtl: false,
      isFirstTime: true,
      theme: ThemeMode.light,
      notificationsEnabled: true,
    );
  }

  AppUserPref copyWith({
    bool? isrtl,
    String? lang,
    ThemeMode? theme,
    bool? isFirstTime,
    bool? notificationsEnabled,
  }) {
    return AppUserPref(
      lang: lang ?? this.lang,
      theme: theme ?? this.theme,
      isrtl: isrtl ?? this.isrtl,
      isFirstTime: isFirstTime ?? this.isFirstTime,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }

  factory AppUserPref.fromJson(Map<String, dynamic> json) {
    return AppUserPref(
      lang: json['lang'] as String,
      isrtl: json['isrtl'] as bool,
      theme: ThemeMode.values[json['theme'] as int],
      isFirstTime: json['isFirstTime'] as bool? ?? true,
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lang': lang,
      'isrtl': isrtl,
      'theme': theme.index,
      'isFirstTime': isFirstTime,
      'notificationsEnabled': notificationsEnabled,
    };
  }
}
