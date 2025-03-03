import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/domain/model/time_line.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/mobile/widgets/bounce_and_scale_text_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/mobile/widgets/time_line_career_widget.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MyChaptersCareerWidget extends StatefulWidget {
  const MyChaptersCareerWidget({
    super.key,
  });

  @override
  State<MyChaptersCareerWidget> createState() => _MyChaptersCareerWidgetState();
}

class _MyChaptersCareerWidgetState extends State<MyChaptersCareerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
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
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.of(context).size.width > 850 ? 16 : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MediaQuery.of(context).size.width > 850
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      crossAxisAlignment:
                          MediaQuery.of(context).size.width > 850
                              ? CrossAxisAlignment.center
                              : CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          ImagePaths.skills,
                          color: ColorSchemes.primarySecondary,
                          matchTextDirection: true,
                          width: 22,
                          height: 22,
                        ),
                        const SizedBox(width: 4),
                        _buildHeaderText(
                          context,
                          S.of(context).moreThanYearsExperienceAsA,
                          false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: 40,
                      child: _buildTitleShaderMask(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              MediaQuery.of(context).size.width > 850
                  ? Center(child: _buildCareer(context))
                  : _buildCareer(context),
              const SizedBox(height: 10),
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
            textAlign: MediaQuery.of(context).size.width > 850
                ? TextAlign.center
                : TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorSchemes.iconDarkWhite,
                ),
          )
        : Text(
            text,
            textAlign: MediaQuery.of(context).size.width > 850
                ? TextAlign.center
                : TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: ColorSchemes.iconDarkWhite,
                ),
          );
  }

  Widget _buildTitleShaderMask(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          Color(0xFFB200C9), // Purple (Start)
          Color(0xFF6A00F4), // Deep Purple/Blue (Middle)
          Color(0xFF0026FF), // Blue (End)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: BouncingAndScalingTextWidget(
        title: S.of(context).flutterDeveloper,
      ),
    );
  }

  Widget _buildTimelineEvents({
    required List<TimelineEvent> events,
  }) {
    return ListView.builder(
      itemCount: events.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final event = events[index];
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: 1 + 0.05 * _controller.value,
              child: child,
            );
          },
          child: TimelineCareerWidget(
            isEducation: false,
            event: event,
            index: index,
            totalEvents: events.length,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildCareer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width > 850
            ? 330
            : MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTimelineEvents(
              events: [
                TimelineEvent(
                  title: S.of(context).midLevelSoftwareEngineer,
                  place: "Bridge COM",
                  date: "[Oct 2024: PRESENT]",
                  color: Colors.green,
                  url: "https://www.linkedin.com/company/bridgecom-ae/",
                ),
                TimelineEvent(
                  title: S.of(context).softwareEngineer,
                  place: "Bridge COM",
                  date: "[Aug 2023: Oct 2024]",
                  color: Colors.blue,
                  url: "https://www.linkedin.com/company/bridgecom-ae/",
                ),
                TimelineEvent(
                  title: S.of(context).midLevelFlutterSoftwareEngineer,
                  place: "Sprint Eye",
                  date: "[Oct 2024: PRESENT]",
                  color: Colors.orange,
                  url: "https://www.linkedin.com/showcase/city-eye-app/",
                ),
                TimelineEvent(
                  title: S.of(context).mobileSoftwareEngineer,
                  place: "Galaxy Smart Solutions",
                  date: "[Aug 2023: Oct 2024]",
                  color: Colors.red,
                  url: "https://www.linkedin.com/company/galaxysoft-eg/",
                ),
                TimelineEvent(
                  title: S.of(context).mobileAppDevelopmentIntern,
                  place: "SPARKS FOUNDATIONS",
                  date: "[Mar 2022 : May 2022]",
                  color: ColorSchemes.secondary,
                  url:
                      "https://www.linkedin.com/company/the-sparks-foundation/",
                ),
                TimelineEvent(
                  title: S.of(context).mobileSoftwareEngineerFreelancer,
                  place: "FREELANCER",
                  date: "[May 2022 : Aug 2023]",
                  color: Colors.purple,
                  url: "",
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
