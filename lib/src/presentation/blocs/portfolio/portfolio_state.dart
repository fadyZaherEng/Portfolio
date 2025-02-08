part of 'portfolio_bloc.dart';

@immutable
sealed class PortfolioState {}

final class PortfolioInitial extends PortfolioState {}

final class PortfolioChangeLanguageState extends PortfolioState {
  final Locale locale;

  PortfolioChangeLanguageState({required this.locale});
}

final class PortfolioChangeThemeState extends PortfolioState {
  final String theme;

  PortfolioChangeThemeState({required this.theme});
}
final class PortfolioGetLanguageState extends PortfolioState {
  final Locale locale;

  PortfolioGetLanguageState({required this.locale});
}

final class PortfolioGetThemeState extends PortfolioState {
  final bool isDark;

  PortfolioGetThemeState({required this.isDark});
}