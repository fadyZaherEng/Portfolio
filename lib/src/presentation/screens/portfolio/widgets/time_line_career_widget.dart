import 'package:flutter/material.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/animated_text_Widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/my_chapters_career_widget.dart';

class TimelineCareerWidget extends StatefulWidget {
  final TimelineEvent event;
  final int index;
  final int totalEvents;
  final bool isEducation;

  const TimelineCareerWidget({
    super.key,
    required this.event,
    required this.index,
    required this.totalEvents,
    required this.isEducation,
  });

  @override
  _TimelineCareerWidgetState createState() => _TimelineCareerWidgetState();
}

class _TimelineCareerWidgetState extends State<TimelineCareerWidget>
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

  @override
  void dispose() {
    if (mounted) {
      _controller.dispose();
    }
    super.dispose();
  }
}
