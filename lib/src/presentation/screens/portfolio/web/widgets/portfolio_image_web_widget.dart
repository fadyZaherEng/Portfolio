import 'package:flutter/material.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';

class PortfolioImageWebWidget extends StatefulWidget {
  const PortfolioImageWebWidget({Key? key}) : super(key: key);

  @override
  _PortfolioImageWebWidgetState createState() =>
      _PortfolioImageWebWidgetState();
}

class _PortfolioImageWebWidgetState extends State<PortfolioImageWebWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
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
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: SlideTransition(
              position: _slideAnimation,
              child: SizedBox(
                height: 350,
                width: 350,
                child: _buildImageWidget(context),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageWidget(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background pulsing glow aura
          const PulsingCircleWidget(),

          // Glowing Outer Border Container
          Container(
            width: 310,
            height: 310,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  ColorSchemes.primary,
                  ColorSchemes.primarySecondary,
                  Colors.cyanAccent,
                  ColorSchemes.primary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorSchemes.primary.withOpacity(0.45),
                  blurRadius: 25,
                  spreadRadius: 4,
                ),
                BoxShadow(
                  color: Colors.cyanAccent.withOpacity(0.25),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorSchemes.iconBackGround,
              ),
              child: ClipOval(
                child: Image.asset(
                  ImagePaths.fadySplash,
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                  alignment: const Alignment(0, -0.65), // Perfect face framing
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      ImagePaths.fady,
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                      alignment: const Alignment(0, -0.65),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PulsingCircleWidget extends StatefulWidget {
  const PulsingCircleWidget({Key? key}) : super(key: key);

  @override
  _PulsingCircleWidgetState createState() => _PulsingCircleWidgetState();
}

class _PulsingCircleWidgetState extends State<PulsingCircleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
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
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: 330,
            height: 330,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorSchemes.primarySecondary.withOpacity(0.35),
                width: 2,
              ),
            ),
          ),
        );
      },
    );
  }
}
