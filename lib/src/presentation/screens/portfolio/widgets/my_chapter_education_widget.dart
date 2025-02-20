import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/domain/model/time_line.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/animated_text_Widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/bounce_and_scale_text_widget.dart';
 import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/time_line_career_widget.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MyChapterEducationWidget extends StatefulWidget {
  const MyChapterEducationWidget({
    super.key,
  });

  @override
  State<MyChapterEducationWidget> createState() =>
      _MyChapterEducationWidgetState();
}

class _MyChapterEducationWidgetState extends State<MyChapterEducationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _rotateAnimation;
  bool _isAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..forward();

    _fadeAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _rotateAnimation = Tween<double>(
      begin: -0.02,
      end: 0.02,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _startAnimation() {
    if (!_isAnimated) {
      _controller.forward();
      setState(() {
        _isAnimated = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.2) {
          _startAnimation();
        }
      },
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:   EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width > 850 ? 16 : 0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    RotationTransition(
                      turns: _rotateAnimation,
                      child: _buildHeaderText(
                        context,
                        S.of(context).myChapter,
                        false,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildBodyText(context, S.of(context).chaptersStory),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: AnimatedTextWidget(
                          text: S.of(context).education,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: ColorSchemes.iconDarkWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: TimelineCareerWidget(
                        isEducation: true,
                        totalEvents: 1,
                        index: 0,
                        event: TimelineEvent(
                          title:
                              "${S.of(context).university}\n${S.of(context).universityDescription}\n${S.of(context).universityDegree}",
                          place: S.of(context).ainShamsUniversity,
                          date: "[May 2017:Aug 2021]",
                          color: ColorSchemes.primarySecondary,
                          url: "https://www.asu.edu.eg/",
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderText(
    BuildContext context,
    String text,
    bool isAnimation,
  ) {
    return isAnimation
        ? BouncingAndScalingTextWidget(
            title: text,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: ColorSchemes.iconDarkWhite,
                ),
          )
        : Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: ColorSchemes.iconDarkWhite,
                ),
          );
  }

  Widget _buildBodyText(BuildContext context, String text) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width > 850
            ? 850
            : MediaQuery.of(context).size.width * 0.8,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: ColorSchemes.iconDarkWhite,
                height: 1.7,
                letterSpacing: -0.25,
              ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
