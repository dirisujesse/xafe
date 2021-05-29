import 'package:flutter/material.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/style/style.dart';

class XfThemes {
  static final base = ThemeData.light();
  static final ThemeData defaultTheme = base.copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    backgroundColor: XfColors.primary,
    scaffoldBackgroundColor: XfColors.primary,
    primaryColor: XfColors.primary,
    accentColor: XfColors.secondary,
    canvasColor: XfColors.transparent,
    primaryColorBrightness: Brightness.light,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: XfColors.black,
        ),
      ).apply(fontFamily: XfFonts.euclid),
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: XfColors.black),
      color: XfColors.white,
      elevation: 0,
    ),
    dividerColor: XfColors.darkGrey,
    bottomAppBarColor: XfColors.white,
    bottomAppBarTheme: base.bottomAppBarTheme.copyWith(
      elevation: 0,
      color: XfColors.white,
    ),
    buttonTheme: base.buttonTheme.copyWith(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      buttonColor: XfColors.blue,
      disabledColor: XfColors.darkGrey,
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      backgroundColor: XfColors.green,
      foregroundColor: Colors.white,
    ),
    cardColor: XfColors.white,
    textSelectionTheme: base.textSelectionTheme.copyWith(
      selectionColor: XfColors.green.withOpacity(.3),
      selectionHandleColor: XfColors.green.withOpacity(.3),
      cursorColor: XfColors.green,
    ),
    errorColor: XfColors.red,
    textTheme: base.textTheme.apply(
      displayColor: XfColors.black,
      bodyColor: XfColors.black,
      fontFamily: XfFonts.euclid,
    ),
    indicatorColor: XfColors.black,
    iconTheme: base.iconTheme.copyWith(
      color: XfColors.black,
      size: 30,
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorMaxLines: 3,
      helperMaxLines: 3,
      isDense: true,
      filled: true,
      fillColor: XfColors.grey,
      suffixStyle: TextStyle(
        color: XfColors.black,
      ),
      prefixStyle: TextStyle(
        color: XfColors.black,
      ),
      labelStyle: TextStyle(
        color: XfColors.darkGrey,
        fontSize: base.textTheme.bodyText1?.fontSize ?? 35,
        fontWeight: FontWeight.w100,
      ),
      helperStyle: TextStyle(
        color: XfColors.darkGrey,
        fontSize: base.textTheme.bodyText1?.fontSize ?? 35,
        fontWeight: FontWeight.w100,
      ),
      hintStyle: TextStyle(
        color: XfColors.ash,
        fontSize: base.textTheme.bodyText1?.fontSize ?? 35,
        fontWeight: FontWeight.w100,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: XfColors.transparent, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: XfColors.red, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: XfColors.red,
          width: 1.2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: XfColors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: XfColors.grey, width: 1.2),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
