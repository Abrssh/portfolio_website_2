import 'package:flutter/material.dart';
import 'package:portfolio_website_2/MVVM/View/Widgets/football_api_section.dart';
import '../Widgets/about_section.dart';
import '../Widgets/experience_section.dart';
import '../Widgets/portfolio_section.dart';
import '../Widgets/contact_section.dart';
import '../Widgets/animated_background.dart';

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
                  FootballApiSection(),
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
