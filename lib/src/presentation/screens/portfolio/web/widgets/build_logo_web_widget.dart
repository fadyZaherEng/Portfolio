import 'dart:math';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class BuildLogoWebWidget extends StatefulWidget {
  final double width;
  final double height;
  final String imagePath;
  final Color? color;

  const BuildLogoWebWidget({
    Key? key,
    this.width = 70,
    this.height = 70,
    required this.imagePath,
    this.color,
  }) : super(key: key);

  @override
  _BuildLogoWebWidgetState createState() => _BuildLogoWebWidgetState();
}

class _BuildLogoWebWidgetState extends State<BuildLogoWebWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _pauseScaleAnimation;
  late Animation<double> _wobbleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.75, curve: Curves.easeInOutCubic),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.92, end: 1.05).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.75, curve: Curves.easeInOut),
      ),
    );

    _pauseScaleAnimation = Tween<double>(begin: 1.05, end: 1.12).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeInOutBack),
        // تكبير أثناء الوقوف
      ),
    );

    _wobbleAnimation = Tween<double>(begin: -0.015, end: 0.015).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.75, curve: Curves.elasticInOut),
      ),
    );
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
      builder: (context, child) {
        double scaleValue = _controller.value > 0.75
            ? _pauseScaleAnimation.value
            : _scaleAnimation.value;

        return Transform.rotate(
          angle: _rotationAnimation.value + _wobbleAnimation.value,
          child: Transform.scale(
            scale: scaleValue,
            child: child,
          ),
        );
      },
      child: Image(
        width: widget.width,
        height: widget.height,
        color: widget.color,
        fit: BoxFit.scaleDown,
        errorBuilder: (context, error, stackTrace) => SkeletonLine(
          style: SkeletonLineStyle(
            height: 70,
            width: 70,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        image: AssetImage(widget.imagePath),
      ),
    );
  }
}
