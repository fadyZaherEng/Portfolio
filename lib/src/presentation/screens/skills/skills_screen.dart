import 'package:flutter/material.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/routes/routes_manager.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/presentation/blocs/portfolio/portfolio_bloc.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/Mobile/widgets/bounce_and_scale_text_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/Mobile/widgets/custom_app_bar_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/Mobile/widgets/web_circle_painter_button_scroll.dart';
import 'package:my_portfolio/src/presentation/screens/skills/widgets/build_skill_row_widget.dart';
import 'package:my_portfolio/src/presentation/widgets/restart_widget.dart';
import 'package:universal_html/html.dart' as html;

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  bool isDarkMode = false;

  String currentLocale = 'en';

  double _scrollPercentage = 0;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final ScrollController _scrollController = ScrollController();

  PortfolioBloc get _bloc => BlocProvider.of<PortfolioBloc>(context);

  @override
  void initState() {
    _bloc.add(PortfolioGetThemeEvent());
    _bloc.add(PortfolioGetLanguageEvent());
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollPercentage = _scrollController.position.pixels /
            _scrollController.position.maxScrollExtent;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PortfolioBloc, PortfolioState>(
      listener: (context, state) {
        if (state is PortfolioGetThemeState) {
          isDarkMode = state.isDark;
        } else if (state is PortfolioGetLanguageState) {
          currentLocale = state.locale.languageCode;
        } else if (state is PortfolioChangeThemeState) {
          isDarkMode = state.theme == Constants.dark;
          RestartWidget.restartApp(context);
          html.window.location.reload();
        } else if (state is PortfolioChangeLanguageState) {
          currentLocale = state.locale.languageCode;
          RestartWidget.restartApp(context);
          html.window.location.reload();
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            context.go(Routes.portfolio);
            RestartWidget.restartApp(context);
            return false;
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor:
                isDarkMode ? ColorSchemes.iconBackGround : Colors.white,
            appBar: CustomAppBarWidget(
              isBack: true,
              onBackTap: () {
                context.go(Routes.portfolio);
                RestartWidget.restartApp(context);
              },
              onLogoTap: () {
                RestartWidget.restartApp(context);
                context.go(Routes.portfolio);
              },
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  SingleChildScrollView(
                    controller: _scrollController,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TweenAnimationBuilder<double>(
                            duration: const Duration(seconds: 1),
                            tween: Tween(begin: 0, end: 1),
                            builder: (context, value, child) {
                              return Opacity(
                                opacity: value,
                                child: Transform.translate(
                                  offset: Offset(0, (1 - value) * 20),
                                  child: child,
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  ImagePaths.skills,
                                  color: ColorSchemes.iconDarkWhite,
                                  matchTextDirection: true,
                                  width: 22,
                                  height: 22,
                                ),
                                const SizedBox(width: 10),
                                BouncingAndScalingTextWidget(
                                  title: S.of(context).skills,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: ColorSchemes.iconDarkWhite,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Directionality(
                            textDirection: TextDirection.ltr,
                            child: BuildSkillsWidget(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Circular Percentage Indicator
                  Visibility(
                    visible: _scrollPercentage > 0 && _scrollPercentage < 0.95,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: CustomPaint(
                        size: const Size(30, 30),
                        painter: CircularPainter(percentage: _scrollPercentage),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
