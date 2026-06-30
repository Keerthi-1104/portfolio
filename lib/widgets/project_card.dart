import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'link_utils.dart';

/// A glassmorphic, hover-elevating card for a single project.
class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _hovered ? -8 : 0, 0),
        padding: const EdgeInsets.all(24),
        decoration: AppDecorations.glass(hovered: _hovered),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.accent.withValues(alpha: 0.18),
                        AppColors.violet.withValues(alpha: 0.18),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.folder_open, color: AppColors.accent, size: 24),
                ),
                const Spacer(),
                if (p.featured)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.violet.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.violet.withValues(alpha: 0.35)),
                    ),
                    child: Text('Featured',
                        style: AppTheme.mono(size: 10, color: AppColors.violet)),
                  ),
                if (p.link != null && p.link!.isNotEmpty)
                  IconButton(
                    tooltip: 'Open project',
                    onPressed: () => openLink(p.link!),
                    icon: const Icon(Icons.open_in_new, size: 20),
                    color: Colors.white70,
                    splashRadius: 18,
                  ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              p.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: _hovered ? AppColors.accent : AppColors.heading,
              ),
            ),
            const SizedBox(height: 4),
            Text(p.subtitle, style: AppTheme.mono(size: 12)),
            const SizedBox(height: 14),
            Text(
              p.description,
              style: const TextStyle(
                color: AppColors.textSecondary,
                height: 1.55,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 18),
            Wrap(
              spacing: 10,
              runSpacing: 8,
              children: p.tech
                  .map((t) => Text(t,
                      style: AppTheme.mono(size: 11, color: AppColors.textSecondary)))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
