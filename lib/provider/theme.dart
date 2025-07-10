import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Colors.white54,
    secondary: Colors.white38,
    tertiary: Colors.black,
    onTertiary: Colors.white10.withValues(alpha: 0.5),
    primaryFixed: Colors.yellow.shade900,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.black,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade300,
    tertiary: Colors.white,
    onTertiary: Colors.black87.withValues(alpha: 0.8),
    primaryFixed: Colors.yellow.shade700,
  ),
);
