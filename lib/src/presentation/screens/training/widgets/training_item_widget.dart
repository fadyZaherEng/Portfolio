import 'package:flutter/material.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';
import 'package:my_portfolio/src/presentation/screens/training/training_screen.dart';

class TrainingItemWidget extends StatefulWidget {
  final Training training;
  final int index;

  const TrainingItemWidget(
      {Key? key, required this.training, required this.index})
      : super(key: key);

  @override
  State<TrainingItemWidget> createState() => TrainingItemWidgetState();
}

class TrainingItemWidgetState extends State<TrainingItemWidget> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.index * 200), () {
      if (mounted) {
        setState(() {
          isVisible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 600),
      opacity: isVisible ? 1.0 : 0.0,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 600),
        offset: isVisible ? Offset.zero : const Offset(0, 0.2),
        child: InkWell(
          onTap: () => openLink(widget.training.url),
          child: InkWell(
            onTap: () => openLink(widget.training.url),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.school,
                    color: ColorSchemes.primarySecondary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.training.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: ColorSchemes.primaryWhite,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${widget.training.provider} - ${widget.training.year}${widget.training.duration.isNotEmpty ? " (${widget.training.duration})" : ""}",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: ColorSchemes.primarySecondary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
