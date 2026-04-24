import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/routes/routes_manager.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/di/data_layer_injector.dart';
import 'package:my_portfolio/src/domain/usecase/get_theme_use_case.dart';
import 'package:my_portfolio/src/presentation/blocs/portfolio/portfolio_bloc.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/protfolio_screen.dart';
import 'package:my_portfolio/src/presentation/widgets/portfolio_bubbles_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 4500));
    if (!mounted) return;

    try {
      if (kIsWeb) {
        context.go(Routes.portfolio);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.portfolio,
          (route) => false,
        );
      }
    } catch (e) {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const PortfolioScreen()),
        );
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage(ImagePaths.fady), context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        bool isDarkMode = GetThemeUseCase(injector())() == Constants.dark;
        if (state is PortfolioGetThemeState) {
          isDarkMode = state.isDark;
        } else if (state is PortfolioChangeThemeState) {
          isDarkMode = state.theme == Constants.dark;
        }

        final Color startColor =
            isDarkMode ? const Color(0xFF02001A) : const Color(0xFFF0F2F5);
        final Color midColor =
            isDarkMode ? const Color(0xFF050530) : const Color(0xFFE6E9EF);
        final Color endColor =
            isDarkMode ? const Color(0xFF020015) : const Color(0xFFFFFFFF);

        return Scaffold(
          body: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [startColor, midColor, endColor],
              ),
            ),
            child: Stack(
              children: [
                // 1. Mesh Background - Liquid Blurs
                ..._buildMeshBackground(isDarkMode),

                // 2. Interactive Sparkle Layer
                const _SparkleLayer(),

                PortfolioBubblesWidget(
                  isDarkMode: isDarkMode,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 3. 3D Glassmorphic Card
                          TweenAnimationBuilder<double>(
                            duration: 2000.ms,
                            curve: Curves.easeOutBack,
                            tween: Tween(begin: 1.0, end: 0.0),
                            builder: (context, value, child) {
                              return Transform(
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.001) // perspective
                                  ..rotateX(value * 0.3)
                                  ..rotateY(value * 0.2),
                                alignment: Alignment.center,
                                child: child,
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 60, horizontal: 40),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? Colors.white.withOpacity(0.03)
                                    : Colors.white.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: isDarkMode
                                      ? Colors.white.withOpacity(0.1)
                                      : Colors.white.withOpacity(0.6),
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(isDarkMode ? 0.4 : 0.1),
                                    blurRadius: 40,
                                    spreadRadius: -10,
                                    offset: const Offset(0, 20),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  // 4. Energy Ring + Avatar
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      // Energy Ring
                                      Container(
                                        width: 210,
                                        height: 210,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: SweepGradient(
                                            colors: [
                                              Colors.transparent,
                                              ColorSchemes.secondary
                                                  .withOpacity(0.5),
                                              ColorSchemes.secondary,
                                              Colors.transparent,
                                            ],
                                          ),
                                        ),
                                      )
                                          .animate(onPlay: (c) => c.repeat())
                                          .rotate(
                                              duration: 3.seconds,
                                              curve: Curves.linear),

                                      // Inner Glow
                                      Container(
                                        width: 190,
                                        height: 190,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: ColorSchemes.secondary
                                                  .withOpacity(0.3),
                                              blurRadius: 30,
                                              spreadRadius: 10,
                                            ),
                                          ],
                                        ),
                                      ),

                                      // The Image
                                      Container(
                                        width: 180,
                                        height: 180,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: ClipOval(
                                          child: Image.asset(
                                            ImagePaths.fady,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    const Icon(Icons.person,
                                                        size: 100),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                      .animate()
                                      .scale(
                                          duration: 1200.ms,
                                          curve: Curves.elasticOut,
                                          begin: const Offset(0.5, 0.5))
                                      .fadeIn(duration: 800.ms)
                                      .animate(
                                          onPlay: (c) =>
                                              c.repeat(reverse: true))
                                      .moveY(
                                          begin: -10,
                                          end: 10,
                                          duration: 4000.ms,
                                          curve: Curves.easeInOut),

                                  const SizedBox(height: 50),

                                  // 5. Title with Character Spacing Animation
                                  Text(
                                    S.of(context).fadyZaherSoftwareEngineer,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: isDarkMode
                                          ? Colors.white
                                          : ColorSchemes.primary,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 2,
                                      height: 1.2,
                                    ),
                                  )
                                      .animate()
                                        .fadeIn(delay: 400.ms, duration: 1000.ms)
                                      .slideY(
                                          begin: 0.2,
                                          end: 0,
                                          curve: Curves.easeOutCirc)
                                      .shimmer(
                                          delay: 2000.ms,
                                          duration: 4000.ms,
                                          color: Colors.white30),

                                  const SizedBox(height: 20),

                                  // Animated Divider with Gradient
                                  Container(
                                    width: 100,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                        colors: [
                                          ColorSchemes.secondary,
                                          ColorSchemes.primary,
                                        ],
                                      ),
                                    ),
                                  ).animate().scaleX(
                                        delay: 800.ms,
                                        duration: 800.ms,
                                      curve: Curves.easeInOutBack),
                                ],
                              ),
                            )
                                .animate()
                                .fadeIn(duration: 1200.ms)
                                .slideY(begin: 0.1, end: 0),
                          ),

                          const SizedBox(height: 80),

                          // 6. High-End Progress Section
                          Column(
                            children: [
                              Container(
                                width: 240,
                                height: 8,
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isDarkMode
                                      ? Colors.white10
                                      : Colors.black12,
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.05)),
                                ),
                                child: TweenAnimationBuilder<double>(
                                  duration: 4000.ms,
                                  tween: Tween(begin: 0.0, end: 1.0),
                                  builder: (context, value, _) {
                                    return Stack(
                                      children: [
                                        // Main Progress
                                        Container(
                                          width: 236 * value,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              colors: [
                                                ColorSchemes.secondary
                                                    .withOpacity(0.5),
                                                ColorSchemes.secondary,
                                              ],
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: ColorSchemes.secondary
                                                    .withOpacity(0.5),
                                                blurRadius: 10,
                                                offset: const Offset(0, 0),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // "Flow" effect
                                        Positioned(
                                          left: (236 * value) - 20,
                                          child: Container(
                                            width: 20,
                                            height: 4,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                  blurRadius: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              )
                                  .animate()
                                    .fadeIn(delay: 1000.ms)
                                  .scale(begin: const Offset(0.8, 1)),
                              const SizedBox(height: 15),
                              Text(
                                "SYSTEM ENGINE ACTIVATED",
                                style: TextStyle(
                                  color: (isDarkMode
                                          ? Colors.white
                                          : ColorSchemes.primary)
                                      .withOpacity(0.4),
                                  fontSize: 10,
                                  letterSpacing: 5,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                                  .animate()
                                  .fadeIn(delay: 1400.ms)
                                  .shimmer(duration: 3.seconds),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildMeshBackground(bool isDarkMode) {
    return [
      _PositionedBlur(
        color: const Color(0xFF6366F1).withOpacity(isDarkMode ? 0.2 : 0.1),
        size: 500,
        top: -150,
        left: -150,
        duration: 8.seconds,
        offset: const Offset(50, 50),
      ),
      _PositionedBlur(
        color: const Color(0xFFA855F7).withOpacity(isDarkMode ? 0.15 : 0.08),
        size: 400,
        bottom: -100,
        right: -100,
        duration: 10.seconds,
        offset: const Offset(-60, -40),
      ),
      _PositionedBlur(
        color: const Color(0xFFEC4899).withOpacity(isDarkMode ? 0.1 : 0.05),
        size: 300,
        top: 200,
        right: -50,
        duration: 12.seconds,
        offset: const Offset(-40, 60),
      ),
    ];
  }
}

class _PositionedBlur extends StatelessWidget {
  final Color color;
  final double size;
  final double? top, left, right, bottom;
  final Duration duration;
  final Offset offset;

  const _PositionedBlur({
    required this.color,
    required this.size,
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.duration,
    required this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      )
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .move(
              begin: Offset.zero,
              end: offset,
              duration: duration,
              curve: Curves.easeInOut)
          .blur(begin: const Offset(80, 80), end: const Offset(100, 100)),
    );
  }
}

class _SparkleLayer extends StatelessWidget {
  const _SparkleLayer();

  @override
  Widget build(BuildContext context) {
    return Animate(
      onPlay: (c) => c.repeat(),
    ).custom(
      duration: 10.seconds,
      builder: (context, value, child) {
        return CustomPaint(
          size: Size.infinite,
          painter: _SparklePainter(value),
        );
      },
    );
  }
}

class _SparklePainter extends CustomPainter {
  final double progress;

  _SparklePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final random = DateTime.now().millisecondsSinceEpoch ~/ 100;
    final paint = Paint()..color = Colors.white.withOpacity(0.3);

    for (int i = 0; i < 30; i++) {
      final x = (i * 137.5 + progress * 100) % size.width;
      final y = (i * 245.7 - progress * 50) % size.height;
      final radius = (i % 3 + 1).toDouble();

      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
