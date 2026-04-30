import 'package:currency_converter/app/theme/app_color_scheme.dart';
import 'package:currency_converter/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    typography: Typography.material2021(),
    colorScheme: AppColorScheme.light,
    textTheme: AppTextTheme.light,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      hintStyle: AppTextTheme.light.bodyLarge,
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 13),
      filled: true,
      fillColor: AppColorScheme.light.surfaceContainer,
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    typography: Typography.material2021(),
    colorScheme: AppColorScheme.dark,
    textTheme: AppTextTheme.dark,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      hintStyle: AppTextTheme.dark.bodyLarge,
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 13),
      filled: true,
      fillColor: AppColorScheme.dark.surfaceContainer,
    ),
  );
}
