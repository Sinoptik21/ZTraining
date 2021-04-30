import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constants.dart';

class ThemeConfig {
  static ThemeData createTheme({
    Brightness brightness,
    Color background,
    Color primaryText,
    Color secondaryText,
    Color accentColor,
    Color divider,
    Color buttonBackground,
    Color buttonText,
    Color cardBackground,
    Color disabled,
    Color error,
  }) {
    final baseTextTheme = brightness == Brightness.dark
        ? Typography.blackMountainView
        : Typography.whiteMountainView;

    final fontFamily = GoogleFonts.openSans().fontFamily;

    return ThemeData(
      brightness: brightness,
      buttonColor: buttonBackground,
      canvasColor: background,
      cardColor: background,
      dividerColor: divider,
      dividerTheme: DividerThemeData(
        color: divider,
        space: 1,
        thickness: 1,
      ),
      cardTheme: CardTheme(
        color: cardBackground,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
      backgroundColor: background,
      primaryColor: accentColor,
      accentColor: accentColor,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: accentColor,
        selectionHandleColor: accentColor,
        cursorColor: accentColor,
      ),
      toggleableActiveColor: accentColor,
      appBarTheme: AppBarTheme(
        brightness: brightness,
        color: cardBackground,
        textTheme: TextTheme(
          bodyText1: baseTextTheme.bodyText1.copyWith(
            color: secondaryText,
            fontSize: 18,
            fontFamily: fontFamily,
          ),
        ),
        iconTheme: IconThemeData(
          color: secondaryText,
        ),
      ),
      iconTheme: IconThemeData(
        color: secondaryText,
        size: 16.0,
      ),
      errorColor: error,
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: accentColor,
          primaryVariant: accentColor,
          secondary: accentColor,
          secondaryVariant: accentColor,
          surface: background,
          background: background,
          error: error,
          onPrimary: buttonText,
          onSecondary: buttonText,
          onSurface: buttonText,
          onBackground: buttonText,
          onError: buttonText,
        ),
        padding: const EdgeInsets.all(16.0),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: accentColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(color: error),
        labelStyle: TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
          color: primaryText.withOpacity(0.5),
        ),
        hintStyle: TextStyle(
          color: secondaryText,
          fontSize: 13.0,
          fontWeight: FontWeight.w300,
        ),
      ),
      fontFamily: fontFamily,
      textTheme: TextTheme(
        headline1: baseTextTheme.headline1.copyWith(
          color: primaryText,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
        ),
        headline2: baseTextTheme.headline2.copyWith(
          color: primaryText,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
        ),
        headline3: baseTextTheme.headline3.copyWith(
          color: secondaryText,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
        headline4: baseTextTheme.headline4.copyWith(
          color: primaryText,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
        headline5: baseTextTheme.headline5.copyWith(
          color: primaryText,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontFamily: fontFamily,
        ),
        headline6: baseTextTheme.headline6.copyWith(
          color: primaryText,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          fontFamily: fontFamily,
        ),
        bodyText1: baseTextTheme.bodyText1.copyWith(
          color: secondaryText,
          fontSize: 15,
          fontFamily: fontFamily,
        ),
        bodyText2: baseTextTheme.bodyText2.copyWith(
          color: primaryText,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
        ),
        button: baseTextTheme.button.copyWith(
          color: primaryText,
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
          fontFamily: fontFamily,
        ),
        caption: baseTextTheme.caption.copyWith(
          color: primaryText,
          fontSize: 11.0,
          fontWeight: FontWeight.w300,
          fontFamily: fontFamily,
        ),
        overline: baseTextTheme.overline.copyWith(
          color: primaryText,
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        subtitle1: baseTextTheme.subtitle1.copyWith(
          color: primaryText,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          fontFamily: fontFamily,
        ),
        subtitle2: baseTextTheme.subtitle2.copyWith(
          color: secondaryText,
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
      ),
    );
  }

  static ThemeData get lightTheme => createTheme(
        brightness: Brightness.light,
        background: ColorConstants.lightScaffoldBackgroundColor,
        cardBackground: ColorConstants.secondaryAppColor,
        primaryText: Colors.black,
        secondaryText: Colors.white,
        accentColor: ColorConstants.secondaryAppColor,
        divider: ColorConstants.secondaryAppColor,
        buttonBackground: Colors.black38,
        buttonText: ColorConstants.secondaryAppColor,
        disabled: ColorConstants.secondaryAppColor,
        error: Colors.red,
      );

  static ThemeData get darkTheme => createTheme(
        brightness: Brightness.dark,
        background: ColorConstants.darkScaffoldBackgroundColor,
        cardBackground: ColorConstants.secondaryDarkAppColor,
        primaryText: Colors.white,
        secondaryText: Colors.black,
        accentColor: ColorConstants.secondaryDarkAppColor,
        divider: Colors.black45,
        buttonBackground: Colors.white,
        buttonText: ColorConstants.secondaryDarkAppColor,
        disabled: ColorConstants.secondaryDarkAppColor,
        error: Colors.red,
      );
}
