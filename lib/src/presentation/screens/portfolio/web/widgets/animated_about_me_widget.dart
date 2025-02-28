import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';

class AnimatedAboutMeWebWidget extends StatefulWidget {

  const AnimatedAboutMeWebWidget({
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedAboutMeWebWidgetState createState() => _AnimatedAboutMeWebWidgetState();
}

class _AnimatedAboutMeWebWidgetState extends State<AnimatedAboutMeWebWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.1, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
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
    final textTheme = Theme.of(context).textTheme;

    return Wrap(
      children: [
        InkWell(
           child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        S.of(context).aboutMe,
                        style: textTheme.titleLarge?.copyWith(
                          color: ColorSchemes.iconWhiteMode,
                          fontWeight: FontWeight.bold,
                          fontSize:
                              MediaQuery.sizeOf(context).width > 850 ? 25 : 18,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
