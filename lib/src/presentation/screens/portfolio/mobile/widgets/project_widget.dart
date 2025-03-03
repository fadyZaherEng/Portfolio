import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/mobile/widgets/custom_resume_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/mobile/widgets/project_card_widget.dart';

class ProjectsWidgets extends StatefulWidget {
  final bool isDarkMode;

  const ProjectsWidgets({
    super.key,
    required this.isDarkMode,
  });

  @override
  State<ProjectsWidgets> createState() => _ProjectsWidgetsState();
}

class _ProjectsWidgetsState extends State<ProjectsWidgets> {
  List<ProjectModel> _myProjects = [];

  @override
  void initState() {
    super.initState();
    _myProjects.clear();
    _myProjects = Constants.projectList.getProjects();
  }

  @override
  Widget build(BuildContext context) {
    final Color textColor =
        widget.isDarkMode ? ColorSchemes.white : ColorSchemes.iconBackGround;
    final Color borderColor = widget.isDarkMode
        ? ColorSchemes.primarySecondaryWhite
        : ColorSchemes.iconBackGround;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width > 850 ? 20 : 0,
                ),
                child: Text(
                  S.of(context).myProjects,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorSchemes.iconDarkWhite,
                      ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width > 850 ? 50 : 0,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width > 850 ? 500 : null,
                  child: Text(
                    S.of(context).exploreMyProjects,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: ColorSchemes.iconDarkWhite,
                          height: 1.7,
                          letterSpacing: -0.25,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        ProjectCarouselWidget(_myProjects),
        const SizedBox(height: 30),
        CustomResumeWidget(
          onViewResumeTap: () => openLink('https://github.com/fadyZaherEng'),
          isDarkMode: widget.isDarkMode,
          borderColor: borderColor,
          textColor: textColor,
          title: S.of(context).seeMoreProjects,
          width: 250,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
