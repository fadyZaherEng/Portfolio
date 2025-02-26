import 'package:flutter/material.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/about_me_content_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/animated_about_me_widget.dart';
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
              ? MediaQuery.of(context).size.width > 800
                  ? const Center(
                      child: SizedBox(
                        width: 850,
                        child: AboutMeContentWidget(),
                      ),
                    )
                  : const AboutMeContentWidget()
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildHeader(TextTheme textTheme) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PortfolioImageWidget(),
          const SizedBox(width: 10),
          AnimatedAboutMeWidget(
            onTap: _toggleAboutMe,
            isOpen: aboutMeOpen,
          )
        ],
      ),
    );
  }
}
