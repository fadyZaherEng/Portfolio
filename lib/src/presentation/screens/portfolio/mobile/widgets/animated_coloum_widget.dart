import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedColumnWidget extends StatefulWidget {
  final String logo;
  final bool isSvg;
  final String title;
  final String description;
  final List<String> skills;

  const AnimatedColumnWidget({
    Key? key,
    required this.logo,
    required this.isSvg,
    required this.title,
    required this.description,
    required this.skills,
  }) : super(key: key);

  @override
  _AnimatedColumnWidgetState createState() => _AnimatedColumnWidgetState();
}

class _AnimatedColumnWidgetState extends State<AnimatedColumnWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2), // يبدأ من الأسفل قليلًا
      end: Offset.zero, // يتحرك إلى موضعه الطبيعي
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.4 && !isVisible) {
      // يظهر إذا كان 30% منه مرئيًا
      setState(() => isVisible = true);
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: _onVisibilityChanged,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(widget.logo, isSvg: widget.isSvg),
              const SizedBox(height: 5),
              _buildTitle(context, widget.title),
              const SizedBox(height: 7),
              _buildDescription(context, widget.description),
              const SizedBox(height: 8),
              _buildSkillsList(context, widget.skills),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(
    String logoAssetPath, {
    bool isSvg = true,
  }) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: Colors.transparent,
      child: isSvg
          ? SvgPicture.asset(
              logoAssetPath,
              width: 60,
              height: 60,
              matchTextDirection: true,
              placeholderBuilder: (context) => Image.asset(
                ImagePaths.newLogo3,
              ),
              fit: BoxFit.cover,
            )
          : Image.asset(
              logoAssetPath,
              width: 60,
              height: 60,
              matchTextDirection: true,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                ImagePaths.newLogo3,
              ),
              fit: BoxFit.cover,
            ),
    );
  }

  Widget _buildTitle(
    BuildContext context,
    String title,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width > 850 ? 30 : 15,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: ColorSchemes.white,
            ),
      ),
    );
  }

  Widget _buildDescription(
    BuildContext context,
    String description,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width > 850 ? 50 : 20,
      ),
      child: Text(
        description,
        textAlign: TextAlign.center,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: ColorSchemes.white,
            ),
      ),
    );
  }

  Widget _buildSkillsList(
    BuildContext context,
    List<String> skills,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: skills.length > 5
            ? 2
            : MediaQuery.sizeOf(context).width > 850
                ? 16
                : 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: skills
            .map(
              (skill) => _buildSkillItemWidget(
                context,
                skill,
                moreThanFiveSkills: skills.length > 5,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildSkillItemWidget(
    BuildContext context,
    String skill, {
    bool moreThanFiveSkills = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: moreThanFiveSkills ? 2 : 4,
      ),
      child: Row(
        children: [
          Text(
            "🛠",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: MediaQuery.sizeOf(context).width > 850 ? 16 : 15,
                  fontWeight: FontWeight.bold,
                  color: ColorSchemes.secondary,
                ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              skill,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: ColorSchemes.white,
                    letterSpacing: -0.24,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
