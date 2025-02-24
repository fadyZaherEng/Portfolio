import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gif/gif.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/core/utils/launch_social_media.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';
import 'package:my_portfolio/src/core/utils/show_snack_bar.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/about_section_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/custom_resume_widget.dart';

class HeaderProfileSectionWidget extends StatefulWidget {
  final void Function() onViewResumeTap;
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
          title: S.of(context).downloadCv,
          width: 150,
        ),
        const SizedBox(height: 24),
        InkWell(
          onTap: () => launchWhatsApp(
            phoneNumber: "+201273826361",
            onOpenWhatsappFailed: () {
              showSnackBar(
                context: context,
                message: S.of(context).failedToLaunchWhatsApp,
                color: ColorSchemes.snackBarWarning,
              );
            },
          ),
          child: Container(
            height: 35,
            width: 175,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: borderColor,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
              color: widget.isDarkMode ? Colors.transparent : Colors.white,
            ),
            child: Center(
              child: Text(
                S.of(context).hireMe,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: textColor,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: () => Clipboard.setData(
            const ClipboardData(text: "fedo.zaher@gmail.com"),
          ),
          child: Container(
            height: 35,
            width: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: borderColor,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
              color: widget.isDarkMode ? Colors.transparent : Colors.white,
            ),
            child: Center(
              child: Text(
                S.of(context).copyEmail,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: textColor,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
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

  final positionVisible = ValueNotifier<bool>(false);

  Widget _buildAnimatedIntro(TextTheme textTheme) {
    return Column(
      children: [
        AnimatedTextKit(
          repeatForever: false,
          totalRepeatCount: 2,
          stopPauseOnTap: false,
          onFinished: () {
            setState(() {
              positionVisible.value = true;
            });
          },
          animatedTexts: [
            TypewriterAnimatedText(
              S.of(context).imFady,
              textAlign: TextAlign.center,
              textStyle: textTheme.titleLarge?.copyWith(
                color: ColorSchemes.iconDarkWhite,
                fontWeight: FontWeight.bold,
              ),
              speed: const Duration(milliseconds: 100),
            ),
          ],
        ),
        if (positionVisible.value) const SizedBox(height: 10),
        if (positionVisible.value)
          AnimatedTextKit(
            repeatForever: false,
            totalRepeatCount: 2,
            stopPauseOnTap: false,
            displayFullTextOnTap: true,
            animatedTexts: [
              TypewriterAnimatedText(
                S.of(context).atBridgeCOM,
                textAlign: TextAlign.center,
                textStyle: textTheme.titleLarge?.copyWith(
                  color: ColorSchemes.iconDarkWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                speed: const Duration(milliseconds: 100),
              ),
            ],
          ),
      ],
    );
  }
}
