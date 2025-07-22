import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio_website_2/MVVM/View/theme/app_theme.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  @override
  Widget build(BuildContext context) {
    // final List<Widget> experiences = [];
    final List<Widget> experiences = _addExperiences(context);

    // for (var i = 0; i < 5; i++) {
    //   experiences.add(_buildExperience(
    //       context,
    //       i == 0,
    //       i,
    //       "Senior Developer",
    //       "Tech Company Inc.",
    //       "2020 - Present",
    //       "Led development of multiple successful projects using Flutter and React. Mentored junior developers and implemented best practices that improved team productivity by 40%."));
    // }
    return Container(
      padding: const EdgeInsets.all(32),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            'Experience',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 32),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 800),
                    child: SlideAnimation(
                      // verticalOffset: 50.0,
                      horizontalOffset: 30.0,
                      child: ScaleAnimation(child: experiences[index]),
                    ),
                  );
                },
                itemCount: experiences.length,
                shrinkWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildExperience(BuildContext context, bool main, int num, String title,
    String company, String date, String description) {
  final isMobile = MediaQuery.of(context).size.width < 600;
  final isDesktop = MediaQuery.of(context).size.width > 1064;
  final width = MediaQuery.of(context).size.width * (isMobile ? 0.7 : 0.5);
  final height = MediaQuery.of(context).size.height * (isMobile ? 0.4 : 0.5);

  debugPrint(
      'width: $width, height: $height isMobile: $isMobile isDesktop: $isDesktop media width: ${MediaQuery.of(context).size.width}');

  return main
      ? VisibilityDetector(
          key: Key('featured-experience $num'),
          onVisibilityChanged: (info) {
            if (info.visibleFraction > 0.5) {
              debugPrint("Widget visible $num");
            } else {
              debugPrint("widget invisible $num");
            }
          },
          child: Container(
            width: width,
            height: height,
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.all(20),
            // color: Colors.purple[800],
            decoration: BoxDecoration(
              gradient: AppTheme.secondaryGradient,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  company,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  date,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white.withOpacity(0.8),
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: isMobile
                          ? width * 0.025
                          : isDesktop
                              ? width * 0.02
                              : width * 0.025),
                ),
              ],
            ),
          )
              .animate(
                  // delay: const Duration(milliseconds: 1000),
                  // onPlay: (controller) => controller.repeat(),
                  )
              .shimmer(
                duration: const Duration(milliseconds: 2000),
                color: Colors.white.withOpacity(0.2),
              ),
        )
      : VisibilityDetector(
          key: Key('normal-experience $num'),
          onVisibilityChanged: (info) {
            // if (info.visibleFraction > 0.5) {
            //   debugPrint("Widget visible $num");
            // } else {
            //   debugPrint("widget invisible $num");
            // }
          },
          child: Container(
            width: width,
            height: height,
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      // color: Colors.white,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  company,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      // color: Colors.white.withOpacity(0.9),
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  date,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      // color: Colors.white.withOpacity(0.8),
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      // color: Colors.white.withOpacity(0.9),
                      fontSize: isMobile
                          ? width * 0.029
                          : isDesktop
                              ? width * 0.022
                              : width * 0.03),
                ),
              ],
            ),
          ),
        );
}

List<Widget> _addExperiences(BuildContext context) {
  List<Widget> experiences = [];
  Widget experience1 = _buildExperience(
      context,
      true,
      1,
      "Developer and System Analyst",
      "Masstaxi/DAST (Startup)",
      "AUG 2020 - SEP 2022",
      "I was tasked with identifying key requirements, system design and developing the mobile front end using flutter and back end using firebase. I implemented native features for the app using kotlin and developed multiple backend services using firebase cloud function. During testing and iteration phase I decreased route failure by 60% and increased usability among taxi drivers by 45%.");
  Widget experience2 = _buildExperience(
      context,
      false,
      2,
      "Freelancer",
      "Fiverr",
      "SEP 2022 - JAN 2023",
      "I have worked on different projects using firebase cloud function notably on a web scraping project that was analyzing and monitoring different Crypto and NFT projects. Increased monitored sites 3x and increased scraped data by 40%.");
  Widget experience3 = _buildExperience(
      context,
      false,
      2,
      "Freelancer",
      "Upwork",
      "JAN 2023 - MAY 2023",
      "I have worked on a flutter and firebase development job for an app that help kids and parents manage tasks for a company that was based in Israel on upwork. I added authentication, media handling functionalities, improved UI, real time updates using firebase and other features requested by the Client.");
  Widget experience4 = _buildExperience(
      context,
      false,
      2,
      "Freelancer",
      "Fiverr",
      "MAY 2023 - JAN 2024",
      "Worked on some smaller tasks when it comes to Firebase cloud functions and mobile native kotlin development for flutter apps that need native features.");
  Widget experience5 = _buildExperience(
      context,
      false,
      2,
      "Freelancer",
      "Upwork",
      "FEB 2024 - MAY 2024",
      "Worked on flutter and firebase involving a carpooling project which also included some openAI features. And worked on and delivered a carpool game they needed as well, using flame package in flutter.");
  Widget experience6 = _buildExperience(
      context,
      false,
      2,
      "AI trainer and Developer",
      "Ubuntu Agency",
      "MAY 2024 - SEP 2024",
      "Worked on an agency based in the US that was involved in training LLM’s for coding mainly in python and typescript. Was tasked with writing prompts, reviewing conversations, reviewing code and testing under the guidelines provided.");

  experiences.add(experience1);
  experiences.add(experience2);
  experiences.add(experience3);
  experiences.add(experience5);
  experiences.add(experience6);
  experiences.add(experience4);
  return experiences;
}
