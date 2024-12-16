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
    return Scaffold(
      body: Stack(
        children: [
          const AnimatedBackground(),
          Scrollbar(
            child: SingleChildScrollView(
              primary: true,
              child: Column(
                children: [
                  const AboutSection(),
                  const ExperienceSection(),
                  PortfolioSection(),
                  const ContactSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
