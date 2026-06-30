// Basic smoke test for the portfolio app.

import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio/main.dart';
import 'package:portfolio/data/portfolio_data.dart';

void main() {
  testWidgets('Portfolio renders hero name', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pump();

    expect(find.textContaining(Profile.name), findsWidgets);
  });
}
