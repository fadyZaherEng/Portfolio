import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';

class CustomResumeWidget extends StatefulWidget {
  final void Function() onViewResumeTap;
  final bool isDarkMode;
  final Color borderColor;
  final Color textColor;

  const CustomResumeWidget({
    Key? key,
    required this.onViewResumeTap,
    required this.isDarkMode,
    required this.borderColor,
    required this.textColor,
  }) : super(key: key);

  @override
  _CustomResumeWidgetState createState() => _CustomResumeWidgetState();
}

class _CustomResumeWidgetState extends State<CustomResumeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      lowerBound: 0.9,
      upperBound: 1.2,
    );
    _scaleAnimation = _controller.drive(Tween(begin: 0.9, end: 1.2));
    _fadeAnimation = _controller.drive(Tween(begin: 0.7, end: 0.9));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
          _controller.forward();
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
          _controller.reverse();
        });
      },
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: ElevatedButton(
            onPressed: () {
              _controller.reverse().then((_) {
                _controller.forward();
                widget.onViewResumeTap();
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  widget.isDarkMode ? Colors.transparent : Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(
                  color: widget.borderColor,
                  width: 2,
                ),
              ),
              shadowColor: Colors.black,
              elevation: _isHovered ? 10 : 5,
            ),
            child: Text(
              S.of(context).viewResume,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: widget.textColor,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
