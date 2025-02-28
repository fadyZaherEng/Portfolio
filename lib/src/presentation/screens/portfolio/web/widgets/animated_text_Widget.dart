import 'package:flutter/material.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedTextWebWidget extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const AnimatedTextWebWidget({
    Key? key,
    required this.text,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  _AnimatedTextWebWidgetState createState() => _AnimatedTextWebWidgetState();
}

class _AnimatedTextWebWidgetState extends State<AnimatedTextWebWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.2 && !isVisible) {
      setState(() => isVisible = true);
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.text}${DateTime.now().millisecondsSinceEpoch}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Text(
          widget.text,
          textAlign: widget.textAlign ?? TextAlign.start,
          style: widget.style ??
              Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: ColorSchemes.iconDarkWhite,
                    height: 2,
                    letterSpacing: -0.1,
                  ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
