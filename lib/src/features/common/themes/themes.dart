import 'package:flutter/material.dart';

class AppTheme {
  final _theme = ThemeData(
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
      bodyMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    useMaterial3: true,
  );

  ThemeData get theme => _theme;
}
