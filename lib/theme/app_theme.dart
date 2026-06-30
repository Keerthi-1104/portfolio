import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized colors + theme for the portfolio.
/// Classic dark "developer" palette: deep navy, slate text, teal accent.
class AppColors {
  static const Color background = Color(0xFF0A192F);
  static const Color surface = Color(0xFF112240);
  static const Color surfaceLight = Color(0xFF1D2D50);
  static const Color accent = Color(0xFF64FFDA);
  static const Color textPrimary = Color(0xFFCCD6F6);
  static const Color textSecondary = Color(0xFF8892B0);
  static const Color heading = Color(0xFFE6F1FF);
}

class AppTheme {
  static ThemeData get dark {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.accent,
        secondary: AppColors.accent,
        surface: AppColors.surface,
      ),
      textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
        bodyColor: AppColors.textSecondary,
        displayColor: AppColors.heading,
      ),
    );
  }

  /// Monospace accent font used for "code-style" labels and section numbers.
  static TextStyle mono({
    double size = 14,
    Color color = AppColors.accent,
    FontWeight weight = FontWeight.w400,
  }) =>
      GoogleFonts.firaCode(fontSize: size, color: color, fontWeight: weight);
}
