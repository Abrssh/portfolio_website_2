import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Featured Experience Animation'),
        ),
        body: AnimationOnVisibility(),
      ),
    );
  }
}

class AnimationOnVisibility extends StatefulWidget {
  @override
  _AnimationOnVisibilityState createState() => _AnimationOnVisibilityState();
}

class _AnimationOnVisibilityState extends State<AnimationOnVisibility>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleVisibility(VisibilityInfo info) {
    var visibleFraction = info.visibleFraction;
    if (visibleFraction > 0) {
      _controller.forward(from: 0); // Restart the animation
    } else {
      _controller.stop(); // Optionally stop the animation
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('animation_key'),
      onVisibilityChanged: _handleVisibility,
      child: FadeTransition(
        opacity: _animation,
        child: Container(
          width: 300,
          height: 200,
          margin: EdgeInsets.only(top: 200),
          color: Colors.lightBlue,
          child: Center(
            child: Text(
              'Featured Experience Animation',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
