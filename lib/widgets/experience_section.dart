import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio_website_2/theme/app_theme.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection>
    with TickerProviderStateMixin {
  // bool playAnimation = false;
  // late AnimationController fadeInAnimation;

  // @override
  // void initState() {
  //   super.initState();
  //   fadeInAnimation = AnimationController(
  //       vsync: this, duration: const Duration(milliseconds: 1500));
  //   fadeInAnimation.addListener(() {
  //     setState(() {
  //       debugPrint(
  //           "Animation Value init state ${fadeInAnimation.isAnimating}  ${fadeInAnimation.isCompleted}");
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final List<Widget> experiences = [];

    for (var i = 0; i < 5; i++) {
      // experiences.add(
      //   VisibilityDetector(
      //       key: ValueKey(i),
      //       onVisibilityChanged: (info) {},
      //       child: Container(
      //         width: 200,
      //         height: 250,
      //         // padding: const EdgeInsets.all(16),
      //         // margin: const EdgeInsets.all(16),
      //         decoration: BoxDecoration(
      //           gradient: AppTheme.primaryGradient,
      //           borderRadius: BorderRadius.circular(16),
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               'Experience $i',
      //               style: Theme.of(context).textTheme.headlineSmall,
      //             ),
      //             const SizedBox(height: 8),
      //             Text(
      //               'Duration: 2 years',
      //               style: Theme.of(context).textTheme.bodySmall,
      //             ),
      //           ],
      //         ),
      //       )
      //           // .animate(onPlay: (controller) => controller.repeat(reverse: true))
      //           .animate()
      //           .fadeIn(
      //             begin: 0.5,
      //             curve: Curves.easeInCubic,
      //             duration: const Duration(milliseconds: 2000),
      //             delay: Duration(milliseconds: 500 + (i * 200)),
      //           )
      //       // .scaleXY(
      //       //     begin: 0.8,
      //       //     end: 1,
      //       //     curve: Curves.easeInCubic,
      //       //     duration: const Duration(milliseconds: 2000),
      //       //     delay: Duration(milliseconds: 500 + (i * 200))),
      //       ),
      // );
      experiences.add(_buildExperience(
          context,
          i == 0,
          i,
          "Senior Developer",
          "Tech Company Inc.",
          "2020 - Present",
          "Led development of multiple successful projects using Flutter and React. Mentored junior developers and implemented best practices that improved team productivity by 40%."));
    }
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
          // VisibilityDetector(
          //   key: const Key('featured-experience'),
          //   onVisibilityChanged: (info) {
          //     if (info.visibleFraction > 0.5) {
          //       // setState(() {
          //       //   playAnimation = true;
          //       // });
          //       debugPrint("Widget visible");
          //       // fadeInAnimation.forward(from: 0);
          //     } else {
          //       // setState(() {
          //       //   playAnimation = false;
          //       // });
          //       // fadeInAnimation.stop();
          //       debugPrint("widget invisible");
          //     }
          //   },
          //   child: Animate(
          //     // controller: fadeInAnimation,
          //     // onPlay: (controller) => playAnimation,
          //     child: Container(
          //       constraints: const BoxConstraints(maxWidth: 800),
          //       padding: const EdgeInsets.all(24),
          //       decoration: BoxDecoration(
          //         // gradient: const LinearGradient(
          //         //   colors: [Color(0xFF6448FE), Color(0xFF5FC6FF)],
          //         //   begin: Alignment.topLeft,
          //         //   end: Alignment.bottomRight,
          //         // ),
          //         gradient: AppTheme.primaryGradient,
          //         borderRadius: BorderRadius.circular(16),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.blue.withOpacity(0.3),
          //             blurRadius: 10,
          //             offset: const Offset(0, 4),
          //           ),
          //         ],
          //       ),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             'Senior Developer',
          //             style:
          //                 Theme.of(context).textTheme.headlineSmall?.copyWith(
          //                       color: Colors.white,
          //                     ),
          //           ),
          //           const SizedBox(height: 8),
          //           Text(
          //             'Tech Company Inc.',
          //             style: Theme.of(context).textTheme.titleLarge?.copyWith(
          //                   color: Colors.white.withOpacity(0.9),
          //                 ),
          //           ),
          //           const SizedBox(height: 16),
          //           Text(
          //             '2020 - Present',
          //             style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          //                   color: Colors.white.withOpacity(0.8),
          //                 ),
          //           ),
          //           const SizedBox(height: 16),
          //           Text(
          //             'Led development of multiple successful projects using Flutter and React. '
          //             'Mentored junior developers and implemented best practices that improved team productivity by 40%.',
          //             style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          //                   color: Colors.white.withOpacity(0.9),
          //                 ),
          //           ),
          //         ],
          //       ),
          //     )
          //         .animate(
          //           onPlay: (controller) => controller.repeat(),
          //         )
          //         .shimmer(
          //           duration: const Duration(seconds: 2),
          //           color: Colors.white.withOpacity(0.2),
          //         ),
          //   ),
          // ),
          // const SizedBox(height: 32),
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
                      horizontalOffset: 50.0,
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
  final width = MediaQuery.of(context).size.width * (isMobile ? 0.7 : 0.5);
  final height = MediaQuery.of(context).size.height * (isMobile ? 0.4 : 0.5);

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
                      ),
                ),
              ],
            ),
          )
              .animate(
                onPlay: (controller) => controller.repeat(),
              )
              .shimmer(
                duration: const Duration(milliseconds: 1500),
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
                      ),
                ),
              ],
            ),
          ),
        );
}
