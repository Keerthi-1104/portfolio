import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../widgets/section_header.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final columns = width < 680 ? 1 : (width < 1040 ? 2 : 3);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(number: '03', title: 'Things I’ve Built'),
          LayoutBuilder(builder: (context, constraints) {
            const gap = 22.0;
            final cardWidth =
                (constraints.maxWidth - gap * (columns - 1)) / columns;
            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: projects
                  .map((p) => SizedBox(
                        width: cardWidth,
                        child: IntrinsicHeight(child: ProjectCard(project: p)),
                      ))
                  .toList(),
            );
          }),
        ],
      ),
    );
  }
}
