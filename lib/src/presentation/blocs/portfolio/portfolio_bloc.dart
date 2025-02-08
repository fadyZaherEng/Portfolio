import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/domain/usecase/get_language_use_case.dart';
import 'package:my_portfolio/src/domain/usecase/get_theme_use_case.dart';
import 'package:my_portfolio/src/domain/usecase/set_language_use_case.dart';
import 'package:my_portfolio/src/domain/usecase/set_theme_use_case.dart';

part 'portfolio_event.dart';

part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final GetLanguageUseCase _getLanguageUseCase;
  final SetLanguageUseCase _setLanguageUseCase;
  final SetThemeUseCase _setThemeUseCase;
  final GetThemeUseCase _getThemeUseCase;

  PortfolioBloc(
    this._getLanguageUseCase,
    this._setLanguageUseCase,
    this._setThemeUseCase,
    this._getThemeUseCase,
  ) : super(PortfolioInitial()) {
    on<PortfolioChangeLanguageEvent>(_onChangeLanguageEvent);
    on<PortfolioChangeThemeEvent>(_onChangeThemeEvent);
    on<PortfolioGetThemeEvent>(_onPortfolioGetThemeEvent);
    on<PortfolioGetLanguageEvent>(_onPortfolioGetLanguageEvent);
  }

  FutureOr<void> _onChangeLanguageEvent(
      PortfolioChangeLanguageEvent event, Emitter<PortfolioState> emit) {
    _setLanguageUseCase(event.locale);
    emit(PortfolioChangeLanguageState(locale: Locale(event.locale)));
  }

  FutureOr<void> _onChangeThemeEvent(
      PortfolioChangeThemeEvent event, Emitter<PortfolioState> emit) {
    _setThemeUseCase(event.theme);
    emit(PortfolioChangeThemeState(theme: event.theme));
  }

  FutureOr<void> _onPortfolioGetThemeEvent(
      PortfolioGetThemeEvent event, Emitter<PortfolioState> emit) {
    emit(PortfolioGetThemeState(isDark: _getThemeUseCase() == Constants.dark));
  }

  FutureOr<void> _onPortfolioGetLanguageEvent(
      PortfolioGetLanguageEvent event, Emitter<PortfolioState> emit) {
    emit(PortfolioGetLanguageState(locale: Locale(_getLanguageUseCase())));
  }
}
