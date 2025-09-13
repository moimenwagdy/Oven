import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oven/utils/constants/colors_schemas.dart';
import 'package:oven/utils/constants/text_theme.dart';

ThemeData buildTheme(
  Locale locale, {
  Brightness brightness = Brightness.light,
}) {
  final fontFamily = locale.toString() == "ar" ? "ArabicFont" : "EnglishFont";
  final colorScheme = brightness == Brightness.dark
      ? buildDarkColorScheme()
      : buildLightColorScheme();
  return ThemeData(
    scaffoldBackgroundColor: colorScheme.onPrimary,
    primaryColor: colorScheme.primary,
    useMaterial3: true,
    colorScheme: colorScheme,
    fontFamily: fontFamily,
    textTheme: buildTextTheme(fontFamily),
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.primary,
      titleTextStyle: GoogleFonts.poppins(
        color: colorScheme.onSecondary,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
