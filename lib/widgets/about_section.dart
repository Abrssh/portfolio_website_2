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
              child: const Icon(Icons.person, size: 80, color: Colors.purple),
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
                    'Hello, I\'m [Your Name]',
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                isRepeatingAnimation: false,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Full Stack Developer',
              style: Theme.of(context).textTheme.headlineSmall,
            ).animate().fadeIn(delay: const Duration(milliseconds: 500)),
            const SizedBox(height: 24),
            Container(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Text(
                'I\'m a passionate developer with expertise in Flutter, React, and Node.js. '
                'I love creating beautiful and functional applications that solve real-world problems.',
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
