import 'package:flutter/material.dart';

import 'data/portfolio_data.dart';
import 'theme/app_theme.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/experience_section.dart';
import 'sections/contact_section.dart';
import 'widgets/nav_bar.dart';
import 'widgets/link_utils.dart';

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${Profile.name} · Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  // Keys used to scroll each section into view from the nav.
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      alignment: 0.05,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navItems = [
      NavItem('About', () => _scrollTo(_aboutKey)),
      NavItem('Skills', () => _scrollTo(_skillsKey)),
      NavItem('Work', () => _scrollTo(_projectsKey)),
      NavItem('Experience', () => _scrollTo(_experienceKey)),
      NavItem('Contact', () => _scrollTo(_contactKey)),
    ];

    return Scaffold(
      endDrawer: _MobileMenu(items: navItems),
      body: Column(
        children: [
          Builder(
            builder: (context) => TopNavBar(
              items: navItems,
              onMenu: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1100),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          HeroSection(onViewWork: () => _scrollTo(_projectsKey)),
                          KeyedSubtree(key: _aboutKey, child: const AboutSection()),
                          KeyedSubtree(key: _skillsKey, child: const SkillsSection()),
                          KeyedSubtree(key: _projectsKey, child: const ProjectsSection()),
                          KeyedSubtree(key: _experienceKey, child: const ExperienceSection()),
                          KeyedSubtree(key: _contactKey, child: const ContactSection()),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Slide-out menu shown on narrow screens.
class _MobileMenu extends StatelessWidget {
  const _MobileMenu({required this.items});
  final List<NavItem> items;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < items.length; i++)
              ListTile(
                leading: Text('0${i + 1}.', style: AppTheme.mono(size: 14)),
                title: Text(
                  items[i].label,
                  style: const TextStyle(color: AppColors.textPrimary),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  items[i].onTap();
                },
              ),
            const Divider(color: AppColors.surfaceLight),
            ListTile(
              leading: const Icon(Icons.description_outlined, color: AppColors.accent),
              title: Text('Resume / GitHub',
                  style: AppTheme.mono(size: 14, color: AppColors.textPrimary)),
              onTap: () => openLink(
                Profile.resumeUrl.isEmpty ? Profile.github : Profile.resumeUrl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
