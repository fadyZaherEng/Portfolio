 import 'package:flutter/material.dart';
 import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';
import 'package:my_portfolio/src/di/data_layer_injector.dart';
import 'package:my_portfolio/src/domain/usecase/get_theme_use_case.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/about_me_content_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/animated_about_me_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/my_chapters_career_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/portfolio_image_widget.dart';

class AboutMeSectionWidget extends StatefulWidget {
  final void Function(bool) onOpenAboutMe;

  const AboutMeSectionWidget({
    super.key,
    required this.onOpenAboutMe,
  });

  @override
  State<AboutMeSectionWidget> createState() => _AboutMeSectionWidgetState();
}

class _AboutMeSectionWidgetState extends State<AboutMeSectionWidget> {
  bool aboutMeOpen = false;

  void _toggleAboutMe() {
    setState(() {
      aboutMeOpen = !aboutMeOpen;
      widget.onOpenAboutMe(aboutMeOpen);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        _buildHeader(textTheme),
        const SizedBox(height: 10),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: aboutMeOpen
              ? const AboutMeContentWidget()
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildHeader(TextTheme textTheme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const PortfolioImageWidget(),
        const SizedBox(width: 10),
        SizedBox(
          height: 120,
          child: AnimatedAboutMeWidget(
            onTap: _toggleAboutMe,
            isOpen: aboutMeOpen,
          ),
        ),
      ],
    );
  }
}





