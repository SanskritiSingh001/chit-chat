import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF2563EB);
  static const Color secondaryColor = Color(0xFF60A5FA);
  static const Color backgroundColor = Color(0xFFF8FAFC);
  static const Color cardColor = Colors.white;

  static const Color textPrimaryColor = Color(0xFF1E293B);
  static const Color textSecondaryColor = Color(0xFF64748B);

  static const Color successColor = Color(0xFF22C55E);
  static const Color errorColor = Color(0xFFEF4444);

  // Border Color
  static const Color borderColor = Color(0xFFE2E8F0);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: backgroundColor,

    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: cardColor,
      error: errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: textPrimaryColor,
      onError: Colors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: textPrimaryColor,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(
        color: textPrimaryColor,
      ),
    ),

    textTheme: TextTheme(
      headlineLarge: GoogleFonts.poppins(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textPrimaryColor,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        color: textPrimaryColor,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14,
        color: textPrimaryColor,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12,
        color: textSecondaryColor,
      ),
      labelLarge: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: cardColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: borderColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: borderColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: primaryColor,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: errorColor,
          width: 2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: errorColor,
          width: 2,
        ),
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    cardTheme: CardThemeData(
      color: cardColor,
      elevation: 0,
      shadowColor: Colors.black12,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(
          color: borderColor,
          width: 1,
        ),
      ),
    ),

    dividerColor: borderColor,
  );
}