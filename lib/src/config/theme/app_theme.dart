import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';

class AppTheme {
  String language;

  AppTheme(this.language);

  ThemeData get light {
    return ThemeData(
      useMaterial3: false,
      fontFamily: getFontFamily(),
      iconTheme: const IconThemeData(color: Color(0xFF365352)),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: const Color(0xFF365352),
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: getTextStyle(
          fontSize: 12,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightRegular,
          color: ColorSchemes.white,
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        color: ColorSchemes.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        actionsIconTheme: const IconThemeData(
          color: Color(0xFF365352),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF365352),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: ColorSchemes.primary,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(8),
        hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: getFontFamily(),
            color: ColorSchemes.gray,
            letterSpacing: 0.26,
            fontWeight: FontWeight.normal),
        labelStyle: TextStyle(
            fontSize: 14,
            fontFamily: getFontFamily(), //todo handle font family
            color: ColorSchemes.gray,
            fontWeight: FontWeight.normal),
        errorStyle: TextStyle(
            fontSize: 12,
            fontFamily: getFontFamily(), //todo handle font family
            color: ColorSchemes.redError,
            fontWeight: FontWeight.normal),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchemes.gray, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchemes.gray, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchemes.redError, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchemes.redError, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        alignLabelWithHint: true,
      ),
      textTheme: TextTheme(
        titleLarge: getTextStyle(
          fontSize: 18,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightSemiBold,
          color: ColorSchemes.primary,
        ),
        bodyLarge: getTextStyle(
          fontSize: 16,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightSemiBold,
          color: ColorSchemes.primary,
        ),
        bodyMedium: getTextStyle(
          fontSize: 13,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightMedium,
          color: ColorSchemes.primary,
        ),
        bodySmall: getTextStyle(
          fontSize: 13,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightRegular,
          textDecoration: TextDecoration.none,
          color: ColorSchemes.primary,
        ),
        labelLarge: getTextStyle(
          fontSize: 12,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightRegular,
          color: ColorSchemes.primary,
        ), //Regular
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorSchemes.white,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorSchemes.primary,
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(
          color: ColorSchemes.primary,
          size: 24,
        ),
        unselectedIconTheme: const IconThemeData(
          color: ColorSchemes.gray,
          size: 24,
        ),
      ),
      scaffoldBackgroundColor: ColorSchemes.white,
      primaryColor: ColorSchemes.primary,
      splashColor: Colors.transparent,
    );
  }

  ThemeData get dark {
    return ThemeData(
      useMaterial3: false,
      fontFamily: getFontFamily(),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: ColorSchemes.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: getTextStyle(
          fontSize: 12,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightRegular,
          color: ColorSchemes.white,
        ),
      ),
      scaffoldBackgroundColor: ColorSchemes.iconBackGround,
      iconTheme: IconThemeData(color: ColorSchemes.primary),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        actionsIconTheme: const IconThemeData(
          color: Color(0xFF9f695a),
        ),
        backgroundColor: ColorSchemes.iconBackGround,
        elevation: 0,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorSchemes.iconBackGround,
          statusBarIconBrightness: Brightness.light,
        ),
        iconTheme: const IconThemeData(
          color: Colors.blueAccent,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorSchemes.primary,
        backgroundColor: ColorSchemes.iconBackGround,
        unselectedItemColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(),
      textTheme: TextTheme(
        titleLarge: getTextStyle(
          fontSize: 18,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightSemiBold,
          color: ColorSchemes.primary,
        ),
        bodyLarge: getTextStyle(
          fontSize: 16,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightSemiBold,
          color: ColorSchemes.primary,
        ),
        bodyMedium: getTextStyle(
          fontSize: 13,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightMedium,
          color: ColorSchemes.primary,
        ),
        bodySmall: getTextStyle(
          fontSize: 13,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightRegular,
          textDecoration: TextDecoration.none,
          color: ColorSchemes.primary,
        ),
        labelLarge: getTextStyle(
          fontSize: 12,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightRegular,
          color: ColorSchemes.primary,
        ), //Regular
      ),
      cardTheme: CardTheme(color: ColorSchemes.primary),
      hintColor: Colors.white,
      brightness: Brightness.dark,
      primaryColor: Colors.white,
      drawerTheme: DrawerThemeData(
        backgroundColor: ColorSchemes.iconBackGround,
      ),
    );
  }

  String getFontFamily() => language == "en"
      ? Constants.englishFontFamily
      : Constants.arabicFontFamily;

  static TextStyle getTextStyle({
    double fontSize = 24,
    FontWeight fontWeight = FontWeight.normal,
    String fontFamily = Constants.englishFontFamily,
    required Color color,
    textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        decoration: textDecoration);
  }
}
