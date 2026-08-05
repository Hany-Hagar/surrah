import 'package:flutter/material.dart';
import '../../model/app_user_pref_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SettingsCubit extends HydratedCubit<AppUserPref> {
  SettingsCubit() : super(AppUserPref.standard());

  // ignore: strict_top_level_inference
  static SettingsCubit get(context) => BlocProvider.of<SettingsCubit>(context);

  // --- Functional Updates ---
  void updateLanguage(String lang) {
    if (lang == "ar") {
      emit(state.copyWith(lang: lang, isrtl: true));
    } else {
      emit(state.copyWith(lang: lang, isrtl: false));
    }
  }

  void updateTheme(ThemeMode theme) {
    emit(state.copyWith(theme: theme));
  }

  void updateIsFirstTime(bool isFirstTime) {
    emit(state.copyWith(isFirstTime: isFirstTime));
  }

  void updateNotificationsEnabled(bool notificationsEnabled) {
    emit(state.copyWith(notificationsEnabled: notificationsEnabled));
  }

  @override
  AppUserPref? fromJson(Map<String, dynamic> json) {
    try {
      return AppUserPref.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AppUserPref state) {
    try {
      return state.toJson();
    } catch (e) {
      return null;
    }
  }
}
