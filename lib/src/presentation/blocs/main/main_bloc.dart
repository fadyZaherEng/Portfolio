import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/domain/usecase/get_language_use_case.dart';
import 'package:my_portfolio/src/domain/usecase/get_theme_use_case.dart';
import 'package:my_portfolio/src/domain/usecase/set_language_use_case.dart';
import 'package:my_portfolio/src/domain/usecase/set_theme_use_case.dart';
import 'package:my_portfolio/src/presentation/blocs/main/main_state.dart';

class MainCubit extends Cubit<MainState> {
  final GetLanguageUseCase _getLanguageUseCase;
  final SetLanguageUseCase _setLanguageUseCase;
  final SetThemeUseCase _setThemeUseCase;
  final GetThemeUseCase _getThemeUseCase;

  MainCubit(
    this._getLanguageUseCase,
    this._setLanguageUseCase,
    this._setThemeUseCase,
    this._getThemeUseCase,
  ) : super(InitialMainState(
          locale: const Locale('en'),
          theme: Constants.newDark,
        )) {
    getLanguageAndTheme();
  }

  void getLanguageAndTheme() async {
    const language = 'en';
    const theme = Constants.newDark;
    await _setLanguageUseCase(language);
    await _setThemeUseCase(theme);
    emit(InitialMainState(locale: Locale(language), theme: theme));
  }

  void changeLanguageAndTheme(String language, String theme) async {
    await _setLanguageUseCase(language);
    await _setThemeUseCase(theme);
    emit(InitialMainState(locale: Locale(language), theme: theme));
  }
}
