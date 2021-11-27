import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'intera_colors.dart';

class InteraTheme {
  InteraTheme._();

  static final ThemeData _base = ThemeData(
    brightness: Brightness.light,
    primaryColor: InteraColors.primary,
    primaryColorDark: InteraColors.primaryDark,
    primaryColorLight: InteraColors.primaryLight,
    backgroundColor: InteraColors.background,
    splashColor: InteraColors.primary,
    hoverColor: Colors.transparent,
    scaffoldBackgroundColor: InteraColors.background,
    cardColor: Colors.white,
    iconTheme: IconThemeData(),
    cardTheme: CardTheme(color: Colors.white),
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(),
      iconTheme: IconThemeData(),
      color: InteraColors.primary,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: InteraColors.primary,
      elevation: 0,
      focusElevation: 1,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      foregroundColor: Colors.white,
      hoverElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: InteraColors.background,
      elevation: 0,
    ),
    buttonTheme: ButtonThemeData(),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: InteraColors.primary,
      secondary: InteraColors.secondary,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: 'Inter',
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        decoration: TextDecoration.none,
      ),
      headline2: TextStyle(
        fontFamily: 'Inter',
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        decoration: TextDecoration.none,
      ),
      headline3: TextStyle(
        fontFamily: 'Inter',
        fontSize: 48,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        decoration: TextDecoration.none,
      ),
      headline4: TextStyle(
        fontFamily: 'Inter',
        fontSize: 34,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25,
        decoration: TextDecoration.none,
      ),
      headline5: TextStyle(
        fontFamily: 'Inter',
        fontSize: 24,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        decoration: TextDecoration.none,
      ),
      headline6: TextStyle(
        fontFamily: 'Inter',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        decoration: TextDecoration.none,
      ),
      subtitle1: TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        decoration: TextDecoration.none,
      ),
      subtitle2: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        decoration: TextDecoration.none,
      ),
      bodyText1: TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        decoration: TextDecoration.none,
      ),
      bodyText2: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25,
        decoration: TextDecoration.none,
      ),
      button: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        decoration: TextDecoration.none,
      ),
      caption: TextStyle(
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.4,
        decoration: TextDecoration.none,
      ),
      overline: TextStyle(
        fontFamily: 'Inter',
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
        decoration: TextDecoration.none,
      ),
    ),
  );

  static final ThemeData light = _base.copyWith(brightness: Brightness.light);
  static final ThemeData dark = _base.copyWith(brightness: Brightness.dark);
}
