/// All editable portfolio content lives here.
///
/// To update your portfolio, change the strings/lists below — you almost never
/// need to touch the UI code in `lib/sections/` or `lib/widgets/`.
library;

import 'package:flutter/material.dart';

/// ───────────────────────── Identity / hero ─────────────────────────
class Profile {
  static const String name = 'Keerthana';
  static const String greeting = "Hi, my name is";
  static const String tagline = 'I build cross-platform apps & full-stack systems.';

  static const String roleLine =
      'Software Engineer · Full-Stack Developer · Flutter';

  static const String heroSummary =
      'Software Engineer with professional experience as a Flutter Mobile '
      'Application Developer and Full-Stack Developer, specializing in '
      'cross-platform Android & iOS apps with Flutter, Dart, Java, Spring Boot '
      'and MySQL — from design and development through testing, deployment and '
      'maintenance of enterprise and consumer applications.';

  // Contact / links — edit these.
  static const String email = 'keerthana.dev1104@gmail.com';
  static const String github = 'https://github.com/Keerthi-1104';
  static const String linkedIn = 'https://www.linkedin.com/in/keerthana-r-8bb6ba32b';
  static const String location = 'India';
  /// Public URL of the resume PDF. The file lives at `web/resume.pdf` so
  /// Flutter copies it verbatim to `build/web/resume.pdf`, giving us the clean
  /// shareable URL `<site>/resume.pdf` in dev and after deployment alike.
  static const String resumeUrl = 'resume.pdf';
}

/// ───────────────────────── About ─────────────────────────
class About {
  static const List<String> paragraphs = [
    'I’m a Software Engineer working across the full stack — building '
        'cross-platform Android and iOS applications with Flutter and Dart, and '
        'backend services with Java and Spring Boot on MySQL.',
    'My work spans mobile architecture, REST/GraphQL API integration, database '
        'design, application security, performance optimization, and scalable '
        'software solutions for both enterprise and consumer products.',
    'I’ve shipped apps through Google Play Console, App Store Connect and '
        'TestFlight, and I enjoy turning Figma designs into responsive, '
        'production-ready experiences.',
  ];

  static const List<String> highlights = [
    'Cross-platform mobile (Flutter / Dart)',
    'Backend APIs (Java, Spring Boot, MySQL)',
    'Barcode & product traceability (GS1)',
    'End-to-end release management',
  ];
}

/// ───────────────────────── Skills ─────────────────────────
class SkillGroup {
  final String title;
  final IconData icon;
  final List<String> skills;
  const SkillGroup(this.title, this.icon, this.skills);
}

const List<SkillGroup> skillGroups = [
  SkillGroup('Languages', Icons.code, [
    'Dart', 'Java', 'SQL', 'JSON',
  ]),
  SkillGroup('Mobile & Frontend', Icons.phone_android, [
    'Flutter', 'Android SDK', 'Provider', 'BLoC',
    'Flutter Secure Storage', 'Hive', 'Deep Linking', 'Offline Caching',
  ]),
  SkillGroup('Backend & APIs', Icons.dns, [
    'Spring Boot', 'REST APIs', 'GraphQL', 'Dio', 'HTTP',
    'MySQL', 'Firebase', 'Firebase Crashlytics',
  ]),
  SkillGroup('GS1 & Scanning', Icons.qr_code_scanner, [
    'Scandit SDK', 'Google ML Kit', 'GS1 Digital Link',
    'DataMatrix', 'QR Code', 'GTIN', 'Product Authentication',
  ]),
  SkillGroup('Integrations', Icons.extension, [
    'Google Maps API', 'Razorpay', 'SuiteCRM', 'Nuxeo CMS',
  ]),
  SkillGroup('Tools & Delivery', Icons.build, [
    'Git', 'GitHub', 'Postman', 'Android Studio', 'Xcode', 'VS Code',
    'Figma', 'Jira', 'CI/CD', 'TestFlight', 'Play Console', 'App Store Connect',
    'Agile / Scrum',
  ]),
];

/// ───────────────────────── Projects ─────────────────────────
class Project {
  final String name;
  final String subtitle;
  final String description;
  final List<String> tech;
  final String? link;
  final bool featured;
  const Project({
    required this.name,
    required this.subtitle,
    required this.description,
    required this.tech,
    this.link,
    this.featured = false,
  });
}

