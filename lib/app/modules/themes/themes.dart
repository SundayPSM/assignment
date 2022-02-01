import 'package:flutter/material.dart';

class Themes {
  final ThemeData lightThemeData = ThemeData.light().copyWith(
    // primaryColor: const Color(0x00ff8860),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      // color: const Color(0x00ff8860),
      backgroundColor: Color(0xFFF7CE3E),
      titleTextStyle: TextStyle(
        // color: Color(0XFF222831),
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
        size: 24,
      ),
      elevation: 0.5,
    ),
    textTheme: _lightTextTheme,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.yellow
    ),
    iconTheme: const IconThemeData(
      color: Color(0XFF0A1612),
      size: 32,
    ),
  );

  static const TextTheme _lightTextTheme = TextTheme(
    headline6: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    headline5: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    bodyText1: TextStyle(
      color: Color(0XFF0A1612),
    ),
  );
}
