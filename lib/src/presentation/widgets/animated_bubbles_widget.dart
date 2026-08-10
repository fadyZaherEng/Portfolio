import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/di/data_layer_injector.dart';
import 'package:my_portfolio/src/domain/usecase/get_theme_use_case.dart';

/// Animated floating bubbles background — renders behind page content.
class AnimatedBubblesWidget extends StatefulWidget {
  const AnimatedBubblesWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedBubblesWidget> createState() => _AnimatedBubblesWidgetState();
}

class _AnimatedBubblesWidgetState extends State<AnimatedBubblesWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<_Bubble> _bubbles;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();

    _bubbles = List.generate(18, (i) => _Bubble.random(_random, i));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final theme = GetThemeUseCase(injector())();
        return CustomPaint(
          painter: _BubblesPainter(
            bubbles: _bubbles,
            progress: _controller.value,
            theme: theme,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class _Bubble {
  final double xFraction;   // 0..1 horizontal position
  final double size;        // radius px
  final double speed;       // fraction of screen per cycle
  final double phase;       // start offset in cycle 0..1
  final double wobble;      // horizontal wobble amplitude

  _Bubble({
    required this.xFraction,
    required this.size,
    required this.speed,
    required this.phase,
    required this.wobble,
  });

  factory _Bubble.random(Random r, int seed) {
    return _Bubble(
      xFraction: r.nextDouble(),
      size: 4 + r.nextDouble() * 8, // larger, softer bubbles (4‑12px)
      speed: 0.2 + r.nextDouble() * 0.3, // gentle rise speed (0.2‑0.5)
      phase: r.nextDouble(),
      wobble: 0.005 + r.nextDouble() * 0.015, // subtle horizontal wobble
    );
  }
}

class _BubblesPainter extends CustomPainter {
  final List<_Bubble> bubbles;
  final double progress;
  final String theme;

  _BubblesPainter({
    required this.bubbles,
    required this.progress,
    required this.theme,
  });

  Color get _accentColor {
    if (theme == Constants.newDark) {
      return ColorSchemes.newDarkAccent;        // electric mint
    } else if (theme == Constants.dark) {
      return const Color(0xFFF39A4A);           // amber for dark
    } else {
      return ColorSchemes.lightPrimary;         // violet for light
    }
  }

  Color get _glowColor {
    if (theme == Constants.newDark) {
      return ColorSchemes.newDarkAccentSecond;  // soft violet glow
    } else if (theme == Constants.dark) {
      return const Color(0xFF6C5CE7);           // purple glow
    } else {
      return ColorSchemes.lightAccent;          // amber glow
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (final b in bubbles) {
      // y rises from bottom to top over the bubble's speed cycle
      final cycleProgress = ((progress * b.speed + b.phase) % 1.0);
      final y = size.height * (1.0 - cycleProgress);

      // Horizontal wobble using sine
      final wobbleX = sin(cycleProgress * pi * 4 + b.phase * pi * 2) * size.width * b.wobble;
      final x = size.width * b.xFraction + wobbleX;

      // Fade in at bottom, fade out at top
      final double opacity = cycleProgress < 0.1
          ? cycleProgress / 0.1
          : cycleProgress > 0.8
              ? (1.0 - cycleProgress) / 0.2
              : 1.0;

      // Alternate between accent and glow color
      final useGlow = (bubbles.indexOf(b) % 3 == 0);
      final baseColor = useGlow ? _glowColor : _accentColor;

      // Outer glow ring
      final glowPaint = Paint()
        ..shader = RadialGradient(
          colors: [
            baseColor.withOpacity(0.15 * opacity),
            Colors.transparent,
          ],
          stops: const [0.0, 1.0],
        ).createShader(Rect.fromCircle(center: Offset(x, y), radius: b.size * 3))
        ..style = PaintingStyle.fill
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);
      canvas.drawCircle(Offset(x, y), b.size * 2, glowPaint);

      // Solid bubble body with gradient (closed shape)
      final bubblePaint = Paint()
        ..shader = RadialGradient(
          colors: [
            baseColor.withOpacity(0.6 * opacity),
            baseColor.withOpacity(0.2 * opacity),
          ],
          stops: const [0.0, 1.0],
        ).createShader(Rect.fromCircle(center: Offset(x, y), radius: b.size))
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(x, y), b.size, bubblePaint);

      // Highlight glint (top‑left of bubble)
      final glintPaint = Paint()
        ..color = Colors.white.withOpacity(0.25 * opacity)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(
        Offset(x - b.size * 0.28, y - b.size * 0.28),
        b.size * 0.22,
        glintPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _BubblesPainter old) =>
      old.progress != progress || old.theme != theme;
}
