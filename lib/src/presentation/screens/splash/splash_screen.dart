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
    await Future.delayed(const Duration(milliseconds: 2500));
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

        final Color startColor = isDarkMode 
            ? const Color(0xFF0F0C29) 
            : ColorSchemes.white;
        final Color midColor = isDarkMode 
            ? const Color(0xFF302B63) 
            : ColorSchemes.white.withOpacity(0.9);
        final Color endColor = isDarkMode 
            ? const Color(0xFF24243E) 
            : ColorSchemes.white;

        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [startColor, midColor, endColor],
              ),
            ),
            child: Stack(
              children: [
                // Decorative background blurs with drift animation
                Positioned(
                  top: -100,
                  right: -100,
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorSchemes.secondary.withOpacity(isDarkMode ? 0.12 : 0.04),
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 2000.ms)
                  .scale(begin: const Offset(0.5, 0.5), end: const Offset(1, 1))
                  .animate(onPlay: (controller) => controller.repeat(reverse: true))
                  .move(begin: const Offset(-20, -20), end: const Offset(20, 20), duration: 8.seconds, curve: Curves.easeInOut),
                ),
                Positioned(
                  bottom: -150,
                  left: -100,
                  child: Container(
                    width: 350,
                    height: 350,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorSchemes.primary.withOpacity(isDarkMode ? 0.15 : 0.04),
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 2000.ms, delay: 500.ms)
                  .scale(begin: const Offset(0.5, 0.5), end: const Offset(1, 1))
                  .animate(onPlay: (controller) => controller.repeat(reverse: true))
                  .move(begin: const Offset(30, 30), end: const Offset(-30, -30), duration: 10.seconds, curve: Curves.easeInOut),
                ),

                PortfolioBubblesWidget(
                  isDarkMode: isDarkMode,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Container(
                          padding: const EdgeInsets.all(40),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: isDarkMode 
                                ? Colors.white.withOpacity(0.04) 
                                : Colors.black.withOpacity(0.02),
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: isDarkMode 
                                  ? Colors.white.withOpacity(0.08) 
                                  : Colors.black.withOpacity(0.04),
                              width: 1.2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 40,
                                offset: const Offset(0, 15),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: ColorSchemes.secondary.withOpacity(0.4),
                                    width: 3,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorSchemes.secondary.withOpacity(0.2),
                                      blurRadius: 20,
                                      spreadRadius: 5,
                                    ),
                                  ],
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    ImagePaths.fady,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        Container(
                                      color: Colors.grey.shade200,
                                      child: const Icon(
                                        Icons.person,
                                        size: 100,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                                  .animate()
                                  .scale(
                                    duration: 1500.ms,
                                    curve: Curves.elasticOut,
                                    begin: const Offset(0.0, 0.0),
                                    end: const Offset(1, 1),
                                  )
                                  .rotate(begin: -0.1, end: 0, duration: 1500.ms, curve: Curves.elasticOut)
                                  .fadeIn(duration: 800.ms)
                                  .shimmer(
                                    delay: 1500.ms,
                                    duration: 1500.ms,
                                    color: Colors.white24,
                                  )
                                  .animate(onPlay: (controller) => controller.repeat(reverse: true))
                                  .moveY(begin: -8, end: 8, duration: 2500.ms, curve: Curves.easeInOut),
                              
                              const SizedBox(height: 40),
                              
                              Text(
                                S.of(context).fadyZaherSoftwareEngineer,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: isDarkMode ? Colors.white : ColorSchemes.primary,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: const Offset(0, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                              )
                                  .animate()
                                  .fadeIn(delay: 1000.ms, duration: 1000.ms)
                                  .slideY(begin: 0.2, end: 0, curve: Curves.easeOutCubic)
                                  .blur(begin: const Offset(15, 15), end: const Offset(0, 0), duration: 1200.ms, delay: 1000.ms),
                              
                              const SizedBox(height: 15),
                              
                              Container(
                                width: 80,
                                height: 4,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      ColorSchemes.secondary,
                                      ColorSchemes.secondary.withOpacity(0.3),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ).animate().scaleX(
                                    delay: 1800.ms,
                                    duration: 800.ms,
                                    begin: 0,
                                    end: 1,
                                    curve: Curves.easeInOutBack,
                                  ),
                            ],
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 1200.ms, delay: 400.ms)
                        .slideY(begin: 0.15, end: 0, duration: 1200.ms, curve: Curves.easeOutCubic),
                        
                        const SizedBox(height: 60),
                        
                        // Sleek Progress Indicator with Glow
                        Animate(
                          onPlay: (controller) => controller.repeat(reverse: true),
                        ).custom(
                          duration: 1500.ms,
                          builder: (context, value, child) => Container(
                            width: 200,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: ColorSchemes.secondary.withOpacity(0.2 * value),
                                  blurRadius: 20 * value,
                                  spreadRadius: 2 * value,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: TweenAnimationBuilder<double>(
                                    duration: const Duration(milliseconds: 2500),
                                    tween: Tween(begin: 0.0, end: 1.0),
                                    builder: (context, value, child) {
                                      return LinearProgressIndicator(
                                        value: value,
                                        minHeight: 5,
                                        backgroundColor: isDarkMode 
                                            ? Colors.white.withOpacity(0.08) 
                                            : Colors.black.withOpacity(0.04),
                                        valueColor: const AlwaysStoppedAnimation<Color>(ColorSchemes.secondary),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  "INITIALIZING...",
                                  style: TextStyle(
                                    color: (isDarkMode ? Colors.white : ColorSchemes.primary).withOpacity(0.6),
                                    fontSize: 10,
                                    letterSpacing: 4,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ).animate().fadeIn(delay: 2000.ms).shimmer(duration: 2000.ms),
                              ],
                            ),
                          ),
                        ).animate().fadeIn(delay: 1500.ms),
                      ],
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
}
