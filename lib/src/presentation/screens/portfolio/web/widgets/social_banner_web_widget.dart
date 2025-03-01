import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/core/utils/launch_social_media.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';
import 'package:my_portfolio/src/core/utils/show_snack_bar.dart';
import 'package:my_portfolio/src/di/data_layer_injector.dart';
import 'package:my_portfolio/src/domain/usecase/get_theme_use_case.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/custom_footer_social_icon_web_widget.dart';

class SocialBannerWebWidget extends StatelessWidget {
  final String currentLocale;

  const SocialBannerWebWidget({super.key, required this.currentLocale});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = GetThemeUseCase(injector())() == Constants.dark;
    final iconColor =
        isDarkMode ? ColorSchemes.white : ColorSchemes.iconBackGround;
    final double spacing = MediaQuery.of(context).size.height * 0.009;

    Widget buildSocialIcon({
      required IconData icon,
      required VoidCallback onPressed,
    }) {
      return CustomFooterSocialIconWebWidget(
        social: IconButton(
          icon: FaIcon(icon, color: iconColor, size: 25),
          onPressed: onPressed,
        ),
      );
    }

    final socialLinks = [
      {
        'icon': FontAwesomeIcons.github,
        'url': 'https://github.com/fadyZaherEng'
      },
      {'icon': FontAwesomeIcons.envelope, 'url': 'mailto:fedo.zaher@gmail.com'},
      {
        'icon': FontAwesomeIcons.whatsapp,
        'onPressed': () => launchWhatsApp(
              phoneNumber: "+201273826361",
              onOpenWhatsappFailed: () {
                showSnackBar(
                  context: context,
                  message: S.of(context).failedToLaunchWhatsApp,
                  color: ColorSchemes.snackBarWarning,
                );
              },
            ),
      },
      {
        'icon': FontAwesomeIcons.linkedin,
        'url': 'https://www.linkedin.com/in/fadyzaher'
      },
      {
        'icon': FontAwesomeIcons.facebook,
        'url': 'https://www.facebook.com/share/18gTWiitR2/'
      },
      {
        'icon': FontAwesomeIcons.youtube,
        'url': 'https://youtube.com/@fadyzaher2980'
      },
    ];

    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.3,
      right: currentLocale == "en" ? 0 : null,
      left: currentLocale == "ar" ? 0 : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.rotate(
            angle: 90 * pi / 180,
            child: currentLocale == "en"
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        S.of(context).followMe,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: ColorSchemes.iconDarkWhite,
                            ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        height: 3.5,
                        width: 50,
                        color: ColorSchemes.iconDarkWhite,
                      ),
                      const SizedBox(width: 6),
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 6),
                      Container(
                        height: 3.5,
                        width: 50,
                        color: ColorSchemes.iconDarkWhite,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        S.of(context).followMe,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: ColorSchemes.iconDarkWhite,
                            ),
                      ),
                    ],
                  ),
          ),
          SizedBox(height: currentLocale == "en" ? 70 : 40),
          ...socialLinks.map(
            (social) => Padding(
              padding: EdgeInsets.only(bottom: spacing),
              child: buildSocialIcon(
                icon: social['icon'] as IconData,
                onPressed: () {
                  try {
                    if (social.containsKey('onPressed')) {
                      (social['onPressed'] as VoidCallback)();
                    } else {
                      openLink(social['url'] as String);
                    }
                  } catch (e) {
                    debugPrint("Error opening link: $e");
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
