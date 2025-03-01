 import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';
import 'package:my_portfolio/src/di/data_layer_injector.dart';
import 'package:my_portfolio/src/domain/usecase/get_theme_use_case.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/contact_me_hover_button_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/custom_footer_social_icon_widget.dart';

class ContactMeWidget extends StatelessWidget {
  const ContactMeWidget({super.key});

   Widget buildSocialIcon({
    required IconData iconData,
    required String url,
    required BuildContext context,
  }) {
    return CustomFooterSocialIconWebWidget(
      social: IconButton(
        icon: FaIcon(
          iconData,
          color: _getIconColor(context),
          size: 28,
        ),
        onPressed: () => openLink(url),
      ),
    );
  }

   Color _getIconColor(BuildContext context) {
    return GetThemeUseCase(injector())() == Constants.dark
        ? ColorSchemes.white
        : ColorSchemes.iconBackGround;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: ColorSchemes.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 40),
                          Text(
                            S.of(context).letsCreateSomethingAmazing,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: ColorSchemes.iconDarkWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            S.of(context).feelFreeToContactMe,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: ColorSchemes.iconDarkWhite,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                          ),
                          const SizedBox(height: 40),
                          const ContactMeHoverButtonWebWidget(),
                        ],
                      ),
                      const Spacer(),
                      ClipOval(
                        child: Image.asset(
                          ImagePaths.fedo2,
                          width: 350,
                          height: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                    color: ColorSchemes.primarySecondary,
                    height: 2,
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Wrap(
                      spacing: 15,
                      children: [
                        buildSocialIcon(
                          iconData: FontAwesomeIcons.github,
                          url: 'https://github.com/fadyZaherEng',
                          context: context,
                        ),
                        buildSocialIcon(
                          iconData: FontAwesomeIcons.envelope,
                          url: 'mailto:fedo.zaher@gmail.com',
                          context: context,
                        ),
                        buildSocialIcon(
                          iconData: FontAwesomeIcons.whatsapp,
                          url: 'https://wa.me/+201273826361',
                          context: context,
                        ),
                        buildSocialIcon(
                          iconData: FontAwesomeIcons.linkedin,
                          url:
                              'https://www.linkedin.com/in/fadyzaher?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
                          context: context,
                        ),
                        buildSocialIcon(
                          iconData: FontAwesomeIcons.facebook,
                          url: 'https://www.facebook.com/share/18gTWiitR2/',
                          context: context,
                        ),
                        buildSocialIcon(
                          iconData: FontAwesomeIcons.youtube,
                          url:
                              'https://youtube.com/@fadyzaher2980?si=oTlLh6L2KhSK-tLG',
                          context: context,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Center(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).developedBy,
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorSchemes.primarySecondary,
                    height: 2,
                    letterSpacing: -0.24,
                  ),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () => openLink('https://github.com/fadyZaherEng'),
                  child: Text(
                    S.of(context).fadyZaher,
                    style: TextStyle(
                      fontSize: 25,
                      color: ColorSchemes.iconDarkWhite,
                      height: 2,
                      letterSpacing: -0.24,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  S.of(context).tag,
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorSchemes.primarySecondary,
                    height: 2,
                    letterSpacing: -0.24,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
