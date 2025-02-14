import 'dart:ui';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/di/data_layer_injector.dart';
import 'package:my_portfolio/src/domain/usecase/get_language_use_case.dart';

class Constants {
  static const String englishFontFamily = "Montserrat";
  static const String arabicFontFamily = "Almarai";
  static const FontWeight fontWeightRegular = FontWeight.w400;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightSemiBold = FontWeight.w600;
  static const FontWeight fontWeightBold = FontWeight.w700;

  static const String max = "max";
  static const String high = "high";
  static const String low = "low";
  static const String min = "min";
  static const String defaultPriority = "default";
  static const String light = "light";
  static const String dark = "dark";
  static List<Training> trainings = [
    Training(
        title: "Mobile Competition",
        provider: "Ain Shams University",
        duration: "",
        year: 2021,
        url:
            "https://drive.google.com/file/d/1KJBBIEL6znUUZQyzTSOJWrLlA0omkv1h/view?usp=drivesdk"),
    Training(
        title: "Flutter Animation",
        provider: "Almentor",
        duration: "1 Month",
        year: 2024,
        url:
            "https://drive.google.com/file/d/1-Rtee7_YYkmPng5j1XJKLcq58N77Uovw/view?usp=drivesdk"),
    Training(
        title: "Flutter Advanced",
        provider: "Udemy",
        duration: "3 Months",
        year: 2023,
        url:
            "https://drive.google.com/file/d/1YHk3ONSs4Ra4bzSB2-A4AguQnHYpdrFP/view?usp=drivesdk"),
    Training(
        title: "Flutter UI",
        provider: "Almentor",
        duration: "1 Month",
        year: 2023,
        url:
            "https://drive.google.com/file/d/12t3466DFk_k9KUwv9LWLpDukZrlIV70U/view?usp=drive_link"),
    Training(
        title: "Mobile Development",
        provider: "Sparks Foundation",
        duration: "",
        year: 2023,
        url:
            "https://drive.google.com/file/d/1OyVnb67UL84BeviIcfjT7bfxHGQwOCxf/view?usp=drivesdk"),
    Training(
        title: "Flutter",
        provider: "Udemy",
        duration: "3 Months",
        year: 2022,
        url:
            "https://drive.google.com/file/d/1MwXRoucJslW5LSRiNJjeQkqTkgWPwYKI/view?usp=drivesdk"),
    Training(
        title: "Flutter",
        provider: "Udemy",
        duration: "3 Months",
        year: 2022,
        url:
            "https://drive.google.com/file/d/1tWBIAJnD5V3SQw_lvHaVV577Ch85uc6v/view?usp=drivesdk"),
    Training(
        title: "Dart Language",
        provider: "Udemy",
        duration: "1 Month",
        year: 2021,
        url:
            "https://drive.google.com/file/d/1XhtZgMhwmukd2__xD9DORIGQMpQ2ad0y/view?usp=drivesdk"),
    Training(
        title: "Android",
        provider: "Ain Shams University",
        duration: "",
        year: 2019,
        url:
            "https://drive.google.com/file/d/1KO9bouE4FDIXFL1ZkxiPKQh9exPjKPtU/view?usp=drivesdk"),
    Training(
        title: "Learn How to Learn",
        provider: "Almentor",
        duration: "",
        year: 2023,
        url:
            "https://drive.google.com/file/d/1owCK86u16JoQ83gHM63_c-z5CNqpVjo9/view?usp=drivesdk"),
    Training(
        title: "Flutter Animation",
        provider: "Udemy",
        duration: "1 Month ",
        year: 2024,
        url:
            "https://drive.google.com/file/d/1-Rtee7_YYkmPng5j1XJKLcq58N77Uovw/view?usp=drivesdk"),
    Training(
        title: "Graduation Certificate",
        provider: "Ain Shams University",
        duration: "",
        year: 2021,
        url:
            "https://drive.google.com/file/d/19HV2Y5YWlmNvbb5Fn-GCukes1G8xqaUp/view?usp=drivesdk"),
    Training(
        title: "Version Control",
        provider: "Almentor",
        duration: "",
        year: 2023,
        url:
            "https://drive.google.com/file/d/1AGGhH7xxdjalECqePdGFKeNM4BYDpTCc/view?usp=sharing"),
    Training(
        title: "Android Development",
        provider: "Russian Culture Center",
        duration: "3 Months",
        year: 2019,
        url:
            "https://drive.google.com/file/d/1KTIwg0-nGmUtbimBad3ywUmZ80B_Asal/view?usp=drivesdk"),
    Training(
        title: "Back-End Development",
        provider: "NP Learn",
        duration: "3 Months",
        year: 2022,
        url:
            "https://drive.google.com/file/d/1dhmZXn_TPZbZ4r9ZwFkiKpwuGwjdHwml/view?usp=drive_link"),
    Training(
        title: "Front-End Development",
        provider: "Udemy",
        duration: "2 Months",
        year: 2022,
        url:
            "https://drive.google.com/file/d/1cup8TQ14QIYxJw-Di3ynDuKm05r0Janu/view?usp=drivesdk"),
    Training(
        title: "Problem Solving",
        provider: "PST Coach",
        duration: "4 Months",
        year: 2018,
        url:
            "https://drive.google.com/file/d/1K2iv246DGrOZVaGwpHbHETacgVe8hrfU/view?usp=drivesdk"),
    Training(
        title: "C++ Language",
        provider: "RMS Company",
        duration: "2 Months",
        year: 2018,
        url:
            "https://drive.google.com/file/d/1KDCCRyCGLVjv_abjj1YqUyXUCyPDUW8s/view?usp=drivesdk"),
    Training(
        title: "Python Language",
        provider: "Ain Shams University",
        duration: "",
        year: 2018,
        url:
            "https://drive.google.com/file/d/1KNeYLqjxNe8__jnNrhCYSephesH9opPV/view?usp=drivesdk"),
    Training(
        title: "Advanced Communication Skills",
        provider: "Almentor",
        duration: "",
        year: 2024,
        url:
            "https://drive.google.com/file/d/1giJRvlpg2uHpufcyZFXXluRIttA89Zbi/view?usp=drivesdk"),
    Training(
        title: "Time Management & Productivity",
        provider: "Almentor",
        duration: "",
        year: 2023,
        url:
            "https://drive.google.com/file/d/1Fsf2JbIuDP8WL3xRrJPydTHHofH6y9yW/view?usp=drivesdk"),
    Training(
        title: "The 7 Communication SINS",
        provider: "Almentor",
        duration: "",
        year: 2023,
        url:
            "https://drive.google.com/file/d/1QjQ1caJDuw6vpsk0jg89P0e0r7Vgc98T/view?usp=drivesdk"),
    Training(
        title: "Impact of Life Skills on Success",
        provider: "Almentor",
        duration: "",
        year: 2024,
        url:
            "https://drive.google.com/file/d/1t-gLVnSTQyXeGp8M5CQCbxFdbmfOGRlg/view?usp=drivesdk"),
  ];

