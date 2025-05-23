import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/routes/routes_manager.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/base/widget/base_stateful_widget.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';
import 'package:my_portfolio/src/di/data_layer_injector.dart';
import 'package:my_portfolio/src/domain/usecase/get_theme_use_case.dart';
import 'package:my_portfolio/src/presentation/blocs/portfolio/portfolio_bloc.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/can_i_do_section_web_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/contact_me_web_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/custom_app_bar_web_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/end_drawer_web_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/header_portfolio_section_web_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/my_chapter_education_web_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/my_chapters_career_web_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/project_sections_web_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/scroll_to_top_button_web_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/skills_details_offer_web_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/social_banner_web_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/tab_bar_item_web_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/web_circle_painter_button_scroll_web_wedget.dart';
import 'package:my_portfolio/src/presentation/screens/skills/skills_screen.dart';
import 'package:my_portfolio/src/presentation/screens/touch_me/touch_me_screen.dart';
import 'package:my_portfolio/src/presentation/screens/training/training_screen.dart';
import 'package:my_portfolio/src/presentation/widgets/restart_widget.dart';
import "package:universal_html/html.dart" as html;
import 'package:visibility_detector/visibility_detector.dart';

class PortfolioWebScreen extends BaseStatefulWidget {
  const PortfolioWebScreen({super.key});

  @override
  BaseState<PortfolioWebScreen> baseCreateState() => _PortfolioWebScreenState();
}

