import 'package:flutter/material.dart';

TextTheme buildTextTheme(String fontFamily, List<String> fallback) {

  return TextTheme(
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontFamilyFallback: fallback,
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontFamilyFallback: fallback,
      fontFamily: fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      fontFamilyFallback: fallback,
      fontFamily: fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),

    headlineLarge: TextStyle(
      fontFamilyFallback: fallback,
      fontFamily: fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontFamilyFallback: fallback,
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      fontFamilyFallback: fallback,
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),

    titleLarge: TextStyle(
      fontFamilyFallback: fallback,
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      fontFamilyFallback: fallback,
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
    titleSmall: TextStyle(
      fontFamilyFallback: fallback,
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),

    bodyLarge: TextStyle(
      fontFamilyFallback: fallback,
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontFamilyFallback: fallback,
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
    bodySmall: TextStyle(
      fontFamilyFallback: fallback,
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w300,
    ),

    labelLarge: TextStyle(
      fontFamilyFallback: fallback,
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      fontFamilyFallback: fallback,
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontFamily: fontFamily,
      fontFamilyFallback: fallback,
      fontSize: 10,
      fontWeight: FontWeight.w300,
    ),
  );
}

