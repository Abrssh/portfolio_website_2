import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.deepPurple.withOpacity(0.2),
              // child: const Icon(Icons.person, size: 80, color: Colors.purple),
              child: Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset("images/personal_pic.JPG"),
                ),
              ),
            ).animate().scale().fadeIn(),
            const SizedBox(height: 24),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Hello, I\'m Abrham Daniel',
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                isRepeatingAnimation: false,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Full Stack Mobile Developer',
              style: Theme.of(context).textTheme.headlineSmall,
            ).animate().fadeIn(delay: const Duration(milliseconds: 500)),
            const SizedBox(height: 24),
            Container(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Text(
                // 'My expertise lies in Flutter and Firebase. '
                // 'I\'m a fast learner and highly passionate about refining my skills and delivering top-quality work. My ability to work on both frontend and backend systems, coupled with my experience in diverse projects, makes me confident that I can be a valuable asset to any team.',
                "I'm a passionate developer with expertise in Flutter and Firebase. I enjoy creating quality systems while maintaining a balance between UI and UX and have actually worked on projects that address real-world problems.",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ).animate().fadeIn(delay: const Duration(milliseconds: 1000)),
          ],
        ),
      ),
    );
  }
}
