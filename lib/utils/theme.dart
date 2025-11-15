import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF2E7D32), // Forest green
  scaffoldBackgroundColor: const Color(0xFFF5F9F6),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(0xFF2E7D32),
    secondary: const Color(0xFF66BB6A),
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    bodyMedium: TextStyle(
      color: Colors.black54,
      fontSize: 16,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF2E7D32),
    foregroundColor: Colors.white,
    centerTitle: true,
  ),
);
