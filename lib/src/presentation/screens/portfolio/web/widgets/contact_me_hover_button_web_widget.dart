import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/core/utils/launch_social_media.dart';
import 'package:my_portfolio/src/core/utils/show_snack_bar.dart';
import 'package:my_portfolio/src/di/data_layer_injector.dart';
import 'package:my_portfolio/src/domain/usecase/get_theme_use_case.dart';

class ContactMeHoverButtonWebWidget extends StatefulWidget {
  const ContactMeHoverButtonWebWidget({super.key});

  @override
  _ContactMeHoverButtonWebWidgetState createState() =>
      _ContactMeHoverButtonWebWidgetState();
}

class _ContactMeHoverButtonWebWidgetState
    extends State<ContactMeHoverButtonWebWidget> {
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
                message: S.of(context).failedToLaunchWhatsApp,
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
                ColorSchemes.secondary.withOpacity(0.7),
                ColorSchemes.iconBackGround,
                ColorSchemes.primary.withOpacity(0.7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(12),
            shape: BoxShape.rectangle,
            color: ColorSchemes.primarySecondary,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_isHovered ? 0.4 : 0.2),
                blurRadius: _isHovered ? 12 : 6,
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
                  fontWeight: FontWeight.w600,
                  fontSize: _isHovered ? 20 : 18,
                ),
          ),
        ),
      ),
    );
  }
}
