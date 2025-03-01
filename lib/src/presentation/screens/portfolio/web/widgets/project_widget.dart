import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/custom_resume_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/web/widgets/project_card_widget.dart';

class ProjectsWebWidgets extends StatefulWidget {
  final bool isDarkMode;

  const ProjectsWebWidgets({
    super.key,
    required this.isDarkMode,
  });

  @override
  State<ProjectsWebWidgets> createState() => _ProjectsWebWidgetsState();
}

class _ProjectsWebWidgetsState extends State<ProjectsWebWidgets> {
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  S.of(context).myProjects,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: ColorSchemes.iconDarkWhite,
                      ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    S.of(context).exploreMyProjects,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: ColorSchemes.iconDarkWhite,
                          height: 2,
                          letterSpacing: -0.1,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        ProjectGridWidget(_myProjects),
        const SizedBox(height: 30),
        CustomResumeWebWidget(
          onViewResumeTap: () => openLink('https://github.com/fadyZaherEng'),
          isDarkMode: widget.isDarkMode,
          borderColor: borderColor,
          textColor: textColor,
          title: S.of(context).seeMoreProjects,
          width: 400,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
