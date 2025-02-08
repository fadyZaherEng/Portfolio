import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/animated_text_Widget.dart';
import 'package:visibility_detector/visibility_detector.dart';

class OfferWidget extends StatefulWidget {
  final double height;

  const OfferWidget({
    Key? key,
    this.height = 350,
  }) : super(key: key);

  @override
  State<OfferWidget> createState() => _OfferWidgetState();
}

class _OfferWidgetState extends State<OfferWidget> {
  final CarouselController _controller = CarouselController();

  List<int> offers = List.generate(16, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width > 850
                  ? MediaQuery.sizeOf(context).width * 0.4
                  : 850,
              child: AnimatedTextWidget(
                text: S.of(context).offer,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                clipBehavior: Clip.none,
                height: widget.height,
                width: double.infinity,
                child: CarouselSlider(
                  items: offers.isEmpty
                      ? [_buildPlaceHolderImage()]
                      : offers.asMap().entries.map((entry) {
                          return Wrap(
                            children: [
                              _buildServiceCards(context)[entry.key],
                            ],
                          );
                        }).toList(),
                  carouselController: _controller,
                  options: CarouselOptions(
                    viewportFraction:
                        MediaQuery.of(context).size.width > 600 ? 0.26 : 0.46,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    scrollPhysics: const BouncingScrollPhysics(),
                    enableInfiniteScroll: false,
                    autoPlayInterval: const Duration(seconds: 5),
                    disableCenter: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        // _currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceHolderImage() {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(12),
          topEnd: Radius.circular(12),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(12),
          topEnd: Radius.circular(12),
        ),
        child: Image.asset(
          ImagePaths.imagePlaceHolder,
          fit: BoxFit.cover,
          height: 90,
        ),
      ),
    );
  }

