import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/domain/model/time_line.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/animated_text_Widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/bounce_and_scale_text_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/time_line_career_widget.dart';

class MyChaptersCareerWebWidget extends StatefulWidget {
  const MyChaptersCareerWebWidget({super.key});

  @override
  State<MyChaptersCareerWebWidget> createState() =>
      _MyChaptersCareerWebWidgetState();
}

class _MyChaptersCareerWebWidgetState extends State<MyChaptersCareerWebWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
  )..forward();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width:MediaQuery.sizeOf(context).width * 0.7,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: AnimatedTextWebWidget(
              text: S.of(context).experience,
              textAlign: TextAlign.start,
              style:
              Theme.of(context).textTheme.titleMedium?.copyWith(
                color: ColorSchemes.iconDarkWhite,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildExperienceSection(context),
            const SizedBox(width: 32),
            _buildCareerTimeline(context),
            SizedBox(width: MediaQuery.sizeOf(context).width * 0.13),
          ],
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
              const SizedBox(width: 4),
              _buildHeaderText(
                context,
                S.of(context).moreThanYearsExperienceAsA,
                false,
              ),
              const SizedBox(width: 15),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: 200,
            height: 40,
            child: _buildTitleShaderMask(context),
          ),
          const SizedBox(height: 200),
        ],
      ),
    );
  }

  Widget _buildHeaderText(BuildContext context, String text, bool isAnimated) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: ColorSchemes.iconDarkWhite,
        );

    return isAnimated
        ? BouncingAndScalingTextWidget(title: text, style: textStyle)
        : Text(text, style: textStyle);
  }

  Widget _buildTitleShaderMask(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Color(0xFFB200C9), Color(0xFF6A00F4), Color(0xFF0026FF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: BouncingAndScalingTextWidget(
        title: S.of(context).flutterDeveloper,
      ),
    );
  }

  Widget _buildCareerTimeline(BuildContext context) {
    final List<TimelineEvent> events = [
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
          width: 600,
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
    _controller.dispose();
    super.dispose();
  }
}

//  import 'package:flutter/material.dart';
// import 'package:my_portfolio/generated/l10n.dart';
// import 'package:my_portfolio/src/config/theme/color_schemes.dart';
// import 'package:my_portfolio/src/core/resources/image_paths.dart';
// import 'package:my_portfolio/src/domain/model/time_line.dart';
// import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/bounce_and_scale_text_widget.dart';
// import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/time_line_career_widget.dart';
//
// class MyChaptersCareerWebWidget extends StatefulWidget {
//   const MyChaptersCareerWebWidget({
//     super.key,
//   });
//
//   @override
//   State<MyChaptersCareerWebWidget> createState() => _MyChaptersCareerWebWidgetState();
// }
//
// class _MyChaptersCareerWebWidgetState extends State<MyChaptersCareerWebWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 100),
//     )..forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.center,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Image.asset(
//                 ImagePaths.skills,
//                 color: ColorSchemes.primarySecondary,
//                 matchTextDirection: true,
//                 width: 22,
//                 height: 22,
//               ),
//               const SizedBox(height: 4),
//               _buildHeaderText(
//                 context,
//                 S.of(context).moreThanYearsExperienceAsA,
//                 false,
//               ),
//               const SizedBox(height: 15),
//             ],
//           ),
//         ),
//         const SizedBox(width: 32),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 200,
//               height: 40,
//               child: _buildTitleShaderMask(context),
//             ),
//             const SizedBox(height: 32),
//             _buildCareer(context),
//           ],
//         ),
//         const SizedBox(width: 32),
//       ],
//     );
//   }
//
//   Widget _buildHeaderText(
//     BuildContext context,
//     String text,
//     bool isAnimation,
//   ) {
//     return isAnimation
//         ? BouncingAndScalingTextWidget(
//             title: text,
//             textAlign: MediaQuery.of(context).size.width > 850
//                 ? TextAlign.center
//                 : TextAlign.start,
//             style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                   color: ColorSchemes.iconDarkWhite,
//                 ),
//           )
//         : Text(
//             text,
//             textAlign: MediaQuery.of(context).size.width > 850
//                 ? TextAlign.center
//                 : TextAlign.start,
//             style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                   color: ColorSchemes.iconDarkWhite,
//                 ),
//           );
//   }
//
//   Widget _buildTitleShaderMask(BuildContext context) {
//     return ShaderMask(
//       shaderCallback: (bounds) => const LinearGradient(
//         colors: [
//           Color(0xFFB200C9), // Purple (Start)
//           Color(0xFF6A00F4), // Deep Purple/Blue (Middle)
//           Color(0xFF0026FF), // Blue (End)
//         ],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ).createShader(bounds),
//       child: BouncingAndScalingTextWidget(
//         title: S.of(context).flutterDeveloper,
//       ),
//     );
//   }
//
//   Widget _buildTimelineEvents({
//     required List<TimelineEvent> events,
//   }) {
//     return ListView.builder(
//       itemCount: events.length,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemBuilder: (context, index) {
//         final event = events[index];
//         return AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             return Transform.scale(
//               scale: 1 + 0.05 * _controller.value,
//               child: child,
//             );
//           },
//           child: TimelineCareerWebWidget(
//             isEducation: false,
//             event: event,
//             index: index,
//             totalEvents: events.length,
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   Widget _buildCareer(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width > 850
//               ? 330
//               : MediaQuery.of(context).size.width,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               _buildTimelineEvents(
//                 events: [
//                   TimelineEvent(
//                     title: S.of(context).midLevelSoftwareEngineer,
//                     place: "Bridge COM",
//                     date: "[Oct 2024: PRESENT]",
//                     color: Colors.green,
//                     url: "https://www.linkedin.com/company/bridgecom-ae/",
//                   ),
//                   TimelineEvent(
//                     title: S.of(context).softwareEngineer,
//                     place: "Bridge COM",
//                     date: "[Aug 2023: Oct 2024]",
//                     color: Colors.blue,
//                     url: "https://www.linkedin.com/company/bridgecom-ae/",
//                   ),
//                   TimelineEvent(
//                     title: S.of(context).midLevelFlutterSoftwareEngineer,
//                     place: "Sprint Eye",
//                     date: "[Oct 2024: PRESENT]",
//                     color: Colors.orange,
//                     url: "https://www.linkedin.com/showcase/city-eye-app/",
//                   ),
//                   TimelineEvent(
//                     title: S.of(context).mobileSoftwareEngineer,
//                     place: "Galaxy Smart Solutions",
//                     date: "[Aug 2023: Oct 2024]",
//                     color: Colors.red,
//                     url: "https://www.linkedin.com/company/galaxysoft-eg/",
//                   ),
//                   TimelineEvent(
//                     title: S.of(context).mobileAppDevelopmentIntern,
//                     place: "SPARKS FOUNDATIONS",
//                     date: "[Mar 2022 : May 2022]",
//                     color: ColorSchemes.secondary,
//                     url:
//                         "https://www.linkedin.com/company/the-sparks-foundation/",
//                   ),
//                   TimelineEvent(
//                     title: S.of(context).mobileSoftwareEngineerFreelancer,
//                     place: "FREELANCER",
//                     date: "[May 2022 : Aug 2023]",
//                     color: Colors.purple,
//                     url: "",
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
