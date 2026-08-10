import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/domain/model/time_line.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/animated_text_web_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/bounce_and_scale_text_web_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/time_line_career_web_widget.dart';

class MyChaptersCareerWebWidget extends StatefulWidget {
  const MyChaptersCareerWebWidget({super.key});

  @override
  State<MyChaptersCareerWebWidget> createState() =>
      _MyChaptersCareerWebWidgetState();
}

class _MyChaptersCareerWebWidgetState extends State<MyChaptersCareerWebWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final bool isNarrow = screenWidth < 1200;

    return Column(
      children: [
        SizedBox(
          width: screenWidth * 0.85,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: AnimatedTextWebWidget(
              text: S.of(context).experience,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: ColorSchemes.iconDarkWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth > 1400 ? screenWidth * 0.05 : 16,
          ),
          child: isNarrow
              ? Column(
                  children: [
                    _buildExperienceSection(context),
                    const SizedBox(height: 32),
                    _buildCareerTimeline(context),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: _buildExperienceSection(context)),
                    const SizedBox(width: 32),
                    Expanded(child: _buildCareerTimeline(context)),
                  ],
                ),
        ),
      ],
    );
  }

  Widget _buildExperienceSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                ImagePaths.skills,
                color: ColorSchemes.primarySecondary,
                matchTextDirection: true,
                width: 22,
                height: 22,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildHeaderText(
                  context,
                  S.of(context).moreThanYearsExperienceAsA,
                  false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: 220,
            height: 40,
            child: _buildTitleShaderMask(context),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildHeaderText(BuildContext context, String text, bool isAnimated) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: ColorSchemes.iconDarkWhite,
        );

    return isAnimated
        ? BouncingAndScalingTextWebWidget(title: text, style: textStyle)
        : Text(text, style: textStyle);
  }

  Widget _buildTitleShaderMask(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Color(0xFFB200C9), Color(0xFF6A00F4), Color(0xFF0026FF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: BouncingAndScalingTextWebWidget(
        title: S.of(context).flutterDeveloper,
      ),
    );
  }

  Widget _buildCareerTimeline(BuildContext context) {
    final List<TimelineEvent> events = [
      TimelineEvent(
        title: S.of(context).seniorSoftwareEngineer,
        place: "Bridge COM",
        date: "[Aug 2026: PRESENT]",
        color: Colors.teal,
        url: "https://www.linkedin.com/company/bridgecom-ae/",
      ),
      TimelineEvent(
        title: S.of(context).midLevelSoftwareEngineer,
        place: "Bridge COM",
        date: "[Oct 2024: Aug 2026]",
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
        url: "https://www.linkedin.com/company/the-sparks-foundation/",
      ),
      TimelineEvent(
        title: S.of(context).mobileSoftwareEngineerFreelancer,
        place: "FREELANCER",
        date: "[May 2022 : Aug 2023]",
        color: Colors.purple,
        url: "",
      ),
    ];

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: 550,
          child: ListView.builder(
            itemCount: events.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final event = events[index];
              return TimelineCareerWebWidget(
                isEducation: false,
                event: event,
                index: index,
                totalEvents: events.length,
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (mounted) {
      _controller.dispose();
    }
  }
}
