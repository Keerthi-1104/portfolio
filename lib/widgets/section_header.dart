import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'gradient_text.dart';

/// A numbered section header like "01. About Me" with a trailing gradient line.
class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.number, required this.title});

  final String number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 38),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GradientText(
            '$number.',
            style: AppTheme.mono(size: 20, weight: FontWeight.w600),
          ),
          const SizedBox(width: 14),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w800,
                color: AppColors.heading,
              ),
            ),
          ),
          const SizedBox(width: 22),
          Expanded(
            child: Container(
              height: 1.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.accent.withValues(alpha: 0.5),
                    AppColors.violet.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
