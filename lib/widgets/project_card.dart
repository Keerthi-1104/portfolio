import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'link_utils.dart';

/// A hover-elevating card for a single project.
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
        duration: const Duration(milliseconds: 180),
        transform: Matrix4.translationValues(0, _hovered ? -6 : 0, 0),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hovered ? AppColors.accent : AppColors.surfaceLight,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.35),
                    blurRadius: 20,
                    offset: const Offset(0, 12),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.folder_open, color: AppColors.accent, size: 32),
                const Spacer(),
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
            const SizedBox(height: 16),
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
                  .map((t) => Text(t, style: AppTheme.mono(size: 11, color: AppColors.textSecondary)))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
