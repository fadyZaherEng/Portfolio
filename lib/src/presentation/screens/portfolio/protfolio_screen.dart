import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/src/config/routes/routes_manager.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/base/widget/base_stateful_widget.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';
import 'package:my_portfolio/src/presentation/blocs/portfolio/portfolio_bloc.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/can_i_do_section_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/contact_me_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/custom_app_bar_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/end_drawer_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/header_portfolio_section_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/my_chapters_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/offer_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/project_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/scroll_to_top_button_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/skills_section_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/training_section_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/web_circle_painter_button_scroll.dart';
import 'package:my_portfolio/src/presentation/widgets/restart_widget.dart';
import "package:universal_html/html.dart" as html;
import 'package:visibility_detector/visibility_detector.dart';

class PortfolioScreen extends BaseStatefulWidget {
  const PortfolioScreen({super.key});

  @override
  BaseState<PortfolioScreen> baseCreateState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends BaseState<PortfolioScreen> {
  bool isDarkMode = false;
  String currentLocale = 'en';
  double _scrollPercentage = 0;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _headerKey = GlobalKey();
  final GlobalKey _whatCanIDoKey = GlobalKey();
  final GlobalKey _myChaptersKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _offerKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _isCanIDoVisible = false;

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
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<PortfolioBloc, PortfolioState>(
      listener: (context, state) {
        if (state is PortfolioGetThemeState) {
          isDarkMode = state.isDark;
        } else if (state is PortfolioGetLanguageState) {
          currentLocale = state.locale.languageCode;
          _isCanIDoVisible=true;
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
          resizeToAvoidBottomInset: false,
          backgroundColor:
              isDarkMode ? ColorSchemes.iconBackGround : Colors.white,
          endDrawer: EndDrawerWidget(
            isDarkMode: isDarkMode,
            onDrawerLogoTap: () {
              RestartWidget.restartApp(context);
              html.window.location.reload();
            },
            onDrawerAboutTap: () {
              scrollToKey(_headerKey);
              Navigator.pop(context);
            },
            onDrawerHomeTap: () {
              scrollToKey(_headerKey);
              Navigator.pop(context);
            },
            onDrawerContactTap: () {
              scrollToKey(_contactKey);
              Navigator.pop(context);
            },
            onDrawerExperienceTap: () {
              scrollToKey(_myChaptersKey);
              Navigator.pop(context);
            },
            onDrawerSkillsTap: () {
              context.go(
                Routes.skillsWeb,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SkillsSectionScreen(),
                ),
              );
            },
            onDrawerPortfolioTap: () {
              scrollToKey(_projectsKey);
              Navigator.pop(context);
            },
            onDrawerTrainingTap: () {
              context.go(
                Routes.trainingWeb,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TrainingSectionScreen(),
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
          ),
          appBar: CustomAppBarWidget(
            onLogoTap: () {
              RestartWidget.restartApp(context);
              html.window.location.reload();
            },
          ),
          body: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HeaderProfileSectionWidget(
                        onViewResumeTap: () async {
                          _openResume();
                        },
                        isDarkMode: isDarkMode,
                        key: _headerKey,
                      ),
                      VisibilityDetector(
                        key: const Key('canIDo'),
                        onVisibilityChanged: (visibilityInfo) {
                          _isCanIDoVisible =
                              visibilityInfo.visibleFraction > 0.65;
                          if (mounted) {
                            setState(() {});
                          }
                        },
                        child: WhatCanIDoSectionWidget(
                          key: _whatCanIDoKey,
                          isVisible: _isCanIDoVisible,
                        ),
                      ),
                      const SizedBox(height: 10),
                      OfferWidget(key: _offerKey),
                      MyChaptersWidget(key: _myChaptersKey),
                      const SizedBox(height: 10),
                      ProjectsWidgets(key: _projectsKey),
                      ContactMeWidget(key: _contactKey),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              // Circular Percentage Indicator
              Visibility(
                visible: _scrollPercentage > 0 && _scrollPercentage < 0.95,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomPaint(
                    size: const Size(30, 30),
                    painter: CircularPainter(percentage: _scrollPercentage),
                  ),
                ),
              ),
              Visibility(
                visible: _scrollPercentage > 0.95,
                child: Positioned(
                  bottom: 20,
                  right: currentLocale == "en" ? 20 : null,
                  left: currentLocale == "ar" ? 20 : null,
                  child: ScrollToTopButtonWidget(
                    onTap: () {
                      _scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void scrollToKey(GlobalKey<State<StatefulWidget>> key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _openResume() async {
    await Future.delayed(
      const Duration(microseconds: 300),
    );
    openLink(
      "https://drive.google.com/file/d/16UiIW2QpK9vzbG_gHXvgGTuWtzP5eWGD/view?usp=drivesdk",
    );
  }
}
