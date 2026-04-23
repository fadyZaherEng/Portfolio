import 'dart:math';
import 'package:flutter/material.dart';

class PortfolioBubblesWidget extends StatefulWidget {
  final Widget? child;
  final Color? backgroundColor;
  final bool isDarkMode;

  const PortfolioBubblesWidget({
    super.key,
    this.child,
    this.backgroundColor,
    required this.isDarkMode,
  });

  @override
  State<PortfolioBubblesWidget> createState() => _PortfolioBubblesWidgetState();
}

class _PortfolioBubblesWidgetState extends State<PortfolioBubblesWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Bubble> _bubbles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat();

    // Create more, smaller bubbles for a "special" look
    for (int i = 0; i < 80; i++) {
      _bubbles.add(Bubble(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        radius: _random.nextDouble() * 3.5 + 1, // Slightly larger
        speed: _random.nextDouble() * 0.001 + 0.0003,
        opacity: _random.nextDouble() * 0.4 + 0.1,
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
    // Suit color to theme
    final bubbleColor = widget.isDarkMode 
        ? Colors.white.withOpacity(0.4) 
        : Colors.blue.withOpacity(0.2);

    return Container(
      color: widget.backgroundColor,
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                _updateBubbles();
                return CustomPaint(
                  painter: BubblePainter(
                    bubbles: _bubbles,
                    color: bubbleColor,
                  ),
                );
              },
            ),
          ),
          if (widget.child != null) widget.child!,
        ],
      ),
    );
  }

  void _updateBubbles() {
    for (var bubble in _bubbles) {
      bubble.y -= bubble.speed;
      if (bubble.y < -0.05) {
        bubble.y = 1.05;
        bubble.x = _random.nextDouble();
      }
    }
  }
}

class Bubble {
  double x;
  double y;
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
  final Color color;

  BubblePainter({required this.bubbles, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    for (var bubble in bubbles) {
      final paint = Paint()
        ..color = color.withOpacity(bubble.opacity)
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
