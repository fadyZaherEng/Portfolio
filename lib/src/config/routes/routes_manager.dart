// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/protfolio_screen.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/skills_section_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/training_section_widget.dart';

final GlobalKey<NavigatorState> webNavigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static const String portfolio = "/";
  static const String skillsWeb = "/mySkills";
  static const String trainingWeb = "/myTraining";
}

//mobile router
class RoutesManager {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    print("Mobile routeSettings.name: ${routeSettings.name}");
    switch (routeSettings.name) {
      case Routes.portfolio:
        return _materialRoute(const PortfolioScreen());
      case Routes.trainingWeb:
        return _materialRoute(const TrainingSectionScreen());
      case Routes.skillsWeb:
        return _materialRoute(const SkillsSectionScreen());

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
      builder: (context, state) => const TrainingSectionScreen(),
    ),
    GoRoute(
      path: Routes.skillsWeb,
      name: Routes.skillsWeb,
      builder: (context, state) => const SkillsSectionScreen(),
    ),
  ],
);
