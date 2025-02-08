import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';
import 'package:my_portfolio/src/di/data_layer_injector.dart';
import 'package:my_portfolio/src/domain/usecase/get_language_use_case.dart';
import 'dart:async';

import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/my_chapters_widget.dart';

class ProjectsWidgets extends StatefulWidget {
  const ProjectsWidgets({super.key});

  @override
  State<ProjectsWidgets> createState() => _ProjectsWidgetsState();
}

class _ProjectsWidgetsState extends State<ProjectsWidgets> {
  List<ProjectModel> _myProjects = [];

  @override
  void initState() {
    super.initState();
    _filledMyProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width > 850 ? 20 : 10,
                ),
                child: BouncingAndScalingText(
                  title: S.of(context).myProjects,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: ColorSchemes.iconDarkWhite,
                      ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width > 850 ? 50 : 10,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width > 850 ? 500 : 400,
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
      ],
    );
  }

  void _filledMyProjects() {
    _myProjects.clear();
    ProjectList projectList = ProjectList.fromJson({
      "projects": [
        {
          "title_en": "BMI Calculator Flutter App",
          "title_ar": "تطبيق حساب مؤشر كتلة الجسم (BMI)",
          "description_en":
              "A simple and accurate BMI calculator built with Flutter, helping users track their health easily.",
          "description_ar":
              "تطبيق بسيط ودقيق لحساب مؤشر كتلة الجسم، يساعد المستخدمين على تتبع صحتهم بسهولة.",
          "url": "https://youtu.be/kltVCMGuQyc?si=CMTw2KGD41WclZs9",
          "image": ImagePaths.bmi,
        },
        {
          "title_en": "Note Flutter App",
          "title_ar": "تطبيق الملاحظات",
          "description_en":
              "A powerful and user-friendly notes app to organize your thoughts and tasks efficiently.",
          "description_ar":
              "تطبيق سهل الاستخدام لإدارة الملاحظات وتنظيم المهام بفعالية.",
          "url": "https://youtu.be/8J06th_YF9Y?si=d26r1-KUGgbVtdEi",
          "image": ImagePaths.note,
        },
        {
          "title_en": "News Flutter App",
          "title_ar": "تطبيق الأخبار",
          "description_en":
              "A modern news app that delivers the latest updates from various sources with a sleek UI.",
          "description_ar":
              "تطبيق عصري يعرض آخر الأخبار من مصادر متعددة بواجهة أنيقة.",
          "url": "https://youtu.be/qOKh0Pr6zBQ?si=tQ5L7dBu-wSL_a6V",
          "image": ImagePaths.news,
        },
        {
          "title_en": "Shop Flutter App",
          "title_ar": "تطبيق المتجر الإلكتروني",
          "description_en":
              "A fully functional e-commerce app with a seamless shopping experience and a secure checkout.",
          "description_ar":
              "تطبيق تجارة إلكترونية متكامل يوفر تجربة تسوق سلسة وآمنة.",
          "url": "https://youtu.be/YJVuKHvgNyw?si=9F84JZlirzAJ7_Dt",
          "image": ImagePaths.shop,
        },
        {
          "title_en": "Facebook Flutter App",
          "title_ar": "تطبيق فيسبوك",
          "description_en":
              "A Facebook UI clone built with Flutter, showcasing beautiful layouts and smooth navigation.",
          "description_ar":
              "تصميم واجهة مستخدم لتطبيق فيسبوك باستخدام Flutter مع تنقل سلس.",
          "url": "https://youtu.be/8tA8-kiCV9w?si=-tVxGtiWY2nXQ_3x",
          "image": ImagePaths.faceBook,
        },
        {
          "title_en": "Ava Bishoy Church Flutter App",
          "title_ar": "تطبيق كنيسة آفا بيشوي",
          "description_en":
              "A dedicated church app for announcements, prayers, and community engagement.",
          "description_ar":
              "تطبيق مخصص لنشر الأخبار والصلوات والتواصل بين أفراد المجتمع الكنسي.",
          "url": "https://youtu.be/ixtkSz1Tu4o?si=9IA_hQnThtAq7ahL",
          "image": ImagePaths.ava,
        },
        {
          "title_en": "Weather Flutter App",
          "title_ar": "تطبيق الطقس",
          "description_en":
              "A weather forecast app providing real-time updates and accurate climate data.",
          "description_ar":
              "تطبيق يعرض توقعات الطقس الفورية مع بيانات دقيقة عن المناخ.",
          "url": "https://youtu.be/2fWnWXQVFDg?si=mjijVjfMM4imDZyu",
          "image": ImagePaths.weather,
        },
        {
          "title_en": "Quiz With GetX Flutter App",
          "title_ar": "تطبيق الاختبارات مع GetX",
          "description_en":
              "An interactive quiz app using GetX for state management, offering a fun learning experience.",
          "description_ar":
              "تطبيق اختبارات تفاعلي يستخدم GetX لإدارة الحالة ويوفر تجربة تعليمية ممتعة.",
          "url": "https://youtu.be/hnILZwVeJ04?si=hzStYKbC15X3q0d7",
          "image": ImagePaths.quiz,
        },
        {
          "title_en": "Drawing Flutter App",
          "title_ar": "تطبيق الرسم",
          "description_en":
              "A creative drawing app that allows users to sketch and save their artwork effortlessly.",
          "description_ar":
              "تطبيق يسمح للمستخدمين بالرسم وحفظ أعمالهم الفنية بسهولة.",
          "url": "https://youtu.be/AtbXGY_tp9c?si=18pmzTnY7QMUI8bL",
          "image": ImagePaths.drawing,
        },
        {
          "title_en": "Learning Game Flutter App",
          "title_ar": "تطبيق الألعاب التعليمية",
          "description_en":
              "An educational game designed to make learning fun and interactive for children.",
          "description_ar":
              "لعبة تعليمية تفاعلية للأطفال لتسهيل التعلم بطريقة ممتعة.",
          "url": "https://youtu.be/bSgN08SxA4Q?si=9ZdLqPMdfQ1xgYZD",
          "image": ImagePaths.learn,
        },
        {
          "title_en": "YouTube Flutter App",
          "title_ar": "تطبيق يوتيوب",
          "description_en":
              "A YouTube UI clone with smooth video playback and modern design elements.",
          "description_ar":
              "تصميم واجهة مستخدم مشابهة ليوتيوب مع تشغيل سلس للفيديوهات.",
          "url": "https://youtu.be/ZcOFyBazd6o?si=toR6-Pnl8sXFFXB8",
          "image": ImagePaths.youtuber,
        },
        {
          "title_en": "Orders Flutter App",
          "title_ar": "تطبيق إدارة الطلبات",
          "description_en":
              "An order management system that helps businesses track and process customer requests.",
          "description_ar":
              "نظام يساعد الشركات على تتبع وإدارة الطلبات من العملاء.",
          "url": "https://youtu.be/NfGRbS-3xec?si=1HyjgVTm63TVGc8u",
          "image": ImagePaths.orders,
        },
        {
          "title_en": "E-Commerce Android App",
          "title_ar": "تطبيق التجارة الإلكترونية للأندرويد",
          "description_en":
              "A full-fledged e-commerce app built for Android, featuring a smooth and secure checkout process.",
          "description_ar":
              "تطبيق متكامل للتجارة الإلكترونية مع تجربة دفع آمنة.",
          "url": "https://youtu.be/BPau6A6Ava8?si=XszmcHEOJq_-en7o",
          "image": ImagePaths.ecommerce,
        },
        {
          "title_en": "Smart Note Android App",
          "title_ar": "تطبيق الملاحظات الذكي",
          "description_en":
              "A smart notes app with cloud sync and advanced organization features.",
          "description_ar":
              "تطبيق ملاحظات ذكي يوفر مزامنة سحابية وميزات تنظيم متقدمة.",
          "url": "https://youtu.be/iy_bO99QnHU?si=1MqJUVKrmB9_ZWZM",
          "image": ImagePaths.androidNote,
        },
        {
          "title_en": "WhatsApp Android App",
          "title_ar": "تطبيق واتساب",
          "description_en":
              "A WhatsApp UI clone featuring real-time messaging and modern chat layouts.",
          "description_ar":
              "تصميم واجهة مستخدم لتطبيق واتساب يعرض ميزات الدردشة الفورية الحديثة.",
          "url": "https://youtu.be/ny7hKToTn0g?si=1nv4VWLTCDqldMdv",
          "image": ImagePaths.androidWhatsApp,
        }
      ]
    });
    _myProjects = projectList.getProjects();
  }
}

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
    Future.delayed(const Duration(seconds: 3), () {
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
          autoPlayInterval: const Duration(seconds: 10),
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
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  fit: StackFit.expand,
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
                      top: MediaQuery.sizeOf(context).width > 850 ? 50 : 25,
                      child: AnimatedOpacity(
                        opacity:
                            _showText && _currentIndex == index ? 1.0 : 0.0,
                        duration: const Duration(seconds: 1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                            child: Container(
                              // width: 400,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: ColorSchemes.primary.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: ColorSchemes.primary.withOpacity(0.15),
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    project.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20,
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
                                  // TODO add animation on mouse cursor
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

class ProjectModel {
  final String title;

  final String description;

  final String url;
  final String image;

  ProjectModel({
    required this.description,
    required this.title,
    required this.url,
    required this.image,
  });
}

class Project {
  final String titleEn;
  final String titleAr;
  final String descriptionEn;
  final String descriptionAr;
  final String url;
  final String image;

  Project({
    required this.titleEn,
    required this.titleAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.url,
    required this.image,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      titleEn: json['title_en'],
      titleAr: json['title_ar'],
      descriptionEn: json['description_en'],
      descriptionAr: json['description_ar'],
      url: json['url'],
      image: json['image'],
    );
  }
}

class ProjectList {
  final List<Project> projects;

  ProjectList({
    required this.projects,
  });

  factory ProjectList.fromJson(Map<String, dynamic> json) {
    var projectList = json['projects'] as List;
    List<Project> projects =
        projectList.map((i) => Project.fromJson(i)).toList();
    return ProjectList(projects: projects);
  }

  List<ProjectModel> getArProjects() {
    return projects
        .map((project) => ProjectModel(
              title: project.titleAr,
              description: project.descriptionAr,
              url: project.url,
              image: project.image,
            ))
        .toList();
  }

  List<ProjectModel> getEnProjects() {
    return projects
        .map((project) => ProjectModel(
              title: project.titleEn,
              description: project.descriptionEn,
              url: project.url,
              image: project.image,
            ))
        .toList();
  }

  List<ProjectModel> getProjects() {
    final getLanguageUseCase = GetLanguageUseCase(injector());
    if (getLanguageUseCase() == 'ar') {
      return getArProjects();
    } else {
      return getEnProjects();
    }
  }
}
