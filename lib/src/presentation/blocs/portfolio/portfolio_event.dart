part of 'portfolio_bloc.dart';

@immutable
sealed class PortfolioEvent {}

class PortfolioChangeLanguageEvent extends PortfolioEvent {
  final String locale;

  PortfolioChangeLanguageEvent({required this.locale});
}

class PortfolioChangeThemeEvent extends PortfolioEvent {
  final String theme;

  PortfolioChangeThemeEvent({required this.theme});
}

class PortfolioGetThemeEvent extends PortfolioEvent {}

class PortfolioGetLanguageEvent extends PortfolioEvent {}
