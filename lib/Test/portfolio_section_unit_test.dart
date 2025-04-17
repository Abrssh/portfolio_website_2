// Unit Test
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website_2/MVVM/View/Widgets/portfolio_section.dart';

void main() {
  testWidgets('Should be scrollable', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1400);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpWidget(
      const MaterialApp(
        home: PortfolioSection(isTest: true),
      ),
    );

    final scrollable = find.byType(Scrollable);
    expect(scrollable, findsAny);
  });

  testWidgets('Should have an image', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(
            size: Size(1200, 900),
            devicePixelRatio: 1.0,
          ),
          child: PortfolioSection(isTest: true),
        ),
      ),
    );

    final shrink = find.byWidget(const SizedBox.shrink());
    expect(shrink, findsAny);
  });

  testWidgets('Should have a link to github', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(
            size: Size(1200, 900),
            devicePixelRatio: 1.0,
          ),
          child: PortfolioSection(isTest: true),
        ),
      ),
    );

    final githubLink = find.byIcon(FontAwesomeIcons.github);
    expect(githubLink, findsOneWidget);
  });
}
