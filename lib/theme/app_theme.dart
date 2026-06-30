import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized colors, gradients + theme for the portfolio.
/// Dark "developer" palette with a teal→blue→violet brand gradient.
class AppColors {
  static const Color background = Color(0xFF070B16);
  static const Color surface = Color(0xFF0F1B33);
  static const Color surfaceLight = Color(0xFF1D2D50);
  static const Color accent = Color(0xFF64FFDA);
  static const Color violet = Color(0xFFA855F7);
  static const Color blue = Color(0xFF5B8DEF);
  static const Color textPrimary = Color(0xFFCCD6F6);
  static const Color textSecondary = Color(0xFF8B97B5);
  static const Color heading = Color(0xFFE6F1FF);
}

class AppGradients {
  /// Primary brand gradient — used for headings, badges, accents.
  static const LinearGradient brand = LinearGradient(
    colors: [AppColors.accent, AppColors.blue, AppColors.violet],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient brandDiagonal = LinearGradient(
    colors: [AppColors.accent, AppColors.blue, AppColors.violet],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

/// Reusable "glass" surface decoration used by all cards.
class AppDecorations {
  static BoxDecoration glass({bool hovered = false, double radius = 16}) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: hovered
            ? [
                Colors.white.withValues(alpha: 0.08),
                Colors.white.withValues(alpha: 0.02),
              ]
            : [
                Colors.white.withValues(alpha: 0.045),
                Colors.white.withValues(alpha: 0.015),
              ],
      ),
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        color: hovered
            ? AppColors.accent.withValues(alpha: 0.55)
            : Colors.white.withValues(alpha: 0.09),
        width: 1,
      ),
      boxShadow: hovered
          ? [
              BoxShadow(
                color: AppColors.accent.withValues(alpha: 0.18),
                blurRadius: 34,
                spreadRadius: -6,
                offset: const Offset(0, 16),
              ),
            ]
          : [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
            ],
    );
  }
}

class AppTheme {
  static ThemeData get dark {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.accent,
        secondary: AppColors.violet,
        surface: AppColors.surface,
      ),
      textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
        bodyColor: AppColors.textSecondary,
        displayColor: AppColors.heading,
      ),
    );
  }

  /// Monospace accent font for "code-style" labels and section numbers.
  static TextStyle mono({
    double size = 14,
    Color color = AppColors.accent,
    FontWeight weight = FontWeight.w400,
  }) =>
      GoogleFonts.firaCode(fontSize: size, color: color, fontWeight: weight);
}
