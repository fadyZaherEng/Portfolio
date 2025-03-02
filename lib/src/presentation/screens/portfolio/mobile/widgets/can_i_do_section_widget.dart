import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';

class WhatCanIDoSectionWidget extends StatefulWidget {
  final bool isVisible;

  const WhatCanIDoSectionWidget({
    super.key,
    required this.isVisible,
  });

  @override
  _WhatCanIDoSectionWidgetState createState() =>
      _WhatCanIDoSectionWidgetState();
}

class _WhatCanIDoSectionWidgetState extends State<WhatCanIDoSectionWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _fadeAnimations;
  late List<Animation<Offset>> _slideAnimations;

  late AnimationController _androidController;
  late AnimationController _iosController;
  late AnimationController _webController;

  late Animation<int> _androidAnimation;
  late Animation<int> _iosAnimation;
  late Animation<int> _webAnimation;

  @override
  void dispose() {
    _controller.dispose();
    _androidController.dispose();
    _iosController.dispose();
    _webController.dispose();
    super.dispose();
  }

  final int _numberSecondForHundredPercentage = 25;

  int getPercentage(int number) {
    return ((number / 100) * _numberSecondForHundredPercentage + 1).toInt();
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
      duration: const Duration(milliseconds: 700),
    );

    _fadeAnimations = List.generate(3, (index) {
      return CurvedAnimation(
        parent: _controller,
        curve: Interval(index * 0.2, 1.0, curve: Curves.easeIn),
      );
    });

    _slideAnimations = List.generate(
      3,
      (index) {
        return Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(index * 0.2, 1.0, curve: Curves.easeOut),
          ),
        );
      },
    );
    // Initialize Number Animations
    _androidController = AnimationController(
      duration: Duration(seconds: getPercentage(15)),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    _iosController = AnimationController(
      duration: Duration(seconds: getPercentage(12)),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    _webController = AnimationController(
      duration: Duration(seconds: getPercentage(8)),
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
    if (!mounted) {
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
    }
  }

  @override
  Widget build(BuildContext context) {
    _startAnimations();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        FadeTransition(
          opacity: _fadeAnimations[0],
          child: Text(
            S.of(context).WhatCanIDo,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ColorSchemes.iconDarkWhite,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
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
        child: _buildSkilledCardWidget(
          iconPath: iconPath,
          label: label,
          number: numberAnimation.value,
        ),
      ),
    );
  }

  Widget _buildSkilledCardWidget({
    required String iconPath,
    required String label,
    required int number,
    bool isApple = false,
  }) {
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
