import 'package:flutter/material.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  /// Light Theme — Warm botanical e-commerce
  static ThemeData get lightTheme {
    final bodyTheme = GoogleFonts.dmSansTextTheme();
    final displayFont = GoogleFonts.playfairDisplay;

    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.cream,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.forest,
        onPrimary: Colors.white,
        secondary: AppColors.emerald,
        onSecondary: Colors.white,
        tertiary: AppColors.gold,
        onTertiary: AppColors.forest,
        error: AppColors.coral,
        onError: Colors.white,
        surface: AppColors.warmWhite,
        onSurface: AppColors.charcoal,
        surfaceContainerHighest: AppColors.pearl,
      ),
      textTheme: bodyTheme.copyWith(
        // Display — Playfair Display for hero/brand text
        displayLarge: displayFont(
          fontSize: 34,
          fontWeight: FontWeight.w700,
          color: AppColors.forest,
          letterSpacing: -0.5,
        ),
        displayMedium: displayFont(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: AppColors.forest,
        ),
        displaySmall: displayFont(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.forest,
        ),
        // Headline — Playfair for section headers
        headlineLarge: displayFont(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: AppColors.forest,
          letterSpacing: -0.3,
        ),
        headlineMedium: displayFont(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.forest,
        ),
        headlineSmall: displayFont(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.charcoal,
        ),
        // Title — DM Sans for card/section titles
        titleLarge: bodyTheme.titleLarge?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.charcoal,
        ),
        titleMedium: bodyTheme.titleMedium?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.charcoal,
        ),
        titleSmall: bodyTheme.titleSmall?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.graphite,
        ),
        // Body
        bodyLarge: bodyTheme.bodyLarge?.copyWith(
          fontSize: 16,
          color: AppColors.charcoal,
          height: 1.5,
        ),
        bodyMedium: bodyTheme.bodyMedium?.copyWith(
          fontSize: 14,
          color: AppColors.graphite,
          height: 1.5,
        ),
        bodySmall: bodyTheme.bodySmall?.copyWith(
          fontSize: 12,
          color: AppColors.slate,
          height: 1.4,
        ),
        // Label
        labelLarge: bodyTheme.labelLarge?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.charcoal,
        ),
        labelMedium: bodyTheme.labelMedium?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.graphite,
        ),
        labelSmall: bodyTheme.labelSmall?.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: AppColors.slate,
          letterSpacing: 0.5,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.cream,
        foregroundColor: AppColors.charcoal,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        surfaceTintColor: Colors.transparent,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.forest,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: CircleBorder(),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.forest,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          textStyle: GoogleFonts.dmSans(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.forest,
          side: const BorderSide(color: AppColors.mist, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.forest,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.warmWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.mist, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.mist, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.emerald, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.coral, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: GoogleFonts.dmSans(color: AppColors.silver, fontSize: 14),
      ),
      cardTheme: CardThemeData(
        color: AppColors.warmWhite,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.zero,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.warmWhite,
        side: BorderSide(color: AppColors.mist, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        labelStyle: GoogleFonts.dmSans(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.charcoal,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.mist,
        thickness: 1,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.forest,
        contentTextStyle: GoogleFonts.dmSans(color: Colors.white, fontSize: 14),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.emerald,
        unselectedItemColor: AppColors.silver,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
      ),
    );
  }

  /// Dark Theme
  static ThemeData get darkTheme {
    final bodyTheme = GoogleFonts.dmSansTextTheme(ThemeData.dark().textTheme);
    final displayFont = GoogleFonts.playfairDisplay;

    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF0F0F0F),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.emerald,
        onPrimary: Colors.white,
        secondary: AppColors.mint,
        onSecondary: AppColors.charcoal,
        tertiary: AppColors.gold,
        onTertiary: AppColors.charcoal,
        error: AppColors.coral,
        onError: Colors.white,
        surface: Color(0xFF1A1A1A),
        onSurface: Color(0xFFE5E5E5),
      ),
      textTheme: bodyTheme.copyWith(
        displayLarge: displayFont(
          fontSize: 34,
          fontWeight: FontWeight.w700,
          color: AppColors.mint,
          letterSpacing: -0.5,
        ),
        displayMedium: displayFont(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: AppColors.mint,
        ),
        headlineLarge: displayFont(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: AppColors.mint,
          letterSpacing: -0.3,
        ),
        headlineMedium: displayFont(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.mint,
        ),
        headlineSmall: displayFont(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFE5E5E5),
        ),
        bodyLarge: bodyTheme.bodyLarge?.copyWith(
          fontSize: 16,
          color: const Color(0xFFD4D4D4),
          height: 1.5,
        ),
        bodyMedium: bodyTheme.bodyMedium?.copyWith(
          fontSize: 14,
          color: const Color(0xFFB0B0B0),
          height: 1.5,
        ),
        labelSmall: bodyTheme.labelSmall?.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: AppColors.silver,
          letterSpacing: 0.5,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0F0F0F),
        foregroundColor: Color(0xFFE5E5E5),
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.emerald,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.emerald,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF1A1A1A),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.emerald,
        contentTextStyle: GoogleFonts.dmSans(color: Colors.white, fontSize: 14),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
