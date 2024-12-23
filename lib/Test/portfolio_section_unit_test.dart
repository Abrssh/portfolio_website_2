// Unit Test
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website_2/MVVM/View/portfolio_section.dart';

void main() {
  testWidgets('Should be scrollable', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PortfolioSection(),
      ),
    );

    final scrollable = find.byType(Scrollable);
    expect(scrollable, findsOneWidget);
  });

  testWidgets('Should have an image', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PortfolioSection(),
      ),
    );

    final image = find.byType(Image);
    expect(image, findsWidgets);
  });

  testWidgets('Should have a link to github', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PortfolioSection(),
      ),
    );

    final githubLink = find.byIcon(FontAwesomeIcons.github);
    expect(githubLink, findsOneWidget);
  });
}
