import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/src/config/routes/routes_manager.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/protfolio_screen.dart';

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
        // استخدام Navigator.of(context) للتأكد من الوصول للملاح الصحيح
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.portfolio,
          (route) => false,
        );
      }
    } catch (e) {
      // Fallback في حالة حدوث أي خطأ في الـ Router
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const PortfolioScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorSchemes.iconBackGround,
              const Color(0xFF000010),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/fadyy.png",
                    fit: BoxFit.cover,
                  ),
                ),
              )
                  .animate()
                  .scale(
                    duration: 1000.ms,
                    curve: Curves.fastOutSlowIn,
                    begin: const Offset(0, 0),
                    end: const Offset(1, 1),
                  )
                  .fadeIn(duration: 1000.ms)
                  .shimmer(
                    delay: 1200.ms,
                    duration: 1500.ms,
                    color: Colors.white24,
                  ),
              const SizedBox(height: 30),
              const Text(
                "Fady Zaher",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              )
                  .animate()
                  .fadeIn(delay: 500.ms, duration: 800.ms)
                  .slideY(begin: 0.5, end: 0, curve: Curves.easeOutBack),
              const SizedBox(height: 10),
              Container(
                width: 100,
                height: 3,
                decoration: BoxDecoration(
                  color: ColorSchemes.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
              )
                  .animate()
                  .scaleX(delay: 1000.ms, duration: 600.ms, begin: 0, end: 1),
            ],
          ),
        ),
      ),
    );
  }
}
