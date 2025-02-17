import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/switch_widget.dart';
import 'package:skeletons/skeletons.dart';

class EndDrawerWidget extends StatelessWidget {
  final bool isDarkMode;
  final void Function(bool isDark) toggleTheme;
  final void Function(String) changeLocale;
  final void Function() onDrawerHomeTap;
  final void Function() onDrawerAboutTap;
  final void Function() onDrawerSkillsTap;
  final void Function() onDrawerExperienceTap;
  final void Function() onDrawerPortfolioTap;
  final void Function() onDrawerContactTap;
  final void Function() onDrawerTrainingTap;
  final void Function() onDrawerEducationTap;
  final void Function() onDrawerLogoTap;
  final void Function() onDrawerSkillsOfferTap;

  const EndDrawerWidget({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
    required this.changeLocale,
    required this.onDrawerHomeTap,
    required this.onDrawerAboutTap,
    required this.onDrawerSkillsTap,
    required this.onDrawerExperienceTap,
    required this.onDrawerPortfolioTap,
    required this.onDrawerContactTap,
    required this.onDrawerLogoTap,
    required this.onDrawerTrainingTap,
    required this.onDrawerEducationTap,
    required this.onDrawerSkillsOfferTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      semanticLabel: S.of(context).dashboard,
      backgroundColor: ColorSchemes.iconBackGround.withOpacity(0.7),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDrawerHeader(context),
            // BuildLogoWidget(
            //   imagePath: ImagePaths.newLogo3,
            //   color: ColorSchemes.primarySecondaryWhite,
            // ),
            Image(
              width: 70,
              height: 70,
              color: ColorSchemes.primarySecondaryWhite,
              fit: BoxFit.scaleDown,
              errorBuilder: (context, error, stackTrace) => SkeletonLine(
                style: SkeletonLineStyle(
                  height: 120,
                  width: 120,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              image: const AssetImage(ImagePaths.newLogo3),
            ),
            const SizedBox(height: 20),
            _buildDivider(),
            const SizedBox(height: 15),
            Column(
              children: [
                _buildMenuItem(
                  icon: Icons.home,
                  label: S.of(context).home,
                  onTap: onDrawerHomeTap,
                  context: context,
                ),
                const SizedBox(height: 15),
                _buildMenuItem(
                  icon: Icons.lightbulb,
                  label: S.of(context).skills,
                  onTap: onDrawerSkillsTap,
                  context: context,
                ),
                const SizedBox(height: 15),
                _buildMenuItem(
                  icon: Icons.local_offer,
                  label: S.of(context).skillsOffer,
                  onTap: onDrawerSkillsOfferTap,
                  context: context,
                ),
                const SizedBox(height: 15),
                _buildMenuItem(
                  icon: Icons.work,
                  label: S.of(context).experience,
                  onTap: onDrawerExperienceTap,
                  context: context,
                ),
                const SizedBox(height: 15),
                _buildMenuItem(
                  icon: Icons.cast_for_education,
                  label: S.of(context).education,
                  onTap: onDrawerEducationTap,
                  context: context,
                ),
                const SizedBox(height: 15),
                _buildMenuItem(
                  icon: Icons.pages,
                  label: S.of(context).portfolio,
                  onTap: onDrawerPortfolioTap,
                  context: context,
                ),
                const SizedBox(height: 15),
                _buildMenuItem(
                  icon: Icons.contact_support,
                  label: S.of(context).contact,
                  onTap: onDrawerContactTap,
                  context: context,
                ),
                const SizedBox(height: 15),
                _buildMenuItem(
                  icon: Icons.model_training,
                  label: S.of(context).training,
                  onTap: onDrawerTrainingTap,
                  context: context,
                ),
              ],
            ),
            const SizedBox(height: 15),
            _buildDivider(),
            const SizedBox(height: 5),
            IOSSwitchWithThumbImage(
              isDarkMode: isDarkMode,
              toggleTheme: (value) => toggleTheme(value),
            ),
            const SizedBox(height: 5),
            _buildDivider(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLanguageButton('English', 'en', context),
                  _buildLanguageButton('العربية', 'ar', context),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: ColorSchemes.primarySecondaryWhite,
              size: 20,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ColorSchemes.white,
                    fontWeight: Constants.fontWeightBold,
                    fontSize: 13,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageButton(
    String label,
    String locale,
    BuildContext context,
  ) {
    return ElevatedButton(
      onPressed: () => changeLocale(locale),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        side: BorderSide(color: ColorSchemes.primarySecondaryWhite, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorSchemes.white,
              fontWeight: Constants.fontWeightBold,
              fontSize: 13,
            ),
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorSchemes.primary,
            ColorSchemes.iconBackGround,
            ColorSchemes.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: onDrawerLogoTap,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(ImagePaths.fady),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                ImagePaths.close,
                colorFilter: ColorFilter.mode(
                  ColorSchemes.primarySecondaryWhite,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              "${S.of(context).dashboard}     ",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: ColorSchemes.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      color: ColorSchemes.white,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
