import 'package:flutter/material.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/di/data_layer_injector.dart';
import 'package:my_portfolio/src/domain/usecase/get_theme_use_case.dart';

class ColorSchemes {
  static Color primary = GetThemeUseCase(injector())() == Constants.dark
      ? const Color(0xFF180040).withOpacity(0.8)
      : const Color(0xFF365352); // const Color(0xFF9f695a);
  static Color primaryOffer = GetThemeUseCase(injector())() == Constants.dark
      ? const Color(0xFF180040).withOpacity(0.8)
      : const Color(0xFF70a09c).withOpacity(0.88); //const Color(0xFFffe2dc);
  static Color primarySecondary =
      GetThemeUseCase(injector())() == Constants.dark
          ? const Color.fromRGBO(243, 154, 74, 1)
          : const Color(0xFF70a09c).withOpacity(0.8);
  static Color primarySecondaryWhite =
      GetThemeUseCase(injector())() == Constants.dark
          ? const Color.fromRGBO(243, 154, 74, 1)
          : ColorSchemes.white;
  static const Color secondary = Color.fromRGBO(243, 154, 74, 1);

   static Color primaryWhite = GetThemeUseCase(injector())() == Constants.dark
      ? white
      : const Color(0xFF70a09c).withOpacity(0.8);

  static Color iconBackGround = GetThemeUseCase(injector())() == Constants.dark
      ? const Color(0xFF000028)
      : const Color(0xFF70a09c).withOpacity(0.8); //const Color(0xFFffe2dc);
  static Color iconDarkWhite = GetThemeUseCase(injector())() == Constants.dark
      ? ColorSchemes.white
      : ColorSchemes.black.withOpacity(0.8);
  static Color iconWhiteMode = GetThemeUseCase(injector())() == Constants.dark
      ? ColorSchemes.white
      : ColorSchemes.primary;
  static Color appBarColor = GetThemeUseCase(injector())() == Constants.dark
      ? ColorSchemes.iconBackGround
      : ColorSchemes.white;
  static const Color black = Color.fromRGBO(34, 34, 34, 1);
  static const Color blackGrey = Color.fromRGBO(80, 80, 80, 1);
  static const Color logo = Color.fromRGBO(193, 153, 249, 1);
  static const Color redError = Color.fromRGBO(231, 54, 37, 1);
  static const Color red = Color.fromRGBO(220, 48, 39, 1);
  static const Color gray = Color.fromRGBO(152, 152, 152, 1);
  static const Color lightGray = Color.fromRGBO(217, 217, 217, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color whiteOpacity = Color.fromRGBO(255, 255, 255, 0.8);
  static const Color border = Color.fromRGBO(217, 217, 217, 1);
  static const Color searchBackground = Color.fromRGBO(245, 245, 245, 1);
  static const Color borderGray = Color.fromRGBO(222, 222, 222, 1);
  static const Color green = Color.fromRGBO(49, 212, 116, 1);
  static const Color shadowColor = Color.fromRGBO(246, 246, 248, 1);
  static const Color moreDivider = Color.fromRGBO(239, 240, 236, 1);
  static const Color cardSelected = Color.fromRGBO(241, 241, 241, 1);
  static const Color darkBlue = Color.fromRGBO(21, 44, 79, 1);
  static const Color priorityMax = Color.fromRGBO(255, 102, 3, 1);
  static const Color priorityHigh = Color.fromRGBO(254, 99, 127, 1);
  static const Color priorityLow = Color.fromRGBO(114, 16, 255, 1);
  static const Color notificationShadow = Color.fromRGBO(0, 0, 0, 0.12);
  static const Color dividerGrey = Color.fromRGBO(235, 235, 235, 1);
  static const Color commentBackground = Color.fromRGBO(238, 238, 238, 1);
  static const Color blackOpacity = Color.fromRGBO(34, 34, 34, 0.56);
  static const Color blueTest = Color.fromRGBO(110, 15, 245, 1);
  static const Color greyDivider = Color.fromRGBO(199, 196, 204, 1);
  static const Color installmentsCardHeaderColor =
      Color.fromRGBO(0, 175, 70, 0.08);
  static const Color blueDivider = Color.fromRGBO(192, 148, 255, 1);
  static const Color unSeenNotificationBackground =
      Color.fromRGBO(242, 240, 245, 1);
  static const Color notificationBorder = Color.fromRGBO(199, 196, 204, 0.5);
  static const Color snackBarWarning = Color.fromRGBO(255, 246, 212, 1);
  static const Color snackBarInfo = Color.fromRGBO(210, 248, 250, 1);
  static const Color snackBarSuccess = Color.fromRGBO(206, 251, 235, 1);
  static const Color snackBarError = Color.fromRGBO(253, 223, 225, 1);
  static const Color ghadeerDarkBlue = Color.fromRGBO(43, 54, 149, 1);

  static const Color primaryOpacity04 = Color.fromRGBO(114, 16, 255, 0.04);
  static const Color primaryOpacity01 = Color.fromRGBO(114, 16, 255, 0.1);
  static const Color installmentsDividerColor =
      Color.fromRGBO(192, 148, 255, 1);
  static const Color unAvailableTextColor = Color(0xFFDC3027);
  static const Color unAvailableBackgroundColor = Color(0xFFF2F0F5);
}
