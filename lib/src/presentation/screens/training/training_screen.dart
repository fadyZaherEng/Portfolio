import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/routes/routes_manager.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/presentation/blocs/portfolio/portfolio_bloc.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/bounce_and_scale_text_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/custom_app_bar_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/web_circle_painter_button_scroll.dart';
import 'package:my_portfolio/src/presentation/screens/training/widgets/training_item_widget.dart';
import 'package:my_portfolio/src/presentation/widgets/restart_widget.dart';
import "package:universal_html/html.dart" as html;

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  List<Training> trainings = [];

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
    _dummyTrainings();
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
            Navigator.pop(context);
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
                Navigator.pop(context);
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: BouncingAndScalingTextWidget(
                            title: S.of(context).training,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: ColorSchemes.iconDarkWhite,
                                ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: List.generate(
                            trainings.length,
                            (index) => TrainingItemWidget(
                              training: trainings[index],
                              index: index,
                            ),
                          ),
                        ),
                      ],
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

  void _dummyTrainings() {
    trainings = [
      Training(
          title: "Mobile Competition",
          provider: "Ain Shams University",
          duration: "",
          year: 2021,
          url:
              "https://drive.google.com/file/d/1KJBBIEL6znUUZQyzTSOJWrLlA0omkv1h/view?usp=drivesdk"),
      Training(
          title: "Flutter Animation",
          provider: "Almentor",
          duration: "1 Month",
          year: 2024,
          url:
              "https://drive.google.com/file/d/1-Rtee7_YYkmPng5j1XJKLcq58N77Uovw/view?usp=drivesdk"),
      Training(
          title: "Flutter Advanced",
          provider: "Udemy",
          duration: "3 Months",
          year: 2023,
          url:
              "https://drive.google.com/file/d/1YHk3ONSs4Ra4bzSB2-A4AguQnHYpdrFP/view?usp=drivesdk"),
      Training(
          title: "Flutter UI",
          provider: "Almentor",
          duration: "1 Month",
          year: 2023,
          url:
              "https://drive.google.com/file/d/12t3466DFk_k9KUwv9LWLpDukZrlIV70U/view?usp=drive_link"),
      Training(
          title: "Mobile Development",
          provider: "Sparks Foundation",
          duration: "",
          year: 2023,
          url:
              "https://drive.google.com/file/d/1OyVnb67UL84BeviIcfjT7bfxHGQwOCxf/view?usp=drivesdk"),
      Training(
          title: "Flutter",
          provider: "Udemy",
          duration: "3 Months",
          year: 2022,
          url:
              "https://drive.google.com/file/d/1MwXRoucJslW5LSRiNJjeQkqTkgWPwYKI/view?usp=drivesdk"),
      Training(
          title: "Flutter",
          provider: "Udemy",
          duration: "3 Months",
          year: 2022,
          url:
              "https://drive.google.com/file/d/1tWBIAJnD5V3SQw_lvHaVV577Ch85uc6v/view?usp=drivesdk"),
      Training(
          title: "Dart Language",
          provider: "Udemy",
          duration: "1 Month",
          year: 2021,
          url:
              "https://drive.google.com/file/d/1XhtZgMhwmukd2__xD9DORIGQMpQ2ad0y/view?usp=drivesdk"),
      Training(
          title: "Android",
          provider: "Ain Shams University",
          duration: "",
          year: 2019,
          url:
              "https://drive.google.com/file/d/1KO9bouE4FDIXFL1ZkxiPKQh9exPjKPtU/view?usp=drivesdk"),
      Training(
          title: "Learn How to Learn",
          provider: "Almentor",
          duration: "",
          year: 2023,
          url:
              "https://drive.google.com/file/d/1owCK86u16JoQ83gHM63_c-z5CNqpVjo9/view?usp=drivesdk"),
      Training(
          title: "Flutter Animation",
          provider: "Udemy",
          duration: "1 Month ",
          year: 2024,
          url:
              "https://drive.google.com/file/d/1-Rtee7_YYkmPng5j1XJKLcq58N77Uovw/view?usp=drivesdk"),
      Training(
          title: "Graduation Certificate",
          provider: "Ain Shams University",
          duration: "",
          year: 2021,
          url:
              "https://drive.google.com/file/d/19HV2Y5YWlmNvbb5Fn-GCukes1G8xqaUp/view?usp=drivesdk"),
      Training(
          title: "Version Control",
          provider: "Almentor",
          duration: "",
          year: 2023,
          url:
              "https://drive.google.com/file/d/1AGGhH7xxdjalECqePdGFKeNM4BYDpTCc/view?usp=sharing"),
      Training(
          title: "Android Development",
          provider: "Russian Culture Center",
          duration: "3 Months",
          year: 2019,
          url:
              "https://drive.google.com/file/d/1KTIwg0-nGmUtbimBad3ywUmZ80B_Asal/view?usp=drivesdk"),
      Training(
          title: "Back-End Development",
          provider: "NP Learn",
          duration: "3 Months",
          year: 2022,
          url:
              "https://drive.google.com/file/d/1dhmZXn_TPZbZ4r9ZwFkiKpwuGwjdHwml/view?usp=drive_link"),
      Training(
          title: "Front-End Development",
          provider: "Udemy",
          duration: "2 Months",
          year: 2022,
          url:
              "https://drive.google.com/file/d/1cup8TQ14QIYxJw-Di3ynDuKm05r0Janu/view?usp=drivesdk"),
      Training(
          title: "Problem Solving",
          provider: "PST Coach",
          duration: "4 Months",
          year: 2018,
          url:
              "https://drive.google.com/file/d/1K2iv246DGrOZVaGwpHbHETacgVe8hrfU/view?usp=drivesdk"),
      Training(
          title: "C++ Language",
          provider: "RMS Company",
          duration: "2 Months",
          year: 2018,
          url:
              "https://drive.google.com/file/d/1KDCCRyCGLVjv_abjj1YqUyXUCyPDUW8s/view?usp=drivesdk"),
      Training(
          title: "Python Language",
          provider: "Ain Shams University",
          duration: "",
          year: 2018,
          url:
              "https://drive.google.com/file/d/1KNeYLqjxNe8__jnNrhCYSephesH9opPV/view?usp=drivesdk"),
      Training(
          title: "Advanced Communication Skills",
          provider: "Almentor",
          duration: "",
          year: 2024,
          url:
              "https://drive.google.com/file/d/1giJRvlpg2uHpufcyZFXXluRIttA89Zbi/view?usp=drivesdk"),
      Training(
          title: "Time Management & Productivity",
          provider: "Almentor",
          duration: "",
          year: 2023,
          url:
              "https://drive.google.com/file/d/1Fsf2JbIuDP8WL3xRrJPydTHHofH6y9yW/view?usp=drivesdk"),
      Training(
          title: "The 7 Communication SINS",
          provider: "Almentor",
          duration: "",
          year: 2023,
          url:
              "https://drive.google.com/file/d/1QjQ1caJDuw6vpsk0jg89P0e0r7Vgc98T/view?usp=drivesdk"),
      Training(
          title: "Impact of Life Skills on Success",
          provider: "Almentor",
          duration: "",
          year: 2024,
          url:
              "https://drive.google.com/file/d/1t-gLVnSTQyXeGp8M5CQCbxFdbmfOGRlg/view?usp=drivesdk"),
    ];
  }
}

class Training {
  final String title;
  final String provider;
  final String duration;
  final int year;
  final String url;

  Training({
    required this.title,
    required this.provider,
    required this.duration,
    required this.year,
    required this.url,
  });
}
