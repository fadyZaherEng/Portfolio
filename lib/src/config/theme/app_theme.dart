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
      iconTheme: IconThemeData(color: ColorSchemes.lightPrimaryVariant),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: ColorSchemes.lightPrimaryVariant,
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
        color: ColorSchemes.lightSurface,
        elevation: 0,
        shadowColor: Colors.transparent,
        actionsIconTheme: IconThemeData(
          color: ColorSchemes.lightPrimaryVariant,
        ),
        iconTheme: IconThemeData(
          color: ColorSchemes.lightPrimaryVariant,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: ColorSchemes.lightPrimary,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(8),
        hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: getFontFamily(),
            color: ColorSchemes.lightOnSurface,
            letterSpacing: 0.26,
            fontWeight: FontWeight.normal),
        labelStyle: TextStyle(
            fontSize: 14,
            fontFamily: getFontFamily(),
            color: ColorSchemes.lightOnSurface,
            fontWeight: FontWeight.normal),
        errorStyle: TextStyle(
            fontSize: 12,
            fontFamily: getFontFamily(),
            color: ColorSchemes.redError,
            fontWeight: FontWeight.normal),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorSchemes.lightPrimary, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorSchemes.lightPrimaryVariant, width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchemes.redError, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchemes.redError, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        alignLabelWithHint: true,
      ),
      textTheme: TextTheme(
        titleLarge: getTextStyle(
          fontSize: 18,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightSemiBold,
          color: ColorSchemes.lightOnBackground,
        ),
        bodyLarge: getTextStyle(
          fontSize: 16,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightSemiBold,
          color: ColorSchemes.lightOnBackground,
        ),
        bodyMedium: getTextStyle(
          fontSize: 13,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightMedium,
          color: ColorSchemes.lightOnBackground,
        ),
        bodySmall: getTextStyle(
          fontSize: 13,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightRegular,
          textDecoration: TextDecoration.none,
          color: ColorSchemes.lightOnSurface,
        ),
        labelLarge: getTextStyle(
          fontSize: 12,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightRegular,
          color: ColorSchemes.lightOnSurface,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorSchemes.lightSurface,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorSchemes.lightPrimary,
        unselectedItemColor: ColorSchemes.lightOnSurface,
        selectedIconTheme: IconThemeData(
          color: ColorSchemes.lightPrimary,
          size: 24,
        ),
        unselectedIconTheme: IconThemeData(
          color: ColorSchemes.lightOnSurface,
          size: 24,
        ),
      ),
      scaffoldBackgroundColor: ColorSchemes.lightBackground,
      primaryColor: ColorSchemes.lightPrimary,
      cardTheme: const CardTheme(color: ColorSchemes.lightSurface),
      splashColor: ColorSchemes.lightAccent.withOpacity(0.12),
      highlightColor: ColorSchemes.lightPrimary.withOpacity(0.08),
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

  ThemeData get newDark {
    return ThemeData(
      useMaterial3: false,
      fontFamily: getFontFamily(),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: ColorSchemes.newDarkPrimaryVariant,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: getTextStyle(
          fontSize: 12,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightRegular,
          color: ColorSchemes.newDarkAccent,
        ),
      ),
      scaffoldBackgroundColor: ColorSchemes.newDarkBackground,
      iconTheme: IconThemeData(color: ColorSchemes.newDarkAccent),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        actionsIconTheme: IconThemeData(
          color: ColorSchemes.newDarkAccent,
        ),
        backgroundColor: ColorSchemes.newDarkBackground,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: ColorSchemes.newDarkAccent,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorSchemes.newDarkBackground,
          statusBarIconBrightness: Brightness.light,
        ),
        iconTheme: IconThemeData(
          color: ColorSchemes.newDarkAccent,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorSchemes.newDarkAccent,
        backgroundColor: ColorSchemes.newDarkSurface,
        unselectedItemColor: ColorSchemes.newDarkOnBackground,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorSchemes.newDarkAccent,
        foregroundColor: ColorSchemes.newDarkBackground,
      ),
      textTheme: TextTheme(
        titleLarge: getTextStyle(
          fontSize: 18,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightSemiBold,
          color: ColorSchemes.newDarkOnPrimary,
        ),
        bodyLarge: getTextStyle(
          fontSize: 16,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightSemiBold,
          color: ColorSchemes.newDarkOnPrimary,
        ),
        bodyMedium: getTextStyle(
          fontSize: 13,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightMedium,
          color: ColorSchemes.newDarkOnPrimary,
        ),
        bodySmall: getTextStyle(
          fontSize: 13,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightRegular,
          textDecoration: TextDecoration.none,
          color: ColorSchemes.newDarkOnSurface,
        ),
        labelLarge: getTextStyle(
          fontSize: 12,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightRegular,
          color: ColorSchemes.newDarkOnBackground,
        ),
      ),
      cardTheme: CardTheme(color: ColorSchemes.newDarkSurface),
      hintColor: ColorSchemes.newDarkOnBackground,
      brightness: Brightness.dark,
      primaryColor: ColorSchemes.newDarkAccent,
      drawerTheme: DrawerThemeData(
        backgroundColor: ColorSchemes.newDarkBackground,
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
