import 'dart:math';
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
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/my_chapters_widget.dart';

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
              ? const ExpandableSectionWidget()
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildHeader(TextTheme textTheme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ProfileImageWidget(),
        const SizedBox(width: 20),
        SizedBox(
          height: 120,
          child: AnimatedAboutMeButton(
            onTap: _toggleAboutMe,
            isOpen: aboutMeOpen,
          ),
        ),
      ],
    );
  }
}

class ProfileImageWidget extends StatefulWidget {
  const ProfileImageWidget({Key? key}) : super(key: key);

  @override
  _ProfileImageWidgetState createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    // أنيميشن الدخول الأساسي
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward(); // يبدأ بمجرد تحميل الصفحة

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _glowAnimation = Tween<double>(begin: 30, end: 5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: SlideTransition(
              position: _slideAnimation,
              child: Container(
                height: MediaQuery.sizeOf(context).width > 850 ? 250 : 200,
                width: MediaQuery.sizeOf(context).width > 850 ? 250 : 200,
                alignment: AlignmentDirectional.topEnd,
                // decoration: BoxDecoration(
                //   shape: BoxShape.circle,
                //   boxShadow: [
                //     BoxShadow(
                //       color: ColorSchemes.primary.withOpacity(0.3),
                //       blurRadius: _glowAnimation.value,
                //       spreadRadius: 10,
                //     ),
                //   ],
                //   image: const DecorationImage(
                //     fit: BoxFit.cover,
                //     image: AssetImage(ImagePaths.fady), // استبدل بمسار صورتك
                //   ),
                // ),
                child: const ProfileScreen(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // الدائرة العلوية (تكون فوق الصورة)
          Positioned(
            top: 15,
            child: CustomPaint(
              painter: FullCirclePainter(ColorSchemes.primarySecondary),
              size: const Size(150, 150),
            ),
          ),
          Positioned(
            bottom: 2,
            child: CustomPaint(
              painter: FullCirclePainter(ColorSchemes.primarySecondary.withOpacity(0.4)),
              size: const Size(150, 150),
            ),
          ),

          ClipOval(
            child: Image.asset(
              ImagePaths.fady, // استبدلها بصورتك
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          // الدائرة السفلية (تكون خلف الصورة)

         ],
      ),
    );
  }
}

// رسم الدائرة الكاملة
class FullCirclePainter extends CustomPainter {
  final Color color;

  FullCirclePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14; // زيادة سمك الدائرة

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 95, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class AnimatedAboutMeButton extends StatefulWidget {
  final VoidCallback onTap;
  final bool isOpen;

  const AnimatedAboutMeButton({
    Key? key,
    required this.onTap,
    required this.isOpen,
  }) : super(key: key);

  @override
  _AnimatedAboutMeButtonState createState() => _AnimatedAboutMeButtonState();
}

class _AnimatedAboutMeButtonState extends State<AnimatedAboutMeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.1, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 3.14).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant AnimatedAboutMeButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Wrap(
      children: [
        InkWell(
          onTap: widget.onTap,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BouncingAndScalingText(
                        title: S.of(context).aboutMe,
                        style: textTheme.titleLarge?.copyWith(
                          color: ColorSchemes.iconWhiteMode,
                          fontWeight: FontWeight.bold,
                          fontSize:
                              MediaQuery.sizeOf(context).width > 850 ? 22 : 18,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width > 850 ? 15 : 8),
                      Transform.rotate(
                        angle: _rotationAnimation.value,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                ColorSchemes.secondary,
                                ColorSchemes.iconBackGround,
                                ColorSchemes.primary,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                            color: ColorSchemes.primarySecondary,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                spreadRadius: 2,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: SvgPicture.asset(
                            ImagePaths.arrowDown,
                            color: ColorSchemes.primarySecondaryWhite,
                            width: 25,
                            height: 25,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ExpandableSectionWidget extends StatefulWidget {
  const ExpandableSectionWidget({Key? key}) : super(key: key);

  @override
  _ExpandableSectionWidgetState createState() =>
      _ExpandableSectionWidgetState();
}

class _ExpandableSectionWidgetState extends State<ExpandableSectionWidget>
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
              maxLines: 5,
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
            _buildInfoRow(Icons.email, "fedo.zaher@gmail.com"), 5),
        _buildAnimatedItem(_buildInfoRow(Icons.phone, "+201273826361"), 6),
        _buildAnimatedItem(_buildInfoRow(Icons.cake, "November 16, 1998"), 7),
        _buildAnimatedItem(_buildInfoRow(Icons.location_on, "Cairo, Egypt"), 8),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(
            icon,
            color: GetThemeUseCase(injector())() == Constants.dark
                ? const Color(0xFF9f695a)
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
          const CustomSocialButton(
            icon: ImagePaths.facebook,
            url: "https://facebook.com",
            title: "Facebook",
          ),
          9,
        ),
        _buildAnimatedItem(
          const CustomSocialButton(
            icon: ImagePaths.linkedin,
            url: "https://www.linkedin.com/in/fadyzaher",
            title: "LinkedIn",
          ),
          10,
        ),
        _buildAnimatedItem(
          const CustomSocialButton(
            icon: "",
            url: "",
            title: "",
            isGithub: true,
          ),
          11,
        ),
        _buildAnimatedItem(
          const CustomSocialButton(
            icon: ImagePaths.youtube,
            url: "https://youtube.com/@fadyzaher2980",
            title: "YouTube",
          ),
          12,
        ),
      ],
    );
  }
}

class CustomSocialButton extends StatefulWidget {
  final String icon;
  final String url;
  final String title;
  final bool isFacebook;
  final bool isGithub;

  const CustomSocialButton({
    Key? key,
    required this.icon,
    required this.url,
    required this.title,
    this.isFacebook = false,
    this.isGithub = false,
  }) : super(key: key);

  @override
  _CustomSocialButtonState createState() => _CustomSocialButtonState();
}

class _CustomSocialButtonState extends State<CustomSocialButton> {
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
