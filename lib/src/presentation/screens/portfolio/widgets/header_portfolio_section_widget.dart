import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/about_section_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/my_chapters_widget.dart';

class HeaderProfileSectionWidget extends StatefulWidget {
  final VoidCallback onViewResumeTap;
  final bool isDarkMode;

  const HeaderProfileSectionWidget({
    super.key,
    required this.onViewResumeTap,
    required this.isDarkMode,
  });

  @override
  State<HeaderProfileSectionWidget> createState() =>
      _HeaderProfileSectionWidgetState();
}

class _HeaderProfileSectionWidgetState extends State<HeaderProfileSectionWidget>
    with TickerProviderStateMixin {
  late final GifController _controller;
  bool openAboutMe = false;

  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final Color textColor =
        widget.isDarkMode ? ColorSchemes.white : ColorSchemes.iconBackGround;
    final Color borderColor = widget.isDarkMode
        ? ColorSchemes.primarySecondaryWhite
        : ColorSchemes.iconBackGround;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AboutMeSectionWidget(
          onOpenAboutMe: (isOpen) {
            setState(() {
              openAboutMe = isOpen;
            });
          },
        ),
        const SizedBox(height: 20),
        _buildWelcomeMessage(textTheme),
        const SizedBox(height: 10),
        _buildAnimatedIntro(textTheme),
        const SizedBox(height: 20),
        CustomResumeWidget(
          onViewResumeTap: widget.onViewResumeTap,
          isDarkMode: widget.isDarkMode,
          textColor: textColor,
          borderColor: borderColor,
        ),
      ],
    );
  }

  Widget _buildWelcomeMessage(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${S.of(context).welcomeMessage} ',
          style: textTheme.titleMedium?.copyWith(
            color: ColorSchemes.iconDarkWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Gif(
          autostart: Autostart.loop,
          controller: _controller,
          fit: BoxFit.cover,
          height: 32,
          width: 32,
          matchTextDirection: true,
          placeholder: (context) => const SizedBox.shrink(),
          image: const AssetImage(ImagePaths.hi),
        ),
      ],
    );
  }

  Widget _buildAnimatedIntro(TextTheme textTheme) {
    return AnimatedTextKit(
      repeatForever: false,
      totalRepeatCount: 2,
      stopPauseOnTap: true,
      animatedTexts: [
        TypewriterAnimatedText(
          S.of(context).imFady,
          textAlign: TextAlign.center,
          textStyle: textTheme.titleLarge?.copyWith(
            color: ColorSchemes.iconDarkWhite,
            fontWeight: FontWeight.bold,
          ),
          speed: const Duration(milliseconds: 50),
        ),
      ],
    );
  }
}

class CustomResumeWidget extends StatefulWidget {
  final VoidCallback onViewResumeTap;
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
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    // تشغيل الأنيميشن عند فتح الصفحة
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
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                widget.isDarkMode ? Colors.transparent : Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(
                color: widget.borderColor,
                width: 1.5,
              ),
            ),
            shadowColor: Colors.black54,
            elevation: 4,
          ),
          child: Text(
             S.of(context).viewResume,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: widget.textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
