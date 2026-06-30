import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/section_header.dart';
import '../widgets/gradient_text.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 760;
    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final p in About.paragraphs) ...[
          Text(
            p,
            style: const TextStyle(
              fontSize: 16,
              height: 1.7,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
        ],
        const SizedBox(height: 8),
        Wrap(
          spacing: 28,
          runSpacing: 10,
          children: About.highlights
              .map((h) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.play_arrow, size: 14, color: AppColors.accent),
                      const SizedBox(width: 8),
                      Text(h, style: AppTheme.mono(size: 13, color: AppColors.textPrimary)),
                    ],
                  ))
              .toList(),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(number: '01', title: 'About Me'),
          if (isNarrow)
            text
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: text),
                const SizedBox(width: 50),
                const Expanded(flex: 2, child: _AvatarCard()),
              ],
            ),
        ],
      ),
    );
  }
}

/// A simple monogram avatar placeholder (swap for a real photo later).
class _AvatarCard extends StatelessWidget {
  const _AvatarCard();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.accent, AppColors.blue, AppColors.violet],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.violet.withValues(alpha: 0.35),
              blurRadius: 40,
              spreadRadius: -8,
              offset: const Offset(0, 18),
            ),
          ],
        ),
        padding: const EdgeInsets.all(2),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.surface, AppColors.background],
            ),
          ),
          alignment: Alignment.center,
          child: GradientText(
            'K',
            style: const TextStyle(fontSize: 110, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