  static ProjectList projectList = ProjectList.fromJson({
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
        "description_ar": "تطبيق متكامل للتجارة الإلكترونية مع تجربة دفع آمنة.",
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
  static const Map<String, double> skills = {
    "Flutter": 0.9,
    "Database & Data Structures": 0.9,
    "OOP & Problem Solving": 0.9,
    "Design Patterns & SOLID Principles": 0.85,
    "Algorithms": 0.85,
    "C Plus Plus": 0.9,
    "Dart": 0.9,
    "C Sharp": 0.85,
    "Java": 0.85,
    "Python": 0.75,
    "Kotlin": 0.75,
    "SQL / MySQL": 0.75,
    "Operating Systems": 0.8,
    "Computer Architecture": 0.8,
    "Data Mining & Big Data": 0.7,
    "Machine Learning (Basic)": 0.6,
    "Deep Learning (Basic)": 0.6,
    "Software Engineering": 0.8,
    "Security  ": 0.75,
    "Agile Development": 0.8,
    "Postman & Mock Lab": 0.75,
    "SEO Knowledge": 0.65,
    "Version Control  ": 0.85,
    "Jira  ": 0.75,
    "Firebase": 0.85,
    "API Integration": 0.85,
    "State Management  ": 0.85,
    "Push Notifications  ": 0.8,
    "Asynchronous Programming  ": 0.85,
    "UI / UX Design": 0.8,
    "Custom UI  ": 0.8,
    "Dynamic & Reusable Widgets": 0.85,
  };
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

class Training {
  final String title;
  final String provider;
  final String duration;
  final int year;
  final String url;

  Training({
    required this.title,
    required this.provider,
    required this.duration,
    required this.year,
    required this.url,
  });
}
