import 'package:flutter/material.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';
import 'package:my_portfolio/src/domain/model/time_line.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/animated_text_web_widget.dart';

class TimelineCareerWebWidget extends StatefulWidget {
  final TimelineEvent event;
  final int index;
  final int totalEvents;
  final bool isEducation;

  const TimelineCareerWebWidget({
    super.key,
    required this.event,
    required this.index,
    required this.totalEvents,
    required this.isEducation,
  });

  @override
  _TimelineCareerWebWidgetState createState() =>
      _TimelineCareerWebWidgetState();
}

class _TimelineCareerWebWidgetState extends State<TimelineCareerWebWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
         _buildTimelineIndicator(),
        const SizedBox(width: 10),
        _buildTimelineDetails(context),
      ],
    );
  }

  Widget _buildTimelineIndicator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 12),
        widget.isEducation
            ? Icon(
                Icons.school,
                color: ColorSchemes.primarySecondary,
                size: 32,
              )
            : Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: widget.event.color, width: 3),
                  color: Colors.white,
                ),
              ),
        if (!widget.isEducation)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 60,
            width: 3,
            color: Colors.grey.shade400,
          ),
      ],
    );
  }

  Widget _buildTimelineDetails(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedTextWebWidget(
              text: widget.event.title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorSchemes.primaryWhite,
                    height: 2,
                    letterSpacing: -0.1,
                  ),
            ),
            const SizedBox(height: 4),
            AnimatedTextWebWidget(
              text: widget.event.date,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 4),
            InkWell(
              onTap: () => openLink(widget.event.url),
              child: AnimatedTextWebWidget(
                text: widget.event.place,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationThickness: 2.5,
                    ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
