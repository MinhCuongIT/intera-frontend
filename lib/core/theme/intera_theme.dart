import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intera/core/theme/intera_font.dart';

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
        fontFamily: InteraFont.font,
        fontSize: 96,
        fontWeight: InteraFont.regular,
        letterSpacing: -1.5,
        decoration: TextDecoration.none,
      ),
      headline2: TextStyle(
        fontFamily: InteraFont.font,
        fontSize: 60,
        fontWeight: InteraFont.regular,
        letterSpacing: -0.5,
        decoration: TextDecoration.none,
      ),
      headline3: TextStyle(
        fontFamily: InteraFont.font,
        fontSize: 48,
        fontWeight: InteraFont.medium,
        letterSpacing: 0,
        decoration: TextDecoration.none,
      ),
      headline4: TextStyle(
        fontFamily: InteraFont.font,
        fontSize: 34,
        fontWeight: InteraFont.medium,
        letterSpacing: 0.25,
        decoration: TextDecoration.none,
      ),
      headline5: TextStyle(
        fontFamily: InteraFont.font,
        fontSize: 24,
        fontWeight: InteraFont.medium,
        letterSpacing: 0,
        decoration: TextDecoration.none,
      ),
      headline6: TextStyle(
        fontFamily: InteraFont.font,
        fontSize: 20,
        fontWeight: InteraFont.medium,
        letterSpacing: 0.15,
        decoration: TextDecoration.none,
      ),
      subtitle1: TextStyle(
        fontFamily: InteraFont.font,
        fontSize: 16,
        fontWeight: InteraFont.medium,
        letterSpacing: 0.15,
        decoration: TextDecoration.none,
      ),
      subtitle2: TextStyle(
        fontFamily: InteraFont.font,
        fontSize: 14,
        fontWeight: InteraFont.medium,
        letterSpacing: 0.1,
        decoration: TextDecoration.none,
      ),
      bodyText1: TextStyle(
        fontFamily: InteraFont.font,
        fontSize: 16,
        fontWeight: InteraFont.medium,
        letterSpacing: 0.5,
        decoration: TextDecoration.none,
      ),
      bodyText2: TextStyle(
        fontFamily: InteraFont.font,
        fontSize: 14,
        fontWeight: InteraFont.medium,
        letterSpacing: 0.25,
        decoration: TextDecoration.none,
      ),
      button: TextStyle(
        fontFamily: InteraFont.font,
        fontSize: 14,
        fontWeight: InteraFont.medium,
        letterSpacing: 1.25,
        decoration: TextDecoration.none,
      ),
      caption: TextStyle(
        fontFamily: InteraFont.font,
        fontSize: 12,
        fontWeight: InteraFont.medium,
        letterSpacing: 0.4,
        decoration: TextDecoration.none,
      ),
      overline: TextStyle(
        fontFamily: InteraFont.font,
        fontSize: 10,
        fontWeight: InteraFont.medium,
        letterSpacing: 1.5,
        decoration: TextDecoration.none,
      ),
    ),
  );

  static final ThemeData light = _base.copyWith(brightness: Brightness.light);
  static final ThemeData dark = _base.copyWith(brightness: Brightness.dark);
}
