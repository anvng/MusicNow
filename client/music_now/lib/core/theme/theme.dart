import 'package:flutter/material.dart';
import 'package:music_now/core/theme/app_pallete.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppPalette.backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(28),
        enabledBorder: _border(AppPalette.borderColor),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppPalette.gradient2,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ));

  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      );
  static final lightThemeMode = ThemeData.light().copyWith(
      scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(28),
        enabledBorder: _border(AppPalette.borderColor),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppPalette.gradient2,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ));
}
