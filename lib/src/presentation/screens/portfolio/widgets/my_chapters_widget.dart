import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/animated_text_Widget.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MyChaptersWidget extends StatefulWidget {
  const MyChaptersWidget({super.key});

  @override
  State<MyChaptersWidget> createState() => _MyChaptersWidgetState();
}

class _MyChaptersWidgetState extends State<MyChaptersWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..forward();

    _fadeAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _rotateAnimation = Tween<double>(begin: -0.02, end: 0.02).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  bool _isAnimated = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    RotationTransition(
                      turns: _rotateAnimation,
                      child: _buildHeaderText(
                        context,
                        S.of(context).myChapter,
                        true,
                      ),
                    ),
                    const SizedBox(height: 15),
                    // RotationTransition(
                    //   turns: _rotateAnimation,
                    //   child:
                          _buildBodyText(context, S.of(context).chaptersStory),
                    // ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
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
                      child: TimelineEventsWidget(
                        isEducation: true,
                        totalEvents: 1,
                        index: 0,
                        event: TimelineEvent(
                          title:
                              "${S.of(context).university}\n${S.of(context).universityDescription}\n${S.of(context).universityDegree}",
                          place: "Ain Shams University",
                          date: "[May 2017:Aug 2021]",
                          color: ColorSchemes.primarySecondary,
                          url: "https://www.asu.edu.eg/",
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          ImagePaths.skills,
                          color: ColorSchemes.iconBackGround,
                          matchTextDirection: true,
                          width: 22,
                          height: 22,
                        ),
                        const SizedBox(width: 10),
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
                      child: _buildTitleShaderMask(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width > 850
                        ? MediaQuery.of(context).size.width * 0.4
                        : MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      children: [
                        _buildTimelineEvents(
                          events: [
                            TimelineEvent(
                              title: S.of(context).midLevelSoftwareEngineer,
                              place: "Bridge COM",
                              date: "[Oct 2024: PRESENT]",
                              color: Colors.green,
                              url:
                                  "https://www.linkedin.com/company/bridgecom-ae/",
                            ),
                            TimelineEvent(
                              title: S.of(context).softwareEngineer,
                              place: "Bridge COM",
                              date: "[Aug 2023: Oct 2024]",
                              color: Colors.blue,
                              url:
                                  "https://www.linkedin.com/company/bridgecom-ae/",
                            ),
                            TimelineEvent(
                              title:
                                  S.of(context).midLevelFlutterSoftwareEngineer,
                              place: "Sprint Eye",
                              date: "[Oct 2024: PRESENT]",
                              color: Colors.orange,
                              url:
                                  "https://www.linkedin.com/showcase/city-eye-app/",
                            ),
                            TimelineEvent(
                              title: S.of(context).mobileSoftwareEngineer,
                              place: "Galaxy Smart Solutions",
                              date: "[Aug 2023: Oct 2024]",
                              color: Colors.red,
                              url:
                                  "https://www.linkedin.com/company/galaxysoft-eg/",
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
                              title: S
                                  .of(context)
                                  .mobileSoftwareEngineerFreelancer,
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
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderText(BuildContext context, String text, bool isAnimation) {
    return isAnimation
        ? BouncingAndScalingText(
            title: text,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: ColorSchemes.iconDarkWhite,
                ),
          )
        : Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 26,
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
      child: BouncingAndScalingText(
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
          child: TimelineEventsWidget(
            isEducation: false,
            event: event,
            index: index,
            totalEvents: events.length,
          ),
        );
      },
    );
  }
}

class BouncingAndScalingText extends StatefulWidget {
  final String title;
  final TextAlign? textAlign;
  final TextStyle? style;

  const BouncingAndScalingText({
    super.key,
    required this.title,
    this.style,
    this.textAlign,
  });

  @override
  _BouncingAndScalingTextState createState() => _BouncingAndScalingTextState();
}

class _BouncingAndScalingTextState extends State<BouncingAndScalingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // مدة الحركة
      vsync: this,
    )..repeat(reverse: true); // تكرار ذهابًا وإيابًا

    _scaleAnimation = Tween<double>(
      begin: 1.0, // الحجم الطبيعي
      end: 1.2, // تكبير النص بنسبة 20%
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0), // الموضع الأصلي
      end: const Offset(0, 0.1), // يتحرك قليلاً لأسفل
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Text(
          widget.title,
          textAlign: widget.textAlign ?? TextAlign.center,
          style: widget.style ??
              Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.7,
                    letterSpacing: -0.1,
                  ),
        ),
      ),
    );
  }
}

class TimelineEventsWidget extends StatefulWidget {
  final TimelineEvent event;
  final int index;
  final int totalEvents;
  final bool isEducation;

  const TimelineEventsWidget({
    super.key,
    required this.event,
    required this.index,
    required this.totalEvents,
    required this.isEducation,
  });

  @override
  _TimelineEventsWidgetState createState() => _TimelineEventsWidgetState();
}

class _TimelineEventsWidgetState extends State<TimelineEventsWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _opacityAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    // Trigger the animation after a delay to make it feel like the event is appearing
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    if (mounted) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            // Timeline dot
            widget.isEducation
                ? Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Icon(
                      Icons.school,
                      color: ColorSchemes.primarySecondary,
                      size: 28,
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    height: 14,
                    width: 14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: widget.event.color, width: 3),
                      color: Colors.white,
                    ),
                  ),
            // Connecting line (except last item)
            if (widget.index != widget.totalEvents - 1 && !widget.isEducation)
              Container(
                height: 50,
                width: 2,
                color: Colors.grey.shade400,
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _opacityAnimation.value,
                      child: child,
                    );
                  },
                  child: AnimatedTextWidget(
                    text: widget.event.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: ColorSchemes.primaryWhite,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _opacityAnimation.value,
                      child: child,
                    );
                  },
                  child: AnimatedTextWidget(
                    text: widget.event.date,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                InkWell(
                  onTap: () {
                    openLink(widget.event.url);
                  },
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _opacityAnimation.value,
                        child: child,
                      );
                    },
                    child: AnimatedTextWidget(
                      text: widget.event.place,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationThickness: 2.5,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TimelineEvent {
  final String title;
  final String place;
  final String date;
  final String url;
  final Color color;

  TimelineEvent({
    required this.title,
    required this.place,
    required this.date,
    required this.url,
    required this.color,
  });
}
