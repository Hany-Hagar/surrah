// ignore_for_file: deprecated_member_use

import 'styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  // Brand Colors
  static const Color primary = Color(0xFF001233);
  static const Color secondary = Color(0xFFE5B84A);

  static const Color white = Color(0xFFF8F8F5);

  static const Color darkBackground = Color(0xFF000814);
  static const Color darkSurface = Color(0xFF001845);

  static const Color inactiveGrey = Color(0xFF8C96A8);

  // ---------------- Light Theme ----------------

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    primaryColor: primary,
    scaffoldBackgroundColor: white,
    hintColor: Colors.black87,

    appBarTheme: const AppBarTheme(
      backgroundColor: white,
      foregroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),

    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: Colors.white,
      secondary: secondary,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      surface: white,
      onSurface: Colors.black,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: Colors.white,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: white,
      elevation: 10,
      showSelectedLabels: false,
      showUnselectedLabels: true,
      selectedItemColor: primary,
      unselectedItemColor: inactiveGrey,
      unselectedLabelStyle: Styles.textStyle400.copyWith(
        color: inactiveGrey,
        fontSize: 12,
      ),
    ),
  );

  // ---------------- Dark Theme ----------------

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    primaryColor: primary,
    scaffoldBackgroundColor: darkBackground,
    hintColor: Colors.white70,

    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackground,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    ),

    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primary,
      onPrimary: Colors.white,
      secondary: secondary,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      surface: darkSurface,
      onSurface: Colors.white,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondary,
      foregroundColor: primary,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkSurface,
      elevation: 10,
      showSelectedLabels: false,
      showUnselectedLabels: true,
      selectedItemColor: secondary,
      unselectedItemColor: inactiveGrey.withOpacity(.6),
      unselectedLabelStyle: Styles.textStyle400.copyWith(
        color: inactiveGrey.withOpacity(.6),
        fontSize: 12,
      ),
    ),
  );
}
