import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/link_utils.dart';
import '../widgets/gradient_text.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onViewWork});

  /// Scrolls the page to the projects section.
  final VoidCallback onViewWork;

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 720;
    return Padding(
      padding: const EdgeInsets.only(top: 90, bottom: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _AvailabilityBadge(),
          const SizedBox(height: 28),
          Text(Profile.greeting, style: AppTheme.mono(size: 16)),
          const SizedBox(height: 14),
          GradientText(
            '${Profile.name}.',
            style: TextStyle(
              fontSize: isNarrow ? 46 : 78,
              fontWeight: FontWeight.w800,
              height: 1.02,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            Profile.tagline,
            style: TextStyle(
              fontSize: isNarrow ? 26 : 46,
              fontWeight: FontWeight.w800,
              color: AppColors.textSecondary,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 16),
          Text(Profile.roleLine,
              style: AppTheme.mono(size: 14, color: AppColors.accent)),
          const SizedBox(height: 26),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 580),
            child: Text(
              Profile.heroSummary,
              style: const TextStyle(
                fontSize: 16,
                height: 1.65,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: 38),
          Wrap(
            spacing: 16,
            runSpacing: 14,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _GradientButton(label: 'View my work', onTap: onViewWork),
              _GhostButton(
                label: 'Get in touch',
                onTap: () => openLink('mailto:${Profile.email}'),
              ),
              const SizedBox(width: 4),
              SocialIconButton(
                  icon: Icons.code, url: Profile.github, tooltip: 'GitHub'),
              SocialIconButton(
                  icon: Icons.work_outline,
                  url: Profile.linkedIn,
                  tooltip: 'LinkedIn'),
              SocialIconButton(
                  icon: Icons.email_outlined,
                  url: 'mailto:${Profile.email}',
                  tooltip: Profile.email),
            ],
          ),
        ],
      ),
    );
  }
}

class _AvailabilityBadge extends StatelessWidget {
  const _AvailabilityBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: AppColors.accent, blurRadius: 8, spreadRadius: 1),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text('Available for opportunities',
              style: AppTheme.mono(size: 12, color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}

/// Filled gradient pill button with a glow.
class _GradientButton extends StatefulWidget {
  const _GradientButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<_GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<_GradientButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 17),
          decoration: BoxDecoration(
            gradient: AppGradients.brand,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withValues(alpha: _hovered ? 0.45 : 0.25),
                blurRadius: _hovered ? 28 : 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Text(
            widget.label,
            style: const TextStyle(
              color: Color(0xFF06121F),
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class _GhostButton extends StatelessWidget {
  const _GhostButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.accent,
        side: BorderSide(color: AppColors.accent.withValues(alpha: 0.6)),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label),
    );
  }
}