  // Build Service Cards
  List<Widget> _buildServiceCards(BuildContext context) {
    return [
      _buildServiceCard(
        context: context,
        title: S.of(context).flutterTitle,
        description: S.of(context).flutterDescription,
        skills: [
          S.of(context).flutter,
          S.of(context).dart,
          S.of(context).firebase,
          S.of(context).responsiveUIAndPerformance,
          S.of(context).apiIntegration,
          S.of(context).continuousIntegration,
        ],
        logo: ImagePaths.flutter,
      ),
      _buildServiceCard(
        context: context,
        title: S.of(context).stateManagementTitle,
        description: S.of(context).stateManagementDescription,
        skills: [
          S.of(context).bloc,
          S.of(context).riverpod,
          S.of(context).provider,
          S.of(context).getX,
        ],
        logo: ImagePaths.state,
      ),
      _buildServiceCard(
        context: context,
        title: S.of(context).cleanArchitectureTitle,
        description: S.of(context).cleanArchitectureDescription,
        skills: [
          S.of(context).mVVMArchitecture,
        ],
        logo: ImagePaths.clean,
        isSvg: false,
      ),
      _buildServiceCard(
        context: context,
        title: S.of(context).webDevelopmentTitle,
        description: S.of(context).webDevelopmentDescription,
        skills: [
          S.of(context).html,
          S.of(context).css,
          S.of(context).javascript,
          S.of(context).cSharp,
          S.of(context).netMvc,
        ],
        logo: ImagePaths.dev,
      ),
      _buildServiceCard(
        context: context,
        title: S.of(context).apiIntegrationTitle,
        description: S.of(context).apiIntegrationDescription,
        skills: [
          S.of(context).dio,
          S.of(context).retrofit,
          S.of(context).socket,
          S.of(context).http,
          S.of(context).mockito,
        ],
        logo: ImagePaths.api,
        isSvg: false,
      ),
      _buildServiceCard(
        context: context,
        title: S.of(context).responsiveUITitle,
        description: S.of(context).responsiveUIDescription,
        skills: [
          S.of(context).responsive,
          S.of(context).adaptive,
          S.of(context).adaptiveUI,
        ],
        logo: ImagePaths.responsive,
        isSvg: false,
      ),
      _buildServiceCard(
        context: context,
        title: S.of(context).performanceOptimizationTitle,
        description: S.of(context).performanceOptimizationDescription,
        skills: [
          S.of(context).optimization,
          S.of(context).performance,
          S.of(context).memoryManagement,
        ],
        logo: ImagePaths.performance,
        isSvg: false,
      ),
      _buildServiceCard(
        context: context,
        title: S.of(context).testingAndDebuggingTitle,
        description: S.of(context).testingAndDebuggingDescription,
        skills: [
          S.of(context).testing,
          S.of(context).debugging,
          S.of(context).integrationTesting,
          S.of(context).unitTesting,
          S.of(context).securityTesting,
          S.of(context).performanceTesting,
        ],
        logo: ImagePaths.test,
      ),
      _buildServiceCard(
        context: context,
        title: S.of(context).continuousIntegrationTitle,
        description: S.of(context).continuousIntegrationDescription,
        skills: [
          S.of(context).jenkins,
          S.of(context).git,
          S.of(context).github,
          S.of(context).githubActions,
          S.of(context).bitbucket,
          S.of(context).bitbucketPipeline,
        ],
        logo: ImagePaths.conti,
        isSvg: false,
      ),
      _buildServiceCard(
        context: context,
        title: S.of(context).localDataStorageAndOfflineSupportTitle,
        description: S.of(context).localDataStorageAndOfflineSupportDescription,
        skills: [
          S.of(context).flutterSecureStorage,
          S.of(context).hive,
          S.of(context).sqflite,
          S.of(context).sharedPreferences,
        ],
        logo: ImagePaths.storage,
      ),
      _buildServiceCard(
        context: context,
        title: S.of(context).pushNotificationsTitle,
        description: S.of(context).pushNotificationsDescription,
        skills: [
          S.of(context).flutterLocalNotificationsPlugin,
          S.of(context).firebaseMessaging,
          S.of(context).flutterNotification,
        ],
        logo: ImagePaths.notifications,
        isSvg: false,
      ),
      _buildServiceCard(
        context: context,
        title: S.of(context).geolocationAndMapsIntegrationTitle,
        description: S.of(context).geolocationAndMapsIntegrationDescription,
        skills: [
          S.of(context).maps,
          S.of(context).googleMaps,
          S.of(context).googleMapsApi,
          S.of(context).googleMapsPlugin,
          S.of(context).locationTracking,
        ],
        logo: ImagePaths.map,
      ),
      _buildServiceCard(
        context: context,
        title: S.of(context).softwareDevelopmentConceptsTitle,
        description: S.of(context).softwareDevelopmentConceptsDescription,
        skills: [
          S.of(context).designPatterns,
          S.of(context).objectOrientedProgramming,
          S.of(context).dataStructures,
          S.of(context).algorithms,
          S.of(context).problemSolving,
        ],
        logo: ImagePaths.dev,
      ),
      _buildServiceCard(
        context: context,
        title: S.of(context).developmentToolsAndVersionControlTitle,
        description: S.of(context).developmentToolsAndVersionControlDescription,
        skills: [
          S.of(context).androidStudio,
          S.of(context).visualStudio,
          S.of(context).gitVersionControl,
          S.of(context).githubVersionControl,
          S.of(context).gitlabVersionControl,
          S.of(context).bitbucketVersionControl,
        ],
        logo: ImagePaths.versionControl,
        isSvg: false,
      ),
      _buildServiceCard(
        context: context,
        title: S.of(context).databaseTechnologiesTitle,
        description: S.of(context).databaseTechnologiesDescription,
        skills: [
          S.of(context).sqLite,
          S.of(context).mySQL,
          S.of(context).sqlDatabase,
        ],
        logo: ImagePaths.dataRecovery,
        isSvg: false,
      ),
      _buildServiceCard(
        context: context,
        title: S.of(context).additionalSkillsTitle,
        description: S.of(context).additionalSkillsDescription,
        skills: [
          S.of(context).java,
          S.of(context).cSharp,
          S.of(context).python,
          S.of(context).kotlin,
          S.of(context).cPlusPlus,
        ],
        logo: ImagePaths.extra,
      ),
      // Add other service cards here similarly...
    ];
  }

  Widget _buildServiceCard({
    required BuildContext context,
    required String title,
    required String description,
    required List<String> skills,
    required String logo,
    bool isSvg = true,
  }) {
    return Card(
      color: ColorSchemes.primaryOffer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      shadowColor: Colors.transparent,
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              ColorSchemes.primary,
              ColorSchemes.iconBackGround,
              ColorSchemes.white.withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width > 850 ? 10 : 4),
          child: Wrap(
            direction: Axis.horizontal,
            children: [
              AnimatedColumnWidget(
                logo: logo,
                isSvg: isSvg,
                title: title,
                description: description,
                skills: skills,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
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
    if (info.visibleFraction > 0.3 && !isVisible) {
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

  Widget _buildLogo(String logoAssetPath, {bool isSvg = true}) {
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

  Widget _buildDescription(BuildContext context, String description) {
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

  Widget _buildSkillsList(BuildContext context, List<String> skills) {
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
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorSchemes.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
