import 'package:flutter/material.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';

class ScrollToTopButtonWebWidget extends StatefulWidget {
  final void Function() onTap;

  const ScrollToTopButtonWebWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  _ScrollToTopButtonWebWidgetState createState() =>
      _ScrollToTopButtonWebWidgetState();
}

class _ScrollToTopButtonWebWidgetState extends State<ScrollToTopButtonWebWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorSchemes.secondary.withOpacity(0.8),
              ColorSchemes.iconBackGround,
              ColorSchemes.primary.withOpacity(0.8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          shape: BoxShape.circle,
          color: ColorSchemes.primarySecondary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, -_animation.value),
                child: const Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
