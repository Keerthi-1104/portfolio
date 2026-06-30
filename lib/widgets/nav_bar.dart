import 'dart:ui';
import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'link_utils.dart';
import 'gradient_text.dart';

class NavItem {
  final String label;
  final VoidCallback onTap;
  const NavItem(this.label, this.onTap);
}

/// Sticky top navigation. Collapses to a logo + menu icon on narrow screens.
class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key, required this.items, required this.onMenu});

  final List<NavItem> items;
  final VoidCallback onMenu;

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 820;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.background.withValues(alpha: 0.55),
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withValues(alpha: 0.08),
                width: 0.8,
              ),
            ),
          ),
          child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                _Logo(),
                const Spacer(),
                if (isNarrow)
                  IconButton(
                    onPressed: onMenu,
                    icon: const Icon(Icons.menu, color: AppColors.accent),
                  )
                else ...[
                  for (int i = 0; i < items.length; i++)
                    _NavLink(index: i + 1, item: items[i]),
                  const SizedBox(width: 16),
                  OutlinedButton(
                    onPressed: () => openLink(
                      Profile.resumeUrl.isEmpty ? Profile.github : Profile.resumeUrl,
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.accent,
                      side: const BorderSide(color: AppColors.accent),
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    ),
                    child: const Text('Resume'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
          ),
        ),
      );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.7), width: 1.5),
      ),
      alignment: Alignment.center,
      child: GradientText(
        'K',
        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({required this.index, required this.item});
  final int index;
  final NavItem item;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.item.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '0${widget.index}. ',
                style: AppTheme.mono(size: 13),
              ),
              Text(
                widget.item.label,
                style: TextStyle(
                  fontSize: 14,
                  color: _hovered ? AppColors.accent : AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
