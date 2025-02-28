import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';

class AnimatedAboutMeWidget extends StatefulWidget {
  final void Function() onTap;
  final bool isOpen;

  const AnimatedAboutMeWidget({
    Key? key,
    required this.onTap,
    required this.isOpen,
  }) : super(key: key);

  @override
  _AnimatedAboutMeWidgetState createState() => _AnimatedAboutMeWidgetState();
}

class _AnimatedAboutMeWidgetState extends State<AnimatedAboutMeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _rotationAnimation;

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

    _rotationAnimation = Tween<double>(begin: 0.0, end: 3.14).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant AnimatedAboutMeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
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
          onTap: widget.onTap,
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
                              MediaQuery.sizeOf(context).width > 850 ? 22 : 18,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                          width:
                              MediaQuery.sizeOf(context).width > 850 ? 15 : 8),
                      Transform.rotate(
                        angle: _rotationAnimation.value,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                ColorSchemes.secondary.withOpacity(0.7),
                                ColorSchemes.iconBackGround,
                                ColorSchemes.primary.withOpacity(0.7),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            shape: BoxShape.circle,
                            color: ColorSchemes.primarySecondary,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                spreadRadius: 2,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: SvgPicture.asset(
                            ImagePaths.arrowDown,
                            color: ColorSchemes.primarySecondaryWhite,
                            width: 25,
                            height: 25,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
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
