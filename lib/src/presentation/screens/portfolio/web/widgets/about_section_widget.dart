import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/about_me_content_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/animated_about_me_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/portfolio_image_widget.dart';

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

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: MediaQuery.sizeOf(context).width * 0.17),
        _buildHeader(textTheme),
        const SizedBox(width: 10),
        const Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedAboutMeWidget(),
               AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: AboutMeContentWidget(),
              ),
            ],
          ),
        ),
        SizedBox(width: MediaQuery.sizeOf(context).width * 0.17),
      ],
    );
  }

  Widget _buildHeader(TextTheme textTheme) {
    return const Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PortfolioImageWidget(),
         ],
      ),
    );
  }
}
