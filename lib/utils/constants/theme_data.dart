import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/constants/text_theme.dart';

ThemeData buildTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primary,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.red,
    ),
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFC89D2D),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFFCA9703),
      onSecondary: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFDF9),
      // onSurface: Color(0xFF121111),
      onSurface: Colors.black,
      error: Color(0xFFD9534F),
      onError: Color(0xFFFFFFFF),
    ),

    fontFamily: "safdf",
    textTheme: GoogleFonts.outfitTextTheme(appTextTheme),
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      titleTextStyle: GoogleFonts.outfit(
        color: Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