const List<Project> projects = [
  Project(
    name: 'SE Learning Platform',
    subtitle: 'Offline-first AI learning roadmap',
    description:
        'A 16-level structured learning platform that guides users through a '
        'software-engineering roadmap. Built offline-first so the core '
        'experience never depends on connectivity, with AI used to enhance — '
        'never gate — learning.',
    tech: ['Flutter', 'Dart', 'Offline-first', 'AI', 'Hive'],
    featured: true,
  ),
  Project(
    name: 'Case Allocation System',
    subtitle: 'Sales & Collections platform',
    description:
        'Enterprise web + mobile platform for loan sales and collections. '
        'Designed scalable Spring Boot REST APIs over MySQL, integrated SuiteCRM '
        'for case allocation and workflow automation, Nuxeo CMS for secure '
        'document management, Google Maps for agent tracking, and Razorpay for '
        'EMI collections and payments.',
    tech: ['Flutter', 'Spring Boot', 'MySQL', 'SuiteCRM', 'Nuxeo', 'Razorpay', 'Google Maps'],
    featured: true,
  ),
  Project(
    name: 'Smart Consumer',
    subtitle: 'GS1 consumer product app',
    description:
        'Revamped the Smart Consumer app — redesigned the UI/UX, refactored the '
        'architecture, implemented GS1 Digital Link and DataMatrix scanning, and '
        'optimized performance for a smoother consumer experience.',
    tech: ['Flutter', 'Dart', 'GS1 Digital Link', 'DataMatrix', 'Scandit', 'Google ML Kit'],
    featured: true,
  ),
  Project(
    name: 'ClickIT',
    subtitle: 'Feature development & stability',
    description:
        'Developed and maintained the ClickIT application — shipping new '
        'features, resolving production issues, and improving overall '
        'application stability.',
    tech: ['Flutter', 'Dart', 'REST APIs', 'Firebase'],
  ),
  Project(
    name: 'Traceability',
    subtitle: 'Native Android (Java)',
    description:
        'Provided production support and defect fixes for the Traceability '
        'application built with native Android (Java), keeping the supply-chain '
        'tracking flows reliable.',
    tech: ['Android', 'Java', 'Barcode'],
  ),
  Project(
    name: 'Trace Offline',
    subtitle: 'Offline traceability (Java)',
    description:
        'Built a native Android app with offline data storage, synchronization, '
        'barcode scanning and file-transfer capabilities for use in '
        'low-connectivity environments.',
    tech: ['Android', 'Java', 'Offline Sync', 'Barcode'],
  ),
  Project(
    name: 'GS1 Verify',
    subtitle: 'Java → Flutter migration',
    description:
        'Redeveloped the GS1 Verify app by migrating it from native Android '
        '(Java) to Flutter, unifying it into a single cross-platform codebase '
        'for Android and iOS.',
    tech: ['Flutter', 'Dart', 'GS1', 'Migration'],
  ),
  Project(
    name: 'Canteen Application',
    subtitle: 'Enhancements & performance',
    description:
        'Upgraded the Canteen application with feature enhancements, defect '
        'resolution, and performance improvements.',
    tech: ['Flutter', 'Dart', 'Firebase'],
  ),
  Project(
    name: 'Master Foundation Framework',
    subtitle: 'Reusable Flutter architecture',
    description:
        'Designed a reusable Flutter foundation with shared modules, common '
        'services, authentication, navigation and reusable UI components to '
        'accelerate new app development across the team.',
    tech: ['Flutter', 'Dart', 'Clean Architecture', 'BLoC'],
  ),
];

/// ───────────────────────── Experience ─────────────────────────
class ExperienceItem {
  final String role;
  final String tech;
  final List<String> bullets;
  const ExperienceItem(this.role, this.tech, this.bullets);
}

const List<ExperienceItem> experience = [
  ExperienceItem(
    'Software Engineer — Flutter Mobile App Developer',
    'Flutter · Dart · Java · Firebase · Scandit · Google ML Kit · GS1',
    [
      'Revamped Smart Consumer with new UI/UX, refactored architecture, GS1 '
          'Digital Link & DataMatrix scanning, and performance optimization.',
      'Migrated GS1 Verify from native Android (Java) to a unified Flutter '
          'cross-platform codebase.',
      'Built the Master Foundation Framework — reusable architecture with '
          'shared services, auth, navigation and UI components.',
      'Implemented barcode/QR scanning (Scandit, ML Kit) supporting GS1 Digital '
          'Link, DataMatrix, QR and GTIN.',
      'Delivered responsive UI from Figma, applied Provider/BLoC state '
          'management, and managed Android/iOS releases via Play Console, App '
          'Store Connect and TestFlight.',
    ],
  ),
  ExperienceItem(
    'Software Engineer — Full-Stack (Flutter & Spring Boot)',
    'Spring Boot · MySQL · SuiteCRM · Nuxeo · Razorpay · Google Maps',
    [
      'Designed and implemented scalable RESTful APIs and business logic with '
          'Spring Boot over MySQL.',
      'Integrated SuiteCRM for CRM, lead management, case allocation and '
          'workflow automation.',
      'Implemented Nuxeo CMS for secure document storage, retrieval and '
          'workflow processing.',
      'Integrated Google Maps for agent tracking and route navigation, and '
          'Razorpay for EMI collections and secure payments.',
      'Optimized MySQL queries, resolved production issues, and collaborated '
          'via Git, Postman, Jira and Agile/Scrum.',
    ],
  ),
];
