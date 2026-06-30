import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/link_utils.dart';
import '../widgets/gradient_text.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 90),
      child: Column(
        children: [
          Text('05. What’s Next?', style: AppTheme.mono(size: 15)),
          const SizedBox(height: 18),
          GradientText(
            'Get In Touch',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 540),
            child: const Text(
              'I’m always open to discussing new projects, opportunities, or '
              'collaborations. Whether you have a question or just want to say '
              'hi, my inbox is open.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.7,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: 36),
          OutlinedButton(
            onPressed: () => openLink('mailto:${Profile.email}'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.accent,
              side: const BorderSide(color: AppColors.accent),
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 22),
              textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            ),
            child: const Text('Say Hello'),
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIconButton(
                icon: Icons.email_outlined,
                url: 'mailto:${Profile.email}',
                tooltip: Profile.email,
              ),
              SocialIconButton(
                icon: Icons.code,
                url: Profile.github,
                tooltip: 'GitHub',
              ),
              SocialIconButton(
                icon: Icons.work_outline,
                url: Profile.linkedIn,
                tooltip: 'LinkedIn',
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Designed & built by ${Profile.name} · Flutter Web',
            style: AppTheme.mono(size: 12, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
