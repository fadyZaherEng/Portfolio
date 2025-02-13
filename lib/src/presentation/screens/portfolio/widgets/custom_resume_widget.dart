import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';

class CustomResumeWidget extends StatefulWidget {
  final void Function() onViewResumeTap;
  final bool isDarkMode;
  final Color textColor;
  final Color borderColor;

  const CustomResumeWidget({
    Key? key,
    required this.onViewResumeTap,
    required this.isDarkMode,
    required this.textColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  _CustomResumeWidgetState createState() => _CustomResumeWidgetState();
}

class _CustomResumeWidgetState extends State<CustomResumeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: ElevatedButton(
          onPressed: () {
            _controller.reverse().then((_) {
                _controller.forward();
                widget.onViewResumeTap();
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                widget.isDarkMode ? Colors.transparent : ColorSchemes.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(
                color: widget.borderColor,
                width: 2,
              ),
            ),
            shadowColor: ColorSchemes.black,
            elevation: 5,
          ),
          child: Text(
            S.of(context).viewResume,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: widget.textColor,
                  fontSize: 15,
                  fontWeight: Constants.fontWeightBold,
                ),
          ),
        ),
      ),
    );
  }
}
