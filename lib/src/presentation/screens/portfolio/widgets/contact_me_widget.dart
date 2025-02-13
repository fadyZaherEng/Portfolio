import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/core/utils/launch_social_media.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';
import 'package:my_portfolio/src/core/utils/show_snack_bar.dart';
import 'package:my_portfolio/src/di/data_layer_injector.dart';
import 'package:my_portfolio/src/domain/usecase/get_theme_use_case.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/my_chapters_widget.dart';

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
                        fontSize: 26,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).feelFreeToContactMe,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorSchemes.iconDarkWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                ),

                const SizedBox(height: 20),

                // "Contact Me" Button
                ContactMeHoverButton(),
                const SizedBox(height: 30),
                // Social Media Icons
                Wrap(
                  spacing: MediaQuery.sizeOf(context).width > 850 ? 20 : 5,
                  children: [
                    CustomSocialButton(
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
                    CustomSocialButton(
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
                    CustomSocialButton(
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
                              message: "Failed To Launch WhatsApp",
                              color: ColorSchemes.snackBarWarning,
                             );
                          },
                        ),
                      ),
                    ),
                    CustomSocialButton(
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
                    CustomSocialButton(
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
                    CustomSocialButton(
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
        // Footer Text
        Padding(
          padding: EdgeInsetsDirectional.only(
            // start: MediaQuery.sizeOf(context).width > 850 ? 22 : 0,
            end: MediaQuery.sizeOf(context).width > 850 ? 22 : 45,
          ),
          child: Text(
            S.of(context).createdBy,
            style: TextStyle(
              fontSize: MediaQuery.sizeOf(context).width > 850 ? 14 : 12,
              color: ColorSchemes.primarySecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).width > 850 ? 20 : 15),
      ],
    );
  }
}

class ContactMeHoverButton extends StatefulWidget {
  @override
  _ContactMeHoverButtonState createState() => _ContactMeHoverButtonState();
}

class _ContactMeHoverButtonState extends State<ContactMeHoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: () {
          launchWhatsApp(
            phoneNumber: "+201273826361",
            onOpenWhatsappFailed: () {
              showSnackBar(
                context: context,
                message: "Failed To Launch WhatsApp",
                color: ColorSchemes.snackBarWarning,
               );
            },
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorSchemes.secondary,
                ColorSchemes.iconBackGround,
                ColorSchemes.primary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            shape: BoxShape.rectangle,
            color: ColorSchemes.primarySecondary,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_isHovered ? 0.4 : 0.2),
                blurRadius: _isHovered ? 12 : 8,
                spreadRadius: _isHovered ? 4 : 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            S.of(context).contactMe,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: GetThemeUseCase(injector())() == Constants.dark
                      ? ColorSchemes.iconDarkWhite
                      : ColorSchemes.white,
                  fontWeight: FontWeight.bold,
                  fontSize: _isHovered ? 18 : 16, // تكبير النص عند التحويم
                ),
          ),
        ),
      ),
    );
  }
}

class CustomSocialButton extends StatefulWidget {
  final Widget social;

  const CustomSocialButton({
    Key? key,
    required this.social,
  }) : super(key: key);

  @override
  _CustomSocialButtonState createState() => _CustomSocialButtonState();
}

class _CustomSocialButtonState extends State<CustomSocialButton> {
  bool _isHovered = false;

  void _openLink(String url) {
    openLink(url);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: _isHovered
            ? Matrix4.diagonal3Values(1.2, 1.2, 1.0) // Proper scaling
            : Matrix4.identity(),
        child: widget.social,
      ),
    );
  }
}
