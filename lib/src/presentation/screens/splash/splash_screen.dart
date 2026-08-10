import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/presentation/widgets/animated_bubbles_widget.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onFinish;

  const SplashScreen({
    super.key,
    required this.onFinish,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    Timer(const Duration(milliseconds: 2400), () {
      if (mounted) {
        widget.onFinish();
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemes.iconBackGround,
      body: Stack(
        children: [
          // Background Bubbles Animation
          const Positioned.fill(
            child: AnimatedBubblesWidget(),
          ),

          // Center Splash Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Glowing Avatar with user's uploaded image
                AnimatedBuilder(
                  animation: _pulseController,
                  builder: (context, child) {
                    final pulseValue = _pulseController.value;
                    return Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            ColorSchemes.primary,
                            ColorSchemes.primarySecondary,
                            Colors.cyanAccent,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: ColorSchemes.primary.withOpacity(0.5 + (pulseValue * 0.4)),
                            blurRadius: 30 + (pulseValue * 15),
                            spreadRadius: 6 + (pulseValue * 4),
                          ),
                        ],
                      ),
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black26,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            ImagePaths.fadySplash,
                            width: 160,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                )
                    .animate()
                    .scale(
                      duration: 800.ms,
                      curve: Curves.easeOutBack,
                      begin: const Offset(0.3, 0.3),
                      end: const Offset(1.0, 1.0),
                    )
                    .fadeIn(duration: 600.ms),

                const SizedBox(height: 28),

                // Developer Name
                Text(
                  "Fady Zaher",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: ColorSchemes.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        shadows: [
                          Shadow(
                            color: ColorSchemes.primary.withOpacity(0.8),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                )
                    .animate()
                    .fadeIn(delay: 400.ms, duration: 600.ms)
                    .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut),

                const SizedBox(height: 8),

                // Title / Role
                Text(
                  "Software Engineer | Senior Flutter Developer",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: ColorSchemes.primarySecondaryWhite.withOpacity(0.9),
                        letterSpacing: 1.1,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(delay: 600.ms, duration: 600.ms)
                    .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut),

                const SizedBox(height: 36),

                // Smooth Progress Line
                SizedBox(
                  width: 140,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.white12,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        ColorSchemes.primarySecondary,
                      ),
                      minHeight: 3,
                    ),
                  ),
                )
                    .animate()
                    .fadeIn(delay: 800.ms, duration: 400.ms),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
