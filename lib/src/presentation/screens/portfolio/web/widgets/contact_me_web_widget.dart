import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/custom_footer_social_icon_web_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/send_message_form_widget.dart';

class ContactMeWebWidget extends StatelessWidget {
  const ContactMeWebWidget({super.key});

  Widget buildSocialIcon({
    required IconData iconData,
    required String url,
    required BuildContext context,
  }) {
    return CustomFooterSocialIconWebWidget(
      social: IconButton(
        icon: FaIcon(
          iconData,
          color: ColorSchemes.white,
          size: 28,
        ),
        onPressed: () => openLink(url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: ColorSchemes.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: ColorSchemes.primary.withOpacity(0.1)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).letsCreateSomethingAmazing,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: ColorSchemes.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                  ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              S.of(context).feelFreeToContactMe,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: ColorSchemes.primary.withOpacity(0.7),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                            ),
                            const SizedBox(height: 40),
                            const Center(child: SendMessageFormWidget()),
                          ],
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              ImagePaths.fedo2,
                              width: 400,
                              height: 500,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Divider(color: ColorSchemes.primary.withOpacity(0.2)),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 20,
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
                        url: 'https://www.linkedin.com/in/fadyzaher',
                        context: context,
                      ),
                      buildSocialIcon(
                        iconData: FontAwesomeIcons.facebook,
                        url: 'https://www.facebook.com/share/18gTWiitR2/',
                        context: context,
                      ),
                    ],
                  ),
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
                    fontWeight: FontWeight.w500,
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
                      fontWeight: FontWeight.w500,
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
                    fontWeight: FontWeight.w500,
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
