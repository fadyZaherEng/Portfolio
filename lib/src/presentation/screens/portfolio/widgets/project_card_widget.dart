import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';

class ProjectCarouselWidget extends StatefulWidget {
  final List<ProjectModel> myProjects;

  const ProjectCarouselWidget(this.myProjects, {super.key});

  @override
  _ProjectCarouselWidgetState createState() => _ProjectCarouselWidgetState();
}

class _ProjectCarouselWidgetState extends State<ProjectCarouselWidget> {
  int _currentIndex = 0;
  bool _showText = false;

  @override
  void initState() {
    super.initState();
    _startTextAnimation();
  }

  void _startTextAnimation() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _showText = true;
        });
      }
    });
  }

  @override
  void didUpdateWidget(covariant ProjectCarouselWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _showText = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: CarouselSlider.builder(
        itemCount: widget.myProjects.length,
        options: CarouselOptions(
          height: 330,
          autoPlay: true,
          enlargeCenterPage: true,
          autoPlayInterval: const Duration(seconds: 7),
          viewportFraction: 0.8,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
              _showText = false;
            });
            _startTextAnimation();
          },
        ),
        itemBuilder: (context, index, realIndex) {
          final project = widget.myProjects[index];

          return GestureDetector(
            onTap: () {
              openLink(project.url);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    // Background Image
                    Image.asset(
                      project.image,
                      fit: BoxFit.fitWidth,
                    ),

                    // Darker Gradient Overlay for Better Contrast
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.3),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      top: 0,
                      child: AnimatedOpacity(
                        opacity:
                            _showText && _currentIndex == index ? 1 : 0,
                        duration: const Duration(milliseconds: 600),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                            child: Container(
                               padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: ColorSchemes.primary.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: ColorSchemes.primary.withOpacity(0.15),
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      project.title,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      project.description,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Colors.white.withOpacity(0.9),
                                            fontSize: 15,
                                          ),
                                    ),
                                    const SizedBox(height: 12),
                                     ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: ColorSchemes
                                            .iconBackGround
                                            .withOpacity(0.3),
                                        shadowColor: Colors.transparent,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 10,
                                        ),
                                        side: BorderSide(
                                          color: Colors.white.withOpacity(0.8),
                                          width: 1.8,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Text(
                                        S.of(context).openLink,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                      ),
                                      onPressed: () => openLink(project.url),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
