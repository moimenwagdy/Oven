import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oven/utils/constants/colors%20_schemas.dart';
// import 'package:oven/utils/constants/colors%20_schemas.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/constants/text_theme.dart';

ThemeData buildTheme(Locale locale, {Brightness brightness = Brightness.light,}) {
  final fontFamily = locale.toString() == "ar" ? "ArabicFont" : "EnglishFont";
  final colorScheme = brightness == Brightness.dark
      ? buildDarkColorScheme()
      : buildLightColorScheme();
  return ThemeData(
    // scaffoldBackgroundColor: Colors.white,
    primaryColor: primary,
    useMaterial3: true,
    colorScheme: colorScheme,
    fontFamily: fontFamily,
    textTheme: buildTextTheme(fontFamily),
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      titleTextStyle: GoogleFonts.poppins(
        color: onSecondary,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
