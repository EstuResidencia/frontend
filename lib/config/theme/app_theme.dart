import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final ColorPalette colorPalette;

  AppTheme({required this.colorPalette});

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colorPalette.primaryDarkenColor,
        primary: colorPalette.primaryColor,
        onPrimary: colorPalette.secondaryDarkenColor,
        secondary: colorPalette.secondaryColor,
        onSecondary: colorPalette.backgroundColor,
        tertiary: colorPalette.primaryDarkenColor,
        inversePrimary: colorPalette.secondaryDarkenColor,
        background: colorPalette.backgroundColor,
        error: colorPalette.error,
        brightness: Brightness.light,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colorPalette.primaryColor,
      ),
    );
  }
}
