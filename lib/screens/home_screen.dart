import 'package:flutter/material.dart';
import '../widgets/about_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/portfolio_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/animated_background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          AnimatedBackground(),
          Scrollbar(
            child: SingleChildScrollView(
              primary: true,
              child: Column(
                children: [
                  AboutSection(),
                  ExperienceSection(),
                  PortfolioSection(),
                  ContactSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
