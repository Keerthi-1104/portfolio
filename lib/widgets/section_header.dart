import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A numbered section header like "01. About Me" with a trailing divider line.
class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.number, required this.title});

  final String number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 36),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$number.', style: AppTheme.mono(size: 18)),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: AppColors.heading,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 1,
              color: AppColors.surfaceLight,
            ),
          ),
        ],
      ),
    );
  }
}
