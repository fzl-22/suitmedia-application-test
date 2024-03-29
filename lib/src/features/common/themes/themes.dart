import 'package:flutter/material.dart';

/// AppTheme Class
///
/// A class that defines the overall theme for the Flutter application.
/// It includes specifications for color schemes and text themes.
class AppTheme {
  static final ThemeData _theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2B637B),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    useMaterial3: true,
  );

  static ThemeData get theme => _theme;
}
