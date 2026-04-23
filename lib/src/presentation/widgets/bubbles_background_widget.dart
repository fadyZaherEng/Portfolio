import 'dart:math';
import 'package:flutter/material.dart';

class BubblesBackgroundWidget extends StatefulWidget {
  final Widget? child;
  final Color? backgroundColor;
  const BubblesBackgroundWidget({super.key, this.child, this.backgroundColor});

  @override
  State<BubblesBackgroundWidget> createState() => _BubblesBackgroundWidgetState();
}

class _BubblesBackgroundWidgetState extends State<BubblesBackgroundWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Bubble> _bubbles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    // Create initial bubbles
    for (int i = 0; i < 60; i++) {
      _bubbles.add(Bubble(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        radius: _random.nextDouble() * 4 + 1,
        speed: _random.nextDouble() * 0.0015 + 0.0005,
        opacity: _random.nextDouble() * 0.2 + 0.05,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      child: Stack(
        children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            _updateBubbles();
            return CustomPaint(
              painter: BubblePainter(bubbles: _bubbles),
              size: Size.infinite,
            );
          },
        ),
        if (widget.child != null) widget.child!,
      ],
    ),);
  }

  void _updateBubbles() {
    for (var bubble in _bubbles) {
      bubble.y -= bubble.speed;
      if (bubble.y < -0.1) {
        bubble.y = 1.1;
        bubble.x = _random.nextDouble();
      }
    }
  }
}

class Bubble {
  double x; // 0.0 to 1.0
  double y; // 0.0 to 1.0
  double radius;
  double speed;
  double opacity;

  Bubble({
    required this.x,
    required this.y,
    required this.radius,
    required this.speed,
    required this.opacity,
  });
}

class BubblePainter extends CustomPainter {
  final List<Bubble> bubbles;

  BubblePainter({required this.bubbles});

  @override
  void paint(Canvas canvas, Size size) {
    for (var bubble in bubbles) {
      final paint = Paint()
        ..color = Colors.white.withOpacity(bubble.opacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(bubble.x * size.width, bubble.y * size.height),
        bubble.radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
