import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection>
    with TickerProviderStateMixin {
  bool playAnimation = false;
  late AnimationController fadeInAnimation;

  @override
  void initState() {
    super.initState();
    fadeInAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    fadeInAnimation.addListener(() {
      setState(() {
        debugPrint(
            "Animation Value init state ${fadeInAnimation.isAnimating}  ${fadeInAnimation.isCompleted}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> experiences = [];

    for (var i = 1; i < 5; i++) {
      experiences.add(VisibilityDetector(
          key: ValueKey(i),
          onVisibilityChanged: (info) {},
          child: Container(
            width: 200,
            height: 250,
            // padding: const EdgeInsets.all(16),
            // margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6448FE), Color(0xFF5FC6FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Experience $i',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Duration: 2 years',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          )
              // .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .animate()
              .fadeIn(
                begin: 0.5,
                curve: Curves.easeInCubic,
                duration: const Duration(milliseconds: 2000),
                delay: Duration(milliseconds: 500 + (i * 200)),
              )
          // .scaleXY(
          //     begin: 0.8,
          //     end: 1,
          //     curve: Curves.easeInCubic,
          //     duration: const Duration(milliseconds: 2000),
          //     delay: Duration(milliseconds: 500 + (i * 200))),
          ));
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
          VisibilityDetector(
            key: const Key('featured-experience'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.5) {
                setState(() {
                  playAnimation = true;
                });
                debugPrint("Widget visible");
                fadeInAnimation.forward(from: 0);
              } else {
                setState(() {
                  playAnimation = false;
                });
                fadeInAnimation.stop();

                debugPrint("widget invisible");
              }
            },
            child: Animate(
              controller: fadeInAnimation,
              // onPlay: (controller) => playAnimation,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 800),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6448FE), Color(0xFF5FC6FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
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
                      'Senior Developer',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                              ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tech Company Inc.',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white.withOpacity(0.9),
                          ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '2020 - Present',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white.withOpacity(0.8),
                          ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Led development of multiple successful projects using Flutter and React. '
                      'Mentored junior developers and implemented best practices that improved team productivity by 40%.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white.withOpacity(0.9),
                          ),
                    ),
                  ],
                ),
              )
                  .animate(
                      // onPlay: (controller) => controller.repeat(),
                      )
                  .shimmer(
                    duration: const Duration(seconds: 2),
                    color: Colors.white.withOpacity(0.2),
                  ),
            ),
          ),
          const SizedBox(height: 32),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 16,
              children: experiences,
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // void didUpdateWidget(ExperienceSection oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   debugPrint("Did Update Widget");
  //   if (playAnimation) {
  //     debugPrint("Animation being Played");
  //     fadeInAnimation.forward();
  //   } else {
  //     fadeInAnimation.reverse();
  //     debugPrint("Animation being Reversed");
  //   }
  // }
}
