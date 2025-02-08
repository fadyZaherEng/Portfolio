import 'dart:ui';

abstract class MainState {}

class InitialMainState extends MainState {
  final Locale locale;
  final String theme;

  InitialMainState({
    required this.locale,
    required this.theme,
  });
}

