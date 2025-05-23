// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/protfolio_screen.dart';
import 'package:my_portfolio/src/presentation/screens/skills/skills_screen.dart';
import 'package:my_portfolio/src/presentation/screens/touch_me/touch_me_screen.dart';
import 'package:my_portfolio/src/presentation/screens/training/training_screen.dart';

final GlobalKey<NavigatorState> webNavigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static const String portfolio = "/";
  static const String skillsWeb = "/mySkills";
  static const String trainingWeb = "/myTraining";
  static const String touchMe = "/touchMe";
}

//mobile router
class RoutesManager {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    print("Mobile routeSettings.name: ${routeSettings.name}");
    switch (routeSettings.name) {
      case Routes.portfolio:
        return _materialRoute(const PortfolioScreen());
      case Routes.trainingWeb:
        return _materialRoute(const TrainingScreen());
      case Routes.skillsWeb:
        return _materialRoute(const SkillsScreen());
      case Routes.touchMe:
        return _materialRoute(const TouchMeScreen());
      default:
        return _materialRoute(const PortfolioScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route<dynamic> unDefinedRoute(String name) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Not found")),
        body: Center(
          child: Text(name),
        ),
      ),
    );
  }
}

//web router
final GoRouter webRouter = GoRouter(
  initialLocation: Routes.portfolio,
  debugLogDiagnostics: true,
  navigatorKey: webNavigatorKey,
  observers: [routeObserver],
  routes: [
    GoRoute(
      path: Routes.portfolio,
      name: Routes.portfolio,
      builder: (context, state) => const PortfolioScreen(),
    ),
    GoRoute(
      path: Routes.trainingWeb,
      name: Routes.trainingWeb,
      builder: (context, state) => const TrainingScreen(),
    ),
    GoRoute(
      path: Routes.skillsWeb,
      name: Routes.skillsWeb,
      builder: (context, state) => const SkillsScreen(),
    ),
    GoRoute(
      path: Routes.touchMe,
      name: Routes.touchMe,
      builder: (context, state) => const TouchMeScreen(),
    ),
  ],
);
