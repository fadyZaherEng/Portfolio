// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Select Date`
  String get selectDate {
    return Intl.message(
      'Select Date',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `My Portfolio`
  String get appTitle {
    return Intl.message(
      'My Portfolio',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menuHeader {
    return Intl.message(
      'Menu',
      name: 'menuHeader',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Skills`
  String get skills {
    return Intl.message(
      'Skills',
      name: 'skills',
      desc: '',
      args: [],
    );
  }

  /// `Experience`
  String get experience {
    return Intl.message(
      'Experience',
      name: 'experience',
      desc: '',
      args: [],
    );
  }

  /// `Portfolio`
  String get portfolio {
    return Intl.message(
      'Portfolio',
      name: 'portfolio',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `What Can I Do?`
  String get WhatCanIDo {
    return Intl.message(
      'What Can I Do?',
      name: 'WhatCanIDo',
      desc: '',
      args: [],
    );
  }

  /// `Hello, Welcome to My Portfolio`
  String get welcomeMessage {
    return Intl.message(
      'Hello, Welcome to My Portfolio',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `I'm Fady Zaher, A Software Engineer`
  String get imFady {
    return Intl.message(
      'I\'m Fady Zaher, A Software Engineer',
      name: 'imFady',
      desc: '',
      args: [],
    );
  }

  /// `VIEW RESUME`
  String get ViewResume {
    return Intl.message(
      'VIEW RESUME',
      name: 'ViewResume',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `ANDROID APP`
  String get androidApp {
    return Intl.message(
      'ANDROID APP',
      name: 'androidApp',
      desc: '',
      args: [],
    );
  }

  /// `IOS APP`
  String get iosApp {
    return Intl.message(
      'IOS APP',
      name: 'iosApp',
      desc: '',
      args: [],
    );
  }

  /// `WEB APP`
  String get webApp {
    return Intl.message(
      'WEB APP',
      name: 'webApp',
      desc: '',
      args: [],
    );
  }

  /// `I offer tailored Flutter development services, specializing in building intuitive, high-performance mobile apps and websites with clean architecture, ensuring seamless user experiences and efficient solutions for your business needs.`
  String get offer {
    return Intl.message(
      'I offer tailored Flutter development services, specializing in building intuitive, high-performance mobile apps and websites with clean architecture, ensuring seamless user experiences and efficient solutions for your business needs.',
      name: 'offer',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Development for Android | iOS | Web`
  String get flutterTitle {
    return Intl.message(
      'Flutter Development for Android | iOS | Web',
      name: 'flutterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Passionate about building responsive, scalable cross-platform apps.`
  String get flutterDescription {
    return Intl.message(
      'Passionate about building responsive, scalable cross-platform apps.',
      name: 'flutterDescription',
      desc: '',
      args: [],
    );
  }

  /// `Flutter`
  String get flutter {
    return Intl.message(
      'Flutter',
      name: 'flutter',
      desc: '',
      args: [],
    );
  }

  /// `Dart`
  String get dart {
    return Intl.message(
      'Dart',
      name: 'dart',
      desc: '',
      args: [],
    );
  }

  /// `Firebase`
  String get firebase {
    return Intl.message(
      'Firebase',
      name: 'firebase',
      desc: '',
      args: [],
    );
  }

  /// `Responsive UI and Performance`
  String get responsiveUIAndPerformance {
    return Intl.message(
      'Responsive UI and Performance',
      name: 'responsiveUIAndPerformance',
      desc: '',
      args: [],
    );
  }

  /// `Clean Architecture`
  String get cleanArchitecture {
    return Intl.message(
      'Clean Architecture',
      name: 'cleanArchitecture',
      desc: '',
      args: [],
    );
  }

  /// `API Integration`
  String get apiIntegration {
    return Intl.message(
      'API Integration',
      name: 'apiIntegration',
      desc: '',
      args: [],
    );
  }

  /// `Continuous Integration`
  String get continuousIntegration {
    return Intl.message(
      'Continuous Integration',
      name: 'continuousIntegration',
      desc: '',
      args: [],
    );
  }

  /// `State Management`
  String get stateManagementTitle {
    return Intl.message(
      'State Management',
      name: 'stateManagementTitle',
      desc: '',
      args: [],
    );
  }

  /// `Efficiently manage app state using Flutter's state management solutions.`
  String get stateManagementDescription {
    return Intl.message(
      'Efficiently manage app state using Flutter\'s state management solutions.',
      name: 'stateManagementDescription',
      desc: '',
      args: [],
    );
  }

  /// `Bloc`
  String get bloc {
    return Intl.message(
      'Bloc',
      name: 'bloc',
      desc: '',
      args: [],
    );
  }

  /// `Riverpod`
  String get riverpod {
    return Intl.message(
      'Riverpod',
      name: 'riverpod',
      desc: '',
      args: [],
    );
  }

  /// `GetX`
  String get getX {
    return Intl.message(
      'GetX',
      name: 'getX',
      desc: '',
      args: [],
    );
  }

  /// `Provider`
  String get provider {
    return Intl.message(
      'Provider',
      name: 'provider',
      desc: '',
      args: [],
    );
  }

  /// `Clean Architecture`
  String get cleanArchitectureTitle {
    return Intl.message(
      'Clean Architecture',
      name: 'cleanArchitectureTitle',
      desc: '',
      args: [],
    );
  }

  /// `Implement clean architecture patterns for maintainable and testable code.`
  String get cleanArchitectureDescription {
    return Intl.message(
      'Implement clean architecture patterns for maintainable and testable code.',
      name: 'cleanArchitectureDescription',
      desc: '',
      args: [],
    );
  }

  /// `MVVM Architecture`
  String get mVVMArchitecture {
    return Intl.message(
      'MVVM Architecture',
      name: 'mVVMArchitecture',
      desc: '',
      args: [],
    );
  }

  /// `Web Development`
  String get webDevelopmentTitle {
    return Intl.message(
      'Web Development',
      name: 'webDevelopmentTitle',
      desc: '',
      args: [],
    );
  }

  /// `Proficient in HTML, CSS, JavaScript, and other web technologies for building dynamic and interactive web applications.`
  String get webDevelopmentDescription {
    return Intl.message(
      'Proficient in HTML, CSS, JavaScript, and other web technologies for building dynamic and interactive web applications.',
      name: 'webDevelopmentDescription',
      desc: '',
      args: [],
    );
  }

  /// `HTML`
  String get html {
    return Intl.message(
      'HTML',
      name: 'html',
      desc: '',
      args: [],
    );
  }

  /// `CSS`
  String get css {
    return Intl.message(
      'CSS',
      name: 'css',
      desc: '',
      args: [],
    );
  }

  /// `JavaScript`
  String get javascript {
    return Intl.message(
      'JavaScript',
      name: 'javascript',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'C#' key

  /// `.NetMvc`
  String get netMvc {
    return Intl.message(
      '.NetMvc',
      name: 'netMvc',
      desc: '',
      args: [],
    );
  }

  /// `API Integration`
  String get apiIntegrationTitle {
    return Intl.message(
      'API Integration',
      name: 'apiIntegrationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Integrate with APIs to fetch data and interact with external services.`
  String get apiIntegrationDescription {
    return Intl.message(
      'Integrate with APIs to fetch data and interact with external services.',
      name: 'apiIntegrationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Dio`
  String get dio {
    return Intl.message(
      'Dio',
      name: 'dio',
      desc: '',
      args: [],
    );
  }

  /// `Retrofit`
  String get retrofit {
    return Intl.message(
      'Retrofit',
      name: 'retrofit',
      desc: '',
      args: [],
    );
  }

  /// `HTTP`
  String get http {
    return Intl.message(
      'HTTP',
      name: 'http',
      desc: '',
      args: [],
    );
  }

  /// `Mockito`
  String get mockito {
    return Intl.message(
      'Mockito',
      name: 'mockito',
      desc: '',
      args: [],
    );
  }

  /// `Socket`
  String get socket {
    return Intl.message(
      'Socket',
      name: 'socket',
      desc: '',
      args: [],
    );
  }

  /// `Responsive UI`
  String get responsiveUITitle {
    return Intl.message(
      'Responsive UI',
      name: 'responsiveUITitle',
      desc: '',
      args: [],
    );
  }

  /// `Design responsive and user-friendly interfaces for a consistent user experience across different screen sizes and devices.`
  String get responsiveUIDescription {
    return Intl.message(
      'Design responsive and user-friendly interfaces for a consistent user experience across different screen sizes and devices.',
      name: 'responsiveUIDescription',
      desc: '',
      args: [],
    );
  }

  /// `Responsive`
  String get responsive {
    return Intl.message(
      'Responsive',
      name: 'responsive',
      desc: '',
      args: [],
    );
  }

  /// `Adaptive`
  String get adaptive {
    return Intl.message(
      'Adaptive',
      name: 'adaptive',
      desc: '',
      args: [],
    );
  }

  /// `Adaptive UI`
  String get adaptiveUI {
    return Intl.message(
      'Adaptive UI',
      name: 'adaptiveUI',
      desc: '',
      args: [],
    );
  }

  /// `Performance Optimization`
  String get performanceOptimizationTitle {
    return Intl.message(
      'Performance Optimization',
      name: 'performanceOptimizationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Optimize app performance to ensure smooth user interactions and smooth navigation.`
  String get performanceOptimizationDescription {
    return Intl.message(
      'Optimize app performance to ensure smooth user interactions and smooth navigation.',
      name: 'performanceOptimizationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Optimization`
  String get optimization {
    return Intl.message(
      'Optimization',
      name: 'optimization',
      desc: '',
      args: [],
    );
  }

  /// `Performance`
  String get performance {
    return Intl.message(
      'Performance',
      name: 'performance',
      desc: '',
      args: [],
    );
  }

  /// `Memory Management`
  String get memoryManagement {
    return Intl.message(
      'Memory Management',
      name: 'memoryManagement',
      desc: '',
      args: [],
    );
  }

  /// `Testing and Debugging`
  String get testingAndDebuggingTitle {
    return Intl.message(
      'Testing and Debugging',
      name: 'testingAndDebuggingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Perform unit and integration testing to ensure code quality and stability.`
  String get testingAndDebuggingDescription {
    return Intl.message(
      'Perform unit and integration testing to ensure code quality and stability.',
      name: 'testingAndDebuggingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Testing`
  String get testing {
    return Intl.message(
      'Testing',
      name: 'testing',
      desc: '',
      args: [],
    );
  }

  /// `Debugging`
  String get debugging {
    return Intl.message(
      'Debugging',
      name: 'debugging',
      desc: '',
      args: [],
    );
  }

  /// `Unit Testing`
  String get unitTesting {
    return Intl.message(
      'Unit Testing',
      name: 'unitTesting',
      desc: '',
      args: [],
    );
  }

  /// `Integration Testing`
  String get integrationTesting {
    return Intl.message(
      'Integration Testing',
      name: 'integrationTesting',
      desc: '',
      args: [],
    );
  }

  /// `Performance Testing`
  String get performanceTesting {
    return Intl.message(
      'Performance Testing',
      name: 'performanceTesting',
      desc: '',
      args: [],
    );
  }

  /// `Security Testing`
  String get securityTesting {
    return Intl.message(
      'Security Testing',
      name: 'securityTesting',
      desc: '',
      args: [],
    );
  }

  /// `Continuous Integration`
  String get continuousIntegrationTitle {
    return Intl.message(
      'Continuous Integration',
      name: 'continuousIntegrationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Implement continuous integration and deployment pipelines for automated builds and deployments.`
  String get continuousIntegrationDescription {
    return Intl.message(
      'Implement continuous integration and deployment pipelines for automated builds and deployments.',
      name: 'continuousIntegrationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Jenkins`
  String get jenkins {
    return Intl.message(
      'Jenkins',
      name: 'jenkins',
      desc: '',
      args: [],
    );
  }

  /// `Git`
  String get git {
    return Intl.message(
      'Git',
      name: 'git',
      desc: '',
      args: [],
    );
  }

  /// `GitHub`
  String get github {
    return Intl.message(
      'GitHub',
      name: 'github',
      desc: '',
      args: [],
    );
  }

  /// `GitHub Actions`
  String get githubActions {
    return Intl.message(
      'GitHub Actions',
      name: 'githubActions',
      desc: '',
      args: [],
    );
  }

  /// `Bitbucket`
  String get bitbucket {
    return Intl.message(
      'Bitbucket',
      name: 'bitbucket',
      desc: '',
      args: [],
    );
  }

  /// `Bitbucket Pipeline`
  String get bitbucketPipeline {
    return Intl.message(
      'Bitbucket Pipeline',
      name: 'bitbucketPipeline',
      desc: '',
      args: [],
    );
  }

  /// `Local Data Storage and Offline Support`
  String get localDataStorageAndOfflineSupportTitle {
    return Intl.message(
      'Local Data Storage and Offline Support',
      name: 'localDataStorageAndOfflineSupportTitle',
      desc: '',
      args: [],
    );
  }

  /// `Implement local data storage and provide offline support for your app.`
  String get localDataStorageAndOfflineSupportDescription {
    return Intl.message(
      'Implement local data storage and provide offline support for your app.',
      name: 'localDataStorageAndOfflineSupportDescription',
      desc: '',
      args: [],
    );
  }

  /// `Hive`
  String get hive {
    return Intl.message(
      'Hive',
      name: 'hive',
      desc: '',
      args: [],
    );
  }

  /// `SQFLite`
  String get sqflite {
    return Intl.message(
      'SQFLite',
      name: 'sqflite',
      desc: '',
      args: [],
    );
  }

  /// `Shared Preferences`
  String get sharedPreferences {
    return Intl.message(
      'Shared Preferences',
      name: 'sharedPreferences',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Secure Storage`
  String get flutterSecureStorage {
    return Intl.message(
      'Flutter Secure Storage',
      name: 'flutterSecureStorage',
      desc: '',
      args: [],
    );
  }

  /// `Push Notifications`
  String get pushNotificationsTitle {
    return Intl.message(
      'Push Notifications',
      name: 'pushNotificationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Implement push notifications to provide real-time updates and notifications to your app's users.`
  String get pushNotificationsDescription {
    return Intl.message(
      'Implement push notifications to provide real-time updates and notifications to your app\'s users.',
      name: 'pushNotificationsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Local Notifications Plugin`
  String get flutterLocalNotificationsPlugin {
    return Intl.message(
      'Flutter Local Notifications Plugin',
      name: 'flutterLocalNotificationsPlugin',
      desc: '',
      args: [],
    );
  }

  /// `Firebase Messaging`
  String get firebaseMessaging {
    return Intl.message(
      'Firebase Messaging',
      name: 'firebaseMessaging',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Notification`
  String get flutterNotification {
    return Intl.message(
      'Flutter Notification',
      name: 'flutterNotification',
      desc: '',
      args: [],
    );
  }

  /// `Geolocation and Maps Integration`
  String get geolocationAndMapsIntegrationTitle {
    return Intl.message(
      'Geolocation and Maps Integration',
      name: 'geolocationAndMapsIntegrationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Implement geolocation and maps integration for your app.`
  String get geolocationAndMapsIntegrationDescription {
    return Intl.message(
      'Implement geolocation and maps integration for your app.',
      name: 'geolocationAndMapsIntegrationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Maps`
  String get maps {
    return Intl.message(
      'Maps',
      name: 'maps',
      desc: '',
      args: [],
    );
  }

  /// `Google Maps`
  String get googleMaps {
    return Intl.message(
      'Google Maps',
      name: 'googleMaps',
      desc: '',
      args: [],
    );
  }

  /// `Google Maps API`
  String get googleMapsApi {
    return Intl.message(
      'Google Maps API',
      name: 'googleMapsApi',
      desc: '',
      args: [],
    );
  }

  /// `Google Maps Plugin`
  String get googleMapsPlugin {
    return Intl.message(
      'Google Maps Plugin',
      name: 'googleMapsPlugin',
      desc: '',
      args: [],
    );
  }

  /// `Location Tracking`
  String get locationTracking {
    return Intl.message(
      'Location Tracking',
      name: 'locationTracking',
      desc: '',
      args: [],
    );
  }

  /// `Software Development Concepts`
  String get softwareDevelopmentConceptsTitle {
    return Intl.message(
      'Software Development Concepts',
      name: 'softwareDevelopmentConceptsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Understand the core concepts of software development and design patterns.`
  String get softwareDevelopmentConceptsDescription {
    return Intl.message(
      'Understand the core concepts of software development and design patterns.',
      name: 'softwareDevelopmentConceptsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Design Patterns`
  String get designPatterns {
    return Intl.message(
      'Design Patterns',
      name: 'designPatterns',
      desc: '',
      args: [],
    );
  }

  /// `Object-Oriented Programming`
  String get objectOrientedProgramming {
    return Intl.message(
      'Object-Oriented Programming',
      name: 'objectOrientedProgramming',
      desc: '',
      args: [],
    );
  }

  /// `Data Structures`
  String get dataStructures {
    return Intl.message(
      'Data Structures',
      name: 'dataStructures',
      desc: '',
      args: [],
    );
  }

  /// `Algorithms`
  String get algorithms {
    return Intl.message(
      'Algorithms',
      name: 'algorithms',
      desc: '',
      args: [],
    );
  }

  /// `Problem Solving`
  String get problemSolving {
    return Intl.message(
      'Problem Solving',
      name: 'problemSolving',
      desc: '',
      args: [],
    );
  }

  /// `Development Tools and Version Control`
  String get developmentToolsAndVersionControlTitle {
    return Intl.message(
      'Development Tools and Version Control',
      name: 'developmentToolsAndVersionControlTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose the right development tools and version control system for your project.`
  String get developmentToolsAndVersionControlDescription {
    return Intl.message(
      'Choose the right development tools and version control system for your project.',
      name: 'developmentToolsAndVersionControlDescription',
      desc: '',
      args: [],
    );
  }

  /// `Android Studio`
  String get androidStudio {
    return Intl.message(
      'Android Studio',
      name: 'androidStudio',
      desc: '',
      args: [],
    );
  }

  /// `Visual Studio`
  String get visualStudio {
    return Intl.message(
      'Visual Studio',
      name: 'visualStudio',
      desc: '',
      args: [],
    );
  }

  /// `IntelliJ IDEA`
  String get intellij {
    return Intl.message(
      'IntelliJ IDEA',
      name: 'intellij',
      desc: '',
      args: [],
    );
  }

  /// `Git`
  String get gitVersionControl {
    return Intl.message(
      'Git',
      name: 'gitVersionControl',
      desc: '',
      args: [],
    );
  }

  /// `GitHub`
  String get githubVersionControl {
    return Intl.message(
      'GitHub',
      name: 'githubVersionControl',
      desc: '',
      args: [],
    );
  }

  /// `Bitbucket`
  String get bitbucketVersionControl {
    return Intl.message(
      'Bitbucket',
      name: 'bitbucketVersionControl',
      desc: '',
      args: [],
    );
  }

  /// `GitLab`
  String get gitlabVersionControl {
    return Intl.message(
      'GitLab',
      name: 'gitlabVersionControl',
      desc: '',
      args: [],
    );
  }

  /// `Database Technologies`
  String get databaseTechnologiesTitle {
    return Intl.message(
      'Database Technologies',
      name: 'databaseTechnologiesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Implement database technologies for efficient and reliable data storage.`
  String get databaseTechnologiesDescription {
    return Intl.message(
      'Implement database technologies for efficient and reliable data storage.',
      name: 'databaseTechnologiesDescription',
      desc: '',
      args: [],
    );
  }

  /// `SqLite`
  String get sqLite {
    return Intl.message(
      'SqLite',
      name: 'sqLite',
      desc: '',
      args: [],
    );
  }

  /// `MySQL`
  String get mySQL {
    return Intl.message(
      'MySQL',
      name: 'mySQL',
      desc: '',
      args: [],
    );
  }

  /// `SQL Database`
  String get sqlDatabase {
    return Intl.message(
      'SQL Database',
      name: 'sqlDatabase',
      desc: '',
      args: [],
    );
  }

  /// `Additional Skills`
  String get additionalSkillsTitle {
    return Intl.message(
      'Additional Skills',
      name: 'additionalSkillsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Acquire additional skills and expertise to enhance your development capabilities.`
  String get additionalSkillsDescription {
    return Intl.message(
      'Acquire additional skills and expertise to enhance your development capabilities.',
      name: 'additionalSkillsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Python`
  String get python {
    return Intl.message(
      'Python',
      name: 'python',
      desc: '',
      args: [],
    );
  }

  /// `Java`
  String get java {
    return Intl.message(
      'Java',
      name: 'java',
      desc: '',
      args: [],
    );
  }

  /// `Kotlin`
  String get kotlin {
    return Intl.message(
      'Kotlin',
      name: 'kotlin',
      desc: '',
      args: [],
    );
  }

  /// `C Plus Plus`
  String get cPlusPlus {
    return Intl.message(
      'C Plus Plus',
      name: 'cPlusPlus',
      desc: '',
      args: [],
    );
  }

  /// `C Sharp`
  String get cSharp {
    return Intl.message(
      'C Sharp',
      name: 'cSharp',
      desc: '',
      args: [],
    );
  }

  /// `I'm Fady Zaher, a passionate Flutter Developer and Designer with a proven track record of creating beautiful, responsive, and interactive apps that focus on performance and user experience, bringing your ideas to life. With a strong background in design and a deep understanding of user experience, I am committed to delivering exceptional results that exceed expectations while staying up-to-date with the latest Flutter trends and technologies. I’m a Mid-Level Software Engineer, passionate about mobile development , looking for work as a Flutter Software Engineer to gain real experience and assist the organization in achieving its goals. If you're looking for a skilled Flutter Developer to take your app to the next level, let's collaborate and turn your vision into reality!`
  String get chaptersStory {
    return Intl.message(
      'I\'m Fady Zaher, a passionate Flutter Developer and Designer with a proven track record of creating beautiful, responsive, and interactive apps that focus on performance and user experience, bringing your ideas to life. With a strong background in design and a deep understanding of user experience, I am committed to delivering exceptional results that exceed expectations while staying up-to-date with the latest Flutter trends and technologies. I’m a Mid-Level Software Engineer, passionate about mobile development , looking for work as a Flutter Software Engineer to gain real experience and assist the organization in achieving its goals. If you\'re looking for a skilled Flutter Developer to take your app to the next level, let\'s collaborate and turn your vision into reality!',
      name: 'chaptersStory',
      desc: '',
      args: [],
    );
  }

  /// `Chapters Of My Career`
  String get myChapter {
    return Intl.message(
      'Chapters Of My Career',
      name: 'myChapter',
      desc: '',
      args: [],
    );
  }

  /// `‎‎+ 2 Years Experience As A`
  String get moreThanYearsExperienceAsA {
    return Intl.message(
      '‎‎+ 2 Years Experience As A',
      name: 'moreThanYearsExperienceAsA',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Developer`
  String get flutterDeveloper {
    return Intl.message(
      'Flutter Developer',
      name: 'flutterDeveloper',
      desc: '',
      args: [],
    );
  }

  /// `Mid Level Software Engineer`
  String get midLevelSoftwareEngineer {
    return Intl.message(
      'Mid Level Software Engineer',
      name: 'midLevelSoftwareEngineer',
      desc: '',
      args: [],
    );
  }

  /// `Software Engineer`
  String get softwareEngineer {
    return Intl.message(
      'Software Engineer',
      name: 'softwareEngineer',
      desc: '',
      args: [],
    );
  }

  /// `Mid Level Flutter Software Engineer`
  String get midLevelFlutterSoftwareEngineer {
    return Intl.message(
      'Mid Level Flutter Software Engineer',
      name: 'midLevelFlutterSoftwareEngineer',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Software Engineer`
  String get mobileSoftwareEngineer {
    return Intl.message(
      'Mobile Software Engineer',
      name: 'mobileSoftwareEngineer',
      desc: '',
      args: [],
    );
  }

  /// `Mobile App Development Intern`
  String get mobileAppDevelopmentIntern {
    return Intl.message(
      'Mobile App Development Intern',
      name: 'mobileAppDevelopmentIntern',
      desc: '',
      args: [],
    );
  }

  /// `Freelancer Mobile Software Engineer`
  String get mobileSoftwareEngineerFreelancer {
    return Intl.message(
      'Freelancer Mobile Software Engineer',
      name: 'mobileSoftwareEngineerFreelancer',
      desc: '',
      args: [],
    );
  }

  /// `My Projects`
  String get myProjects {
    return Intl.message(
      'My Projects',
      name: 'myProjects',
      desc: '',
      args: [],
    );
  }

  /// `Explore My Projects that showcase my skills and expertise in Flutter development.where I have successfully delivered innovative and user-friendly apps that meet the highest standards of performance and user experience.`
  String get exploreMyProjects {
    return Intl.message(
      'Explore My Projects that showcase my skills and expertise in Flutter development.where I have successfully delivered innovative and user-friendly apps that meet the highest standards of performance and user experience.',
      name: 'exploreMyProjects',
      desc: '',
      args: [],
    );
  }

  /// `Open Link`
  String get openLink {
    return Intl.message(
      'Open Link',
      name: 'openLink',
      desc: '',
      args: [],
    );
  }

  /// `About Me`
  String get aboutMe {
    return Intl.message(
      'About Me',
      name: 'aboutMe',
      desc: '',
      args: [],
    );
  }

  /// `I’m Mid Level Software Engineer, passionate about mobile development with ‎+ 2 Years of Experience, looking for work as Flutter Software Engineer to gain real experience and assist the organization to achieve their goals`
  String get aboutMeDescription {
    return Intl.message(
      'I’m Mid Level Software Engineer, passionate about mobile development with ‎+ 2 Years of Experience, looking for work as Flutter Software Engineer to gain real experience and assist the organization to achieve their goals',
      name: 'aboutMeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `Bachelor of computer and information science | Ain Shams University`
  String get university {
    return Intl.message(
      'Bachelor of computer and information science | Ain Shams University',
      name: 'university',
      desc: '',
      args: [],
    );
  }

  /// `Graduation Project  Body Language and emotion recognition website (Django-python)`
  String get universityDescription {
    return Intl.message(
      'Graduation Project  Body Language and emotion recognition website (Django-python)',
      name: 'universityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Excellent Graduation Project || Very Good (3.3 GPA) Cumulative Score `
  String get universityDegree {
    return Intl.message(
      'Excellent Graduation Project || Very Good (3.3 GPA) Cumulative Score ',
      name: 'universityDegree',
      desc: '',
      args: [],
    );
  }

  /// `Ain Shams University`
  String get ainShamsUniversity {
    return Intl.message(
      'Ain Shams University',
      name: 'ainShamsUniversity',
      desc: '',
      args: [],
    );
  }

  /// `Let's Create Something Amazing Together!`
  String get letsCreateSomethingAmazing {
    return Intl.message(
      'Let\'s Create Something Amazing Together!',
      name: 'letsCreateSomethingAmazing',
      desc: '',
      args: [],
    );
  }

  /// `Feel free to reach out if you'd like to discuss a project, a job opportunity, or simply want to connect.`
  String get feelFreeToContactMe {
    return Intl.message(
      'Feel free to reach out if you\'d like to discuss a project, a job opportunity, or simply want to connect.',
      name: 'feelFreeToContactMe',
      desc: '',
      args: [],
    );
  }

  /// `Contact Me`
  String get contactMe {
    return Intl.message(
      'Contact Me',
      name: 'contactMe',
      desc: '',
      args: [],
    );
  }

  /// `Training`
  String get training {
    return Intl.message(
      'Training',
      name: 'training',
      desc: '',
      args: [],
    );
  }

  /// `All rights reserved | Created by Fady Zaher © 2025  💜`
  String get createdBy {
    return Intl.message(
      'All rights reserved | Created by Fady Zaher © 2025  💜',
      name: 'createdBy',
      desc: '',
      args: [],
    );
  }

  /// `VIEW RESUME`
  String get viewResume {
    return Intl.message(
      'VIEW RESUME',
      name: 'viewResume',
      desc: '',
      args: [],
    );
  }

  /// `Failed to launch WhatsApp`
  String get failedToLaunchWhatsApp {
    return Intl.message(
      'Failed to launch WhatsApp',
      name: 'failedToLaunchWhatsApp',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Linkedin`
  String get linkedin {
    return Intl.message(
      'Linkedin',
      name: 'linkedin',
      desc: '',
      args: [],
    );
  }

  /// `YouTube`
  String get youtube {
    return Intl.message(
      'YouTube',
      name: 'youtube',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
