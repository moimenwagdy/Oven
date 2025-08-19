import 'package:flutter/material.dart';

TextTheme buildTextTheme(String fontFamily) {
  return TextTheme(
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),

    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),

    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),

    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
    bodySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w300,
    ),

    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 10,
      fontWeight: FontWeight.w300,
    ),
  );
}
