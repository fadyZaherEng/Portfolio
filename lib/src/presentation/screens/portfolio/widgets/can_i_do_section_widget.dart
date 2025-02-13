import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter/material.dart';

class WhatCanIDoSectionWidget extends StatefulWidget {
  final bool isVisible;

  const WhatCanIDoSectionWidget({super.key, required this.isVisible});

  @override
  _WhatCanIDoSectionWidgetState createState() =>
      _WhatCanIDoSectionWidgetState();
}

class _WhatCanIDoSectionWidgetState extends State<WhatCanIDoSectionWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _fadeAnimations;
  late List<Animation<Offset>> _slideAnimations;

  // Animation Controllers for Numbers
  late AnimationController _androidController;
  late AnimationController _iosController;
  late AnimationController _webController;

  late Animation<int> _androidAnimation;
  late Animation<int> _iosAnimation;
  late Animation<int> _webAnimation;

  bool _hasAnimatedNumbers = false;

  @override
  void dispose() {
    _controller.dispose();
    _androidController.dispose();
    _iosController.dispose();
    _webController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant WhatCanIDoSectionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _startAnimations();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimations = List.generate(3, (index) {
      return CurvedAnimation(
        parent: _controller,
        curve: Interval(index * 0.2, 1.0, curve: Curves.easeIn),
      );
    });

    _slideAnimations = List.generate(3, (index) {
      return Tween<Offset>(
        begin: const Offset(0, 0.3),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index * 0.2, 1.0, curve: Curves.easeOut),
        ),
      );
    });
    // Initialize Number Animations
    _androidController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    _iosController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    _webController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    init();
  }

  void init() {
    _androidAnimation = IntTween(begin: 0, end: 15).animate(_androidController);
    _iosAnimation = IntTween(begin: 0, end: 12).animate(_iosController);
    _webAnimation = IntTween(begin: 0, end: 3).animate(_webController);
  }

  void _startAnimations() async {
    setState(() {});
    // await Future.delayed(const Duration(seconds: 1));
    if (!mounted) {
      //dispose
      _controller.dispose();
      _androidController.dispose();
      _iosController.dispose();
      _webController.dispose();
      return;
    }
    if ((_androidAnimation.value != 15 ||
        _iosAnimation.value != 12 ||
        _webAnimation.value != 3)) {
      _controller.forward();
      _androidController.forward();
      _iosController.forward();
      _webController.forward();
      setState(() {
        _hasAnimatedNumbers = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // init();
    // if (!_hasAnimatedNumbers) {
    _startAnimations();
    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        FadeTransition(
          opacity: _fadeAnimations[0],
          child: Text(
            S.of(context).WhatCanIDo, // Replace with localization if needed
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ColorSchemes.iconDarkWhite,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: 20),
        MediaQuery.of(context).size.width > 200
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildAnimatedSkillCard(
                    0,
                    _androidAnimation,
                    ImagePaths.android,
                    S.of(context).androidApp,
                  ),
                  _buildAnimatedSkillCard(
                    1,
                    _iosAnimation,
                    ImagePaths.apple,
                    S.of(context).iosApp,
                  ),
                  _buildAnimatedSkillCard(
                    2,
                    _webAnimation,
                    ImagePaths.web,
                    S.of(context).webApp,
                  ),
                ],
              )
            : Column(
                children: [
                  _buildAnimatedSkillCard(
                    0,
                    _androidAnimation,
                    ImagePaths.android,
                    S.of(context).androidApp,
                  ),
                  const SizedBox(height: 10),
                  _buildAnimatedSkillCard(
                    1,
                    _iosAnimation,
                    ImagePaths.apple,
                    S.of(context).iosApp,
                  ),
                  const SizedBox(height: 10),
                  _buildAnimatedSkillCard(
                    2,
                    _webAnimation,
                    ImagePaths.web,
                    S.of(context).webApp,
                  ),
                ],
              ),
      ],
    );
  }

  Widget _buildAnimatedSkillCard(
    int index,
    Animation<int> numberAnimation,
    String iconPath,
    String label,
  ) {
    return SlideTransition(
      position: _slideAnimations[index],
      child: FadeTransition(
        opacity: _fadeAnimations[index],
        child: SkillCardWidget(
          iconPath: iconPath,
          label: label,
          number: numberAnimation.value,
        ),
      ),
    );
  }
}

class SkillCardWidget extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isApple;
  final int number;

  const SkillCardWidget({
    super.key,
    required this.iconPath,
    required this.label,
    required this.number,
    this.isApple = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110,
          width: 100,
          decoration: BoxDecoration(
            color: ColorSchemes.primaryOffer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SvgPicture.asset(
                  iconPath,
                  width: 75,
                  height: 75,
                  matchTextDirection: true,
                  color:
                      isApple ? ColorSchemes.secondary.withOpacity(0.6) : null,
                ),
                const SizedBox(height: 5),
                Text(
                  number <= 0 ? "0" : "\u200E+$number",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ColorSchemes.primarySecondaryWhite,
                      ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ColorSchemes.iconDarkWhite,
              ),
        ),
      ],
    );
  }
}
