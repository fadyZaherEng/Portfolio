import 'package:flutter/material.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';

class ScrollToTopButtonWidget extends StatefulWidget {
  final void Function() onTap;

  const ScrollToTopButtonWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  _ScrollToTopButtonWidgetState createState() =>
      _ScrollToTopButtonWidgetState();
}

class _ScrollToTopButtonWidgetState extends State<ScrollToTopButtonWidget>
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
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorSchemes.secondary,
              ColorSchemes.iconBackGround,
              ColorSchemes.primary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
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
                  size: 20,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