class _PortfolioWebScreenState extends BaseState<PortfolioWebScreen>
    with TickerProviderStateMixin {
  String currentLocale = 'en';
  final ValueNotifier<double> _scrollPercentage = ValueNotifier(0);
  int _currentIndex = 0;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  final Map<int, GlobalKey> _scrollKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
    2: GlobalKey(),
    3: GlobalKey(),
    4: GlobalKey(),
    5: GlobalKey(),
  };

  final GlobalKey _whatCanIDoKey = GlobalKey();

  bool _isCanIDoVisible = false;

  PortfolioBloc get _bloc => BlocProvider.of<PortfolioBloc>(context);
  bool isDarkMode = true;

  @override
  void initState() {
    super.initState();
    _bloc.add(PortfolioGetThemeEvent());
    _bloc.add(PortfolioGetLanguageEvent());

    _scrollController.addListener(() {
      _scrollPercentage.value = _scrollController.position.pixels /
          _scrollController.position.maxScrollExtent;
    });
    isDarkMode = isDarkMode = GetThemeUseCase(injector())() == Constants.dark;
  }

  void _onTap(int index, {String? route, Widget? screen}) {
    setState(() => _currentIndex = index);
    if (_scrollKeys.containsKey(index)) {
      scrollToKey(_scrollKeys[index]!);
    }
  }

  @override
  Widget baseBuild(BuildContext context) {
    Color textColor = isDarkMode ? ColorSchemes.white : ColorSchemes.primary;
    final double fontSize = isDarkMode ? 20 : 22;
    final Color indicatorColor = isDarkMode
        ? ColorSchemes.primarySecondary
        : ColorSchemes.iconBackGround;

    final List<Map<String, dynamic>> menuItems = [
      {"title": S.of(context).home, "index": 0},
      {"title": S.of(context).skillsOffer, "index": 1},
      {"title": S.of(context).myProjects, "index": 2},
      {"title": S.of(context).education, "index": 3},
      {"title": S.of(context).experience, "index": 4},
      {"title": S.of(context).contact, "index": 5},
    ];

    return BlocConsumer<PortfolioBloc, PortfolioState>(
      listener: (context, state) {
        if (state is PortfolioGetThemeState) {
          isDarkMode = state.isDark;
        } else if (state is PortfolioGetLanguageState) {
          currentLocale = state.locale.languageCode;
          _isCanIDoVisible = true;
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
        return Scaffold(
          backgroundColor:
              isDarkMode ? ColorSchemes.iconBackGround : ColorSchemes.white,
          endDrawer: _buildEndDrawer(context),
          appBar: CustomAppBarWebWidget(onLogoTap: _restartApp),
          body: Column(
            children: [
              _buildNavigationBar(
                menuItems,
                textColor,
                fontSize,
                indicatorColor,
              ),
              const SizedBox(height: 32),
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    _buildContent(),
                    _buildScrollIndicator(),
                    _buildScrollToTopButton(),
                    if (_currentIndex != 2 && _currentIndex != 5)
                      SocialBannerWebWidget(currentLocale: currentLocale),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VisibilityDetector(
            key: const Key("headerKeys"),
            onVisibilityChanged: (visibilityInfo) {
              if (mounted) {
                setState(() => visibilityInfo.visibleFraction > 0.65
                    ? _currentIndex = 0
                    : null);
              }
            },
            child: HeaderProfileSectionWebWidget(
              onViewResumeTap: _openResume,
              isDarkMode: isDarkMode,
              key: _scrollKeys[0],
            ),
          ),
          const SizedBox(height: 10),
          VisibilityDetector(
            key: const Key("whatCanIDoKeys"),
            onVisibilityChanged: (visibilityInfo) {
              if (mounted) {
                _isCanIDoVisible = visibilityInfo.visibleFraction > 0.65;
                setState(() {});
              }
            },
            child: WhatCanIDoSectionWebbWidget(
              key: _whatCanIDoKey,
              isVisible: _isCanIDoVisible,
            ),
          ),
          const SizedBox(height: 10),
          VisibilityDetector(
            key: const Key("skillsOfferKeys"),
            onVisibilityChanged: (visibilityInfo) {
              if (mounted) {
                setState(() => visibilityInfo.visibleFraction > 0.65
                    ? _currentIndex = 1
                    : null);
              }
            },
            child: SkillsDetailsOfferWebWidget(key: _scrollKeys[1]),
          ),
          VisibilityDetector(
            key: const Key("educationKeys"),
            onVisibilityChanged: (visibilityInfo) {
              if (mounted) {
                setState(() => visibilityInfo.visibleFraction > 0.65
                    ? _currentIndex = 3
                    : null);
              }
            },
            child: MyChapterEducationWebWidget(key: _scrollKeys[3]),
          ),
          VisibilityDetector(
            key: const Key("experienceKeys"),
            onVisibilityChanged: (visibilityInfo) {
              if (mounted) {
                setState(() => visibilityInfo.visibleFraction > 0.65
                    ? _currentIndex = 4
                    : null);
              }
            },
            child: MyChaptersCareerWebWidget(key: _scrollKeys[4]),
          ),
          const SizedBox(height: 32),
          VisibilityDetector(
            key: const Key("projectsKeys"),
            onVisibilityChanged: (visibilityInfo) {
              if (mounted) {
                setState(() => visibilityInfo.visibleFraction > 0.65
                    ? _currentIndex = 2
                    : null);
              }
            },
            child: ProjectsSectionsWebWidgets(
                key: _scrollKeys[2], isDarkMode: isDarkMode),
          ),
          VisibilityDetector(
            key: const Key("contactKeys"),
            onVisibilityChanged: (visibilityInfo) {
              if (mounted) {
                setState(() => visibilityInfo.visibleFraction > 0.65
                    ? _currentIndex = 5
                    : null);
              }
            },
            child: ContactMeWebWidget(key: _scrollKeys[5]),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _buildNavigationBar(
    List<Map<String, dynamic>> menuItems,
    Color textColor,
    double fontSize,
    Color indicatorColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: menuItems
            .map(
              (item) => TabBarItemWebWidget(
                title: item["title"],
                isSelected: _currentIndex == item["index"],
                onTap: () => _onTap(item["index"],
                    route: item["route"], screen: item["screen"]),
                textColor: textColor,
                fontSize: fontSize,
                indicatorColor: indicatorColor,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildScrollIndicator() {
    return ValueListenableBuilder<double>(
      valueListenable: _scrollPercentage,
      builder: (_, value, __) {
        if (value > 0 && value < 0.95) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: CustomPaint(
              size: const Size(37, 37),
              painter: CircularPainterWebWidget(percentage: value),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildScrollToTopButton() {
    return ValueListenableBuilder<double>(
      valueListenable: _scrollPercentage,
      builder: (_, value, __) {
        if (value > 0.95) {
          return Positioned(
            bottom: 20,
            right: currentLocale == "en" ? 20 : null,
            left: currentLocale == "ar" ? 20 : null,
            child: ScrollToTopButtonWebWidget(onTap: () {
              _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
              );
            }),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  void scrollToKey(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _openResume() => openLink(
      "https://drive.google.com/file/d/16UiIW2QpK9vzbG_gHXvgGTuWtzP5eWGD/view?usp=drivesdk");

  void _restartApp() {
    RestartWidget.restartApp(context);
    html.window.location.reload();
  }

  Widget _buildEndDrawer(BuildContext context) {
    return EndDrawerWebWidget(
      isDarkMode: isDarkMode,
      isEnglish: currentLocale == "en",
      onDrawerGetInTouchTap: () {
        context.go(Routes.touchMe);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TouchMeScreen(),
          ),
        );
      },
      onDrawerLogoTap: () {
        RestartWidget.restartApp(context);
        html.window.location.reload();
      },
      onDrawerSkillsTap: () {
        context.go(Routes.skillsWeb);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SkillsScreen(),
          ),
        );
      },
      onDrawerTrainingTap: () {
        context.go(Routes.trainingWeb);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TrainingScreen(),
          ),
        );
      },
      toggleTheme: (bool isDark) {
        String theme = isDark ? Constants.dark : Constants.light;
        _bloc.add(PortfolioChangeThemeEvent(theme: theme));
      },
      changeLocale: (String locale) {
        _bloc.add(PortfolioChangeLanguageEvent(locale: locale));
      },
    );
  }
}
