import 'dart:ui';

import 'package:my_portfolio/src/core/resources/shared_preferences_keys.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetThemeUseCase {
  final SharedPreferences sharedPreferences;

  GetThemeUseCase(this.sharedPreferences);

  String call() {
    return sharedPreferences.getString(SharedPreferenceKeys.theme) ??
        Constants.light;
  }
}
