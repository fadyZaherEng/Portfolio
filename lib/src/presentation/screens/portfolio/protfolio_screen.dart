import 'package:flutter/material.dart';
import 'package:my_portfolio/src/core/base/widget/base_stateful_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/mobile/protfolio_mobile_screen.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/protfolio_web_screen.dart';

class PortfolioScreen extends BaseStatefulWidget {
  const PortfolioScreen({super.key});

  @override
  BaseState<PortfolioScreen> baseCreateState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends BaseState<PortfolioScreen> {
  @override
  Widget baseBuild(BuildContext context) {
    return MediaQuery.of(context).size.width > 850
        ? const PortfolioWebScreen()
        : const PortfolioMobileScreen();
  }
}
