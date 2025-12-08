import 'package:flutter/material.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  /// Light Theme
  static ThemeData get lightTheme {
    final baseTextTheme = GoogleFonts.poppinsTextTheme();

    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.darkGreen,
        onPrimary: Colors.white,
        secondary: AppColors.lightBlue,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: AppColors.lightBackground,
        onSurface: Colors.black,
      ),
      textTheme: baseTextTheme.copyWith(
        headlineLarge: baseTextTheme.headlineLarge?.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.darkBlue,
        ),
        headlineMedium: baseTextTheme.headlineMedium?.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.darkBlue,
        ),
        bodyLarge: baseTextTheme.bodyLarge?.copyWith(
          fontSize: 16,
          color: Colors.black87,
        ),
        bodyMedium: baseTextTheme.bodyMedium?.copyWith(
          fontSize: 14,
          color: Colors.black54,
        ),
        labelSmall: baseTextTheme.labelSmall?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.lightBlue,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkGreen,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.lightGreen,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkGreen,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
    );
  }

  /// Dark Theme
  static ThemeData get darkTheme {
    final baseTextTheme = GoogleFonts.poppinsTextTheme();

    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.lightGreen,
        onPrimary: Colors.black,
        secondary: AppColors.lightBlue,
        onSecondary: Colors.white,
        error: Colors.redAccent,
        onError: Colors.black,
        surface: AppColors.darkBackground,
        onSurface: Colors.white,
      ),
      textTheme: baseTextTheme.copyWith(
        headlineLarge: baseTextTheme.headlineLarge?.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.lightGreen,
        ),
        headlineMedium: baseTextTheme.headlineMedium?.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.lightGreen,
        ),
        bodyLarge: baseTextTheme.bodyLarge?.copyWith(
          fontSize: 16,
          color: Colors.white70,
        ),
        bodyMedium: baseTextTheme.bodyMedium?.copyWith(
          fontSize: 14,
          color: Colors.white60,
        ),
        labelSmall: baseTextTheme.labelSmall?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.lightBlue,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBlue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.lightGreen,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightGreen,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
    );
  }
}
