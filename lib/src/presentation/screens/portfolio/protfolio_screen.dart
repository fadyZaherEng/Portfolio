import 'package:flutter/material.dart';
import 'package:my_portfolio/src/core/base/widget/base_stateful_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/mobile/protfolio_mobile_screen.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/protfolio_web_screen.dart';
import 'package:my_portfolio/src/presentation/screens/splash/splash_screen.dart';

class PortfolioScreen extends BaseStatefulWidget {
  const PortfolioScreen({super.key});

  @override
  BaseState<PortfolioScreen> baseCreateState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends BaseState<PortfolioScreen> {
  bool _showSplash = true;

  @override
  Widget baseBuild(BuildContext context) {
    final Widget mainContent = MediaQuery.of(context).size.width > 1300
        ? const PortfolioWebScreen(key: ValueKey('web_portfolio'))
        : const PortfolioMobileScreen(key: ValueKey('mobile_portfolio'));

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 700),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: _showSplash
          ? SplashScreen(
              key: const ValueKey('splash_screen'),
              onFinish: () {
                if (mounted) {
                  setState(() {
                    _showSplash = false;
                  });
                }
              },
            )
          : mainContent,
    );
  }
}
