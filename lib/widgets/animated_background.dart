import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFF8F9FA), Color(0xFFE9ECEF)],
              ),
            ),
          ),
        ),
        ...List.generate(
          20,
          (index) => Positioned(
            left: index * 50.0,
            top: index * 30.0,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.1),
              ),
            )
            .animate(onPlay: (controller) => controller.repeat())
            .moveY(
              duration: Duration(seconds: 2 + index),
              begin: 0,
              end: 100,
              curve: Curves.easeInOut,
            )
            .fadeIn(duration: const Duration(seconds: 1)),
          ),
        ),
      ],
    );
  }
}