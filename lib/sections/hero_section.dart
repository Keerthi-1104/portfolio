import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/link_utils.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onViewWork});

  /// Scrolls the page to the projects section.
  final VoidCallback onViewWork;

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 720;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Profile.greeting, style: AppTheme.mono(size: 16)),
          const SizedBox(height: 18),
          Text(
            '${Profile.name}.',
            style: TextStyle(
              fontSize: isNarrow ? 44 : 72,
              fontWeight: FontWeight.w800,
              color: AppColors.heading,
              height: 1.05,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            Profile.tagline,
            style: TextStyle(
              fontSize: isNarrow ? 28 : 52,
              fontWeight: FontWeight.w800,
              color: AppColors.textSecondary,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 12),
          Text(Profile.roleLine, style: AppTheme.mono(size: 14, color: AppColors.accent)),
          const SizedBox(height: 28),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              Profile.heroSummary,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              _AccentButton(label: 'View my work', onTap: onViewWork),
              const SizedBox(width: 16),
              _OutlineButton(
                label: 'Get in touch',
                onTap: () => openLink('mailto:${Profile.email}'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AccentButton extends StatelessWidget {
  const _AccentButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.background,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: Text(label),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  const _OutlineButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.accent,
        side: const BorderSide(color: AppColors.accent),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: Text(label),
    );
  }
}
