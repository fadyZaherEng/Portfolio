import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/custom_resume_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/switch_widget.dart';
import 'package:skeletons/skeletons.dart';

class EndDrawerWidget extends StatelessWidget {
  final bool isDarkMode;
  final bool isEnglish;
  final void Function(bool isDark) toggleTheme;
  final void Function(String) changeLocale;
  final void Function() onDrawerLogoTap;

  final void Function() onDrawerSkillsTap;
  final void Function() onDrawerTrainingTap;
  final void Function() onDrawerGetInTouchTap;

  const EndDrawerWidget({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
    required this.changeLocale,
    required this.onDrawerLogoTap,
    required this.isEnglish,
    required this.onDrawerSkillsTap,
    required this.onDrawerTrainingTap,
    required this.onDrawerGetInTouchTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor =
        isDarkMode ? ColorSchemes.white : ColorSchemes.iconBackGround;
    final Color borderColor = isDarkMode
        ? ColorSchemes.primarySecondaryWhite
        : ColorSchemes.iconBackGround;
    return Drawer(
      semanticLabel: S.of(context).dashboard,
      backgroundColor: ColorSchemes.iconBackGround.withOpacity(0.7),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDrawerHeader(context),
            const SizedBox(height: 16),
            Text(
              S.of(context).fadyTag,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ColorSchemes.white,
                    fontSize: 22,
                  ),
            ),
            const SizedBox(height: 16),
            _buildDivider(),
            const SizedBox(height: 16),
            Image(
              width: 90,
              height: 90,
              color: ColorSchemes.primarySecondaryWhite,
              fit: BoxFit.scaleDown,
              errorBuilder: (context, error, stackTrace) => SkeletonLine(
                style: SkeletonLineStyle(
                  height: 90,
                  width: 90,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              image: const AssetImage(ImagePaths.newLogo3),
            ),
            const SizedBox(height: 16),
            _buildDivider(),
            const SizedBox(height: 16),
            Column(
              children: [
                _buildMenuItem(
                  icon: Icons.lightbulb,
                  label: S.of(context).skills,
                  onTap: onDrawerSkillsTap,
                  context: context,
                ),
                const SizedBox(height: 16),
                 _buildMenuItem(
                  icon: Icons.contact_mail,
                  label: S.of(context).getInTouch,
                  onTap: onDrawerGetInTouchTap,
                  context: context,
                ),
                const SizedBox(height: 16),
                _buildMenuItem(
                  icon: Icons.model_training,
                  label: S.of(context).training,
                  onTap: onDrawerTrainingTap,
                  context: context,
                ),
                const SizedBox(height: 16),
              ],
            ),
            _buildDivider(),
            const SizedBox(height: 16),
            CustomResumeWebWidget(
              onViewResumeTap: _openResume,
              isDarkMode: isDarkMode,
              borderColor: borderColor,
              textColor: textColor,
              title: S.of(context).resume,
              width: 100,
            ),
            const SizedBox(height: 16),
            _buildDivider(),
            const SizedBox(height: 16),
            IOSSwitchWithThumbImageWebWidget(
              isDarkMode: isDarkMode,
              toggleTheme: (value) => toggleTheme(value),
            ),
            const SizedBox(height: 16),
            _buildDivider(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: ColorSchemes.primarySecondaryWhite,
              size: 23,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ColorSchemes.white,
                    fontWeight: Constants.fontWeightBold,
                    fontSize: 17,
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
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () => changeLocale(locale),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          side: BorderSide(
            color: ColorSchemes.primarySecondaryWhite,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorSchemes.white,
                fontWeight: Constants.fontWeightBold,
                fontSize: 17,
              ),
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
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(ImagePaths.fedo2),
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

  void _openResume() async {
    await Future.delayed(const Duration(microseconds: 300));
    openLink(
      "https://drive.google.com/file/d/16UiIW2QpK9vzbG_gHXvgGTuWtzP5eWGD/view?usp=drivesdk",
    );
  }
}
