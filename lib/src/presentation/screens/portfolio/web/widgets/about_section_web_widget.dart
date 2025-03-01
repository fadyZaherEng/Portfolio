import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/core/utils/launch_social_media.dart';
import 'package:my_portfolio/src/core/utils/show_snack_bar.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/about_me_content_web_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/animated_about_me_web_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/custom_resume_web_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/portfolio_image_web_widget.dart';

class AboutMeSectionWebWidget extends StatefulWidget {
  final void Function() onViewResumeTap;
  final bool isDarkMode;

  const AboutMeSectionWebWidget({
    super.key,
    required this.onViewResumeTap,
    required this.isDarkMode,
  });

  @override
  State<AboutMeSectionWebWidget> createState() => _AboutMeSectionWebWidgetState();
}

class _AboutMeSectionWebWidgetState extends State<AboutMeSectionWebWidget> {
  bool aboutMeOpen = false;

  @override
  Widget build(BuildContext context) {
    final Color textColor =
        widget.isDarkMode ? ColorSchemes.white : ColorSchemes.iconBackGround;
    final Color borderColor = widget.isDarkMode
        ? ColorSchemes.primarySecondaryWhite
        : ColorSchemes.iconBackGround;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: MediaQuery.sizeOf(context).width * 0.1),
        const PortfolioImageWebWidget(),
        const SizedBox(width: 10),
        const Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedAboutMeWebWidget(),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: AboutMeContentWebWidget(),
              ),
            ],
          ),
        ),
        const SizedBox(width: 40),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            CustomResumeWebWidget(
              onViewResumeTap: widget.onViewResumeTap,
              isDarkMode: widget.isDarkMode,
              textColor: textColor,
              borderColor: borderColor,
              title: S.of(context).downloadCv,
              width: 220,
              icon: Icons.download_rounded,
            ),
            const SizedBox(height: 20),
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
                height: 40,
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SvgPicture.asset(
                          ImagePaths.whatsapp,
                          width: 20,
                          height: 20,
                           color: ColorSchemes.primaryWhite,
                        ),
                      ),
                      Text(
                        S.of(context).hireMe,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: textColor,
                              fontSize: 19,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        SizedBox(width: MediaQuery.sizeOf(context).width * 0.1),
      ],
    );
  }
}
