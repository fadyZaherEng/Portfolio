import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/animated_coloum_widget.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/animated_text_Widget.dart';

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
                // enlargeCenterPage: true,
                scrollPhysics: const BouncingScrollPhysics(),
                enableInfiniteScroll: false,
                autoPlayInterval: const Duration(seconds: 4),
                // disableCenter: true,
                aspectRatio: 2.2,
                onPageChanged: (index, reason) {},
              ),
            ),
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
