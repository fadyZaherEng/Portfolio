import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/routes/routes_manager.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/presentation/blocs/portfolio/portfolio_bloc.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/protfolio_screen.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/custom_app_bar_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/my_chapters_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/web_circle_painter_button_scroll.dart';
import 'package:my_portfolio/src/presentation/widgets/restart_widget.dart';
import 'package:universal_html/html.dart' as html;

class SkillsSectionScreen extends StatefulWidget {
  const SkillsSectionScreen({super.key});

  @override
  State<SkillsSectionScreen> createState() => _SkillsSectionScreenState();
}

class _SkillsSectionScreenState extends State<SkillsSectionScreen> {
  bool isDarkMode = false;

  String currentLocale = 'en';

  double _scrollPercentage = 0;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final ScrollController _scrollController = ScrollController();

  PortfolioBloc get _bloc => BlocProvider.of<PortfolioBloc>(context);
  Map<String, double> skills = {};

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
    _dummySkills();
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
                                BouncingAndScalingText(
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
                          Column(
                            children: skills.entries.map(
                              (entry) {
                                return TweenAnimationBuilder<double>(
                                    duration: const Duration(milliseconds: 800),
                                    tween: Tween(begin: 0, end: 1),
                                    builder: (context, value, child) {
                                      return Opacity(
                                        opacity: value,
                                        child: Transform.translate(
                                          offset: Offset((1 - value) * 50, 0),
                                          // يتحرك من اليمين لليسار
                                          child: child,
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              entry.key,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color:
                                                    ColorSchemes.primaryWhite,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8,
                                            ),
                                            child:
                                                TweenAnimationBuilder<double>(
                                              duration:
                                                  const Duration(seconds: 2),
                                              tween: Tween(
                                                  begin: 0.0, end: entry.value),
                                              builder: (context, value, child) {
                                                return Stack(
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.3,
                                                      height: 8,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Colors
                                                            .grey.shade300,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.3 *
                                                          value,
                                                      height: 8,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: ColorSchemes
                                                            .primarySecondary,
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ));
                              },
                            ).toList(),
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

  void _dummySkills() {
    skills = {
      "Flutter": 0.9,
      "Database & Data Structures": 0.9,
      "OOP & Problem Solving": 0.9,
      "Design Patterns & SOLID Principles": 0.85,
      "Algorithms": 0.85,
      "C Plus Plus": 0.9,
      "Dart": 0.9,
      "C Sharp": 0.85,
      "Java": 0.85,
      "Python": 0.75,
      "Kotlin": 0.75,
      "SQL / MySQL": 0.75,
      "Operating Systems": 0.8,
      "Computer Architecture": 0.8,
      "Data Mining & Big Data": 0.7,
      "Machine Learning (Basic)": 0.6,
      "Deep Learning (Basic)": 0.6,
      "Software Engineering": 0.8,
      "Security  ": 0.75,
      "Agile Development": 0.8,
      "Postman & Mock Lab": 0.75,
      "SEO Knowledge": 0.65,
      "Version Control  ": 0.85,
      "Jira  ": 0.75,
      "Firebase": 0.85,
      "API Integration": 0.85,
      "State Management  ": 0.85,
      "Push Notifications  ": 0.8,
      "Asynchronous Programming  ": 0.85,
      "UI / UX Design": 0.8,
      "Custom UI  ": 0.8,
      "Dynamic & Reusable Widgets": 0.85,
    };
  }
}
