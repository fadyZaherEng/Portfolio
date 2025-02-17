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
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/contact_me_hover_button_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/custom_footer_social_icon_widget.dart';

class ContactMeWidget extends StatelessWidget {
  const ContactMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width > 850
                ? 850
                : MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                const SizedBox(height: 30),
                Text(
                  S.of(context).letsCreateSomethingAmazing,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: ColorSchemes.iconDarkWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).feelFreeToContactMe,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorSchemes.iconDarkWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                ),
                const SizedBox(height: 20),
                const ContactMeHoverButtonWidget(),
                const SizedBox(height: 30),
                Wrap(
                  spacing: MediaQuery.sizeOf(context).width > 850 ? 20 : 5,
                  children: [
                    CustomFooterSocialIconWidget(
                      social: IconButton(
                        icon: FaIcon(FontAwesomeIcons.github,
                            color:
                                GetThemeUseCase(injector())() == Constants.dark
                                    ? ColorSchemes.primarySecondaryWhite
                                    : ColorSchemes.iconBackGround,
                            size: MediaQuery.sizeOf(context).width > 850
                                ? 30
                                : 22),
                        onPressed: () =>
                            openLink('https://github.com/fadyZaherEng'),
                      ),
                    ),
                    CustomFooterSocialIconWidget(
                      social: IconButton(
                        icon: FaIcon(FontAwesomeIcons.envelope,
                            color:
                                GetThemeUseCase(injector())() == Constants.dark
                                    ? ColorSchemes.primarySecondaryWhite
                                    : ColorSchemes.iconBackGround,
                            size: MediaQuery.sizeOf(context).width > 850
                                ? 30
                                : 22),
                        onPressed: () => openLink('fedo.zaher@gmail.com'),
                      ),
                    ),
                    CustomFooterSocialIconWidget(
                      social: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: GetThemeUseCase(injector())() == Constants.dark
                              ? ColorSchemes.primarySecondaryWhite
                              : ColorSchemes.iconBackGround,
                          size:
                              MediaQuery.sizeOf(context).width > 850 ? 30 : 22,
                        ),
                        onPressed: () => launchWhatsApp(
                          phoneNumber: "+201273826361",
                          onOpenWhatsappFailed: () {
                            showSnackBar(
                              context: context,
                              message: S.of(context).failedToLaunchWhatsApp,
                              color: ColorSchemes.snackBarWarning,
                            );
                          },
                        ),
                      ),
                    ),
                    CustomFooterSocialIconWidget(
                      social: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.linkedin,
                          color: GetThemeUseCase(injector())() == Constants.dark
                              ? ColorSchemes.primarySecondaryWhite
                              : ColorSchemes.iconBackGround,
                          size:
                              MediaQuery.sizeOf(context).width > 850 ? 30 : 22,
                        ),
                        onPressed: () => openLink(
                          'https://www.linkedin.com/in/fadyzaher?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
                        ),
                      ),
                    ),
                    CustomFooterSocialIconWidget(
                      social: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.facebook,
                          color: GetThemeUseCase(injector())() == Constants.dark
                              ? ColorSchemes.primarySecondaryWhite
                              : ColorSchemes.iconBackGround,
                          size:
                              MediaQuery.sizeOf(context).width > 850 ? 30 : 22,
                        ),
                        onPressed: () =>
                            openLink('https://facebook.com/yourprofile'),
                      ),
                    ),
                    CustomFooterSocialIconWidget(
                      social: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.youtube,
                          color: GetThemeUseCase(injector())() == Constants.dark
                              ? ColorSchemes.primarySecondaryWhite
                              : ColorSchemes.iconBackGround,
                          size:
                              MediaQuery.sizeOf(context).width > 850 ? 30 : 22,
                        ),
                        onPressed: () => openLink(
                          'https://youtube.com/@fadyzaher2980?si=oTlLh6L2KhSK-tLG',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            end: MediaQuery.sizeOf(context).width > 850 ? 22 : 10,
          ),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width > 850
                ? null
                : MediaQuery.sizeOf(context).width * 0.9,
            child: Text(
              S.of(context).createdBy,
              style: TextStyle(
                fontSize: 14,
                color: ColorSchemes.primarySecondary,
                height: 2,
                letterSpacing: -0.24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).width > 850 ? 20 : 15),
      ],
    );
  }
}
