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

class AboutMeContentWidget extends StatefulWidget {
  const AboutMeContentWidget({Key? key}) : super(key: key);

  @override
  _AboutMeContentWidgetState createState() => _AboutMeContentWidgetState();
}

class _AboutMeContentWidgetState extends State<AboutMeContentWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    // تشغيل الأنيميشن عند فتح الشاشة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimatedItem(Widget child, int index) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: ColorSchemes.primary.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAnimatedItem(
            Text(
              S.of(context).aboutMeDescription,
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorSchemes.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
            ),
            0,
          ),
          const SizedBox(height: 10),
          _buildAnimatedItem(_buildDivider(), 1),
          _buildAnimatedItem(_buildContactInfo(), 2),
          const SizedBox(height: 10),
          _buildAnimatedItem(_buildDivider(), 3),
          _buildAnimatedItem(_buildSocialIcons(), 4),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      height: 2,
      color: Colors.white,
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAnimatedItem(
          InkWell(
              onTap: () {
                //open gmail
                openLink('mailto:fedo.zaher@gmail.com');
              },
              child: _buildInfoRow(Icons.email, "fedo.zaher@gmail.com", true)),
          5,
        ),
        _buildAnimatedItem(
          InkWell(
              onTap: () {
                //open phone
                openLink('tel:+201273826361');
              },
              child: _buildInfoRow(Icons.phone, "+201273826361", true)),
          6,
        ),
        _buildAnimatedItem(
            _buildInfoRow(Icons.cake, "November 16, 1998", false), 7),
        _buildAnimatedItem(
          InkWell(
            onTap: () {
              //open location
              openLink(
                'https://www.google.com/maps/place/cairo/@30.0444205,31.2357123,11z/data=!3m1!4b1!4m5!3m4!1s0x14583fa60b21be4d:0x4ee52f9e04c2efb4!8m2!3d30.0444205!4d31.2357123',
              );
            },
            child: _buildInfoRow(
              Icons.location_on,
              "Cairo, Egypt",
              true,
            ),
          ),
          8,
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text, isLink) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(
            icon,
            color: GetThemeUseCase(injector())() == Constants.dark
                ? ColorSchemes.secondary
                : ColorSchemes.white,
            size: 20,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorSchemes.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    decoration:
                        isLink ? TextDecoration.underline : TextDecoration.none,
                    decorationColor:GetThemeUseCase(injector())() == Constants.dark
                        ? ColorSchemes.white
                        :  ColorSchemes.black,
                    decorationThickness: 2,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      direction: Axis.horizontal,
      children: [
        _buildAnimatedItem(
            CustomSocialButtonWidget(
            icon: ImagePaths.facebook,
            url: "https://facebook.com",
            title: S.of(context).facebook,
          ),
          9,
        ),
        _buildAnimatedItem(
            CustomSocialButtonWidget(
            icon: ImagePaths.linkedin,
            url: "https://www.linkedin.com/in/fadyzaher",
            title: S.of(context).linkedin,
          ),
          10,
        ),
        _buildAnimatedItem(
          const CustomSocialButtonWidget(
            icon: "",
            url: "",
            title: "",
            isGithub: true,
          ),
          11,
        ),
        _buildAnimatedItem(
            CustomSocialButtonWidget(
            icon: ImagePaths.youtube,
            url: "https://youtube.com/@fadyzaher2980",
            title: S.of(context).youtube,
          ),
          12,
        ),
      ],
    );
  }
}

class CustomSocialButtonWidget extends StatefulWidget {
  final String icon;
  final String url;
  final String title;
  final bool isFacebook;
  final bool isGithub;

  const CustomSocialButtonWidget({
    Key? key,
    required this.icon,
    required this.url,
    required this.title,
    this.isFacebook = false,
    this.isGithub = false,
  }) : super(key: key);

  @override
  _CustomSocialButtonWidgetState createState() =>
      _CustomSocialButtonWidgetState();
}

class _CustomSocialButtonWidgetState extends State<CustomSocialButtonWidget> {
  bool _isHovered = false;

  void _openLink(String url) {
    openLink(url);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openLink(widget.url),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          transform: _isHovered
              ? Matrix4.diagonal3Values(1.2, 1.2, 1.0) // Proper scaling
              : Matrix4.identity(),
          child: widget.isGithub
              ? IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.github,
                    color: ColorSchemes.primarySecondaryWhite,
                    size: 22,
                  ),
                  onPressed: () => openLink('https://github.com/fadyZaherEng'),
                )
              : InkWell(
                  onTap: () => _openLink(widget.url),
                  child: SvgPicture.asset(
                    widget.icon,
                    color: ColorSchemes.primarySecondaryWhite,
                    width: widget.isFacebook ? 18 : 28,
                    height: widget.isFacebook ? 18 : 28,
                    fit: BoxFit.scaleDown,
                    semanticsLabel: widget.title,
                  ),
                ),
        ),
      ),
    );
  }
}
