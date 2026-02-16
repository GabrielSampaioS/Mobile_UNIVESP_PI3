import 'package:flutter/material.dart';
import 'app_colors.dart';

class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    colorScheme: const ColorScheme(
      brightness: Brightness.light,

      primary: Color(0XFF0A8EC7),
      onPrimary: Colors.white,

      secondary: Color(0xFF032B3A),
      onSecondary: Colors.white,

      surface: Color.fromARGB(255, 241, 241, 241),
      onSurface: AppColors.textPrimary,

      error: AppColors.error,
      onError: Colors.white,
    ),

    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontSize: 18, color: Color(0xFFFFFFFF)),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.textSecondary),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ),

    // Inputs
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputFill,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    ),

    // Botões
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 1,
    ),

    // FAB
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    ),

    // Ícones
    iconTheme: const IconThemeData(color: AppColors.textPrimary),
  );
}
