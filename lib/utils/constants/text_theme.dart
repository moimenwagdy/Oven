import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final TextTheme appTextTheme = TextTheme(
  displayLarge: GoogleFonts.outfit(fontSize: 28.h, fontWeight: FontWeight.bold),

  displayMedium: GoogleFonts.outfit(
    fontSize: 24.h,
    fontWeight: FontWeight.bold,
  ),

  displaySmall: GoogleFonts.outfit(fontSize: 20.h, fontWeight: FontWeight.w600),

  headlineLarge: GoogleFonts.outfit(
    fontSize: 22.h,
    fontWeight: FontWeight.bold,
  ),

  headlineMedium: GoogleFonts.outfit(
    fontSize: 20.h,
    fontWeight: FontWeight.w600,
  ),

  headlineSmall: GoogleFonts.outfit(
    fontSize: 18.h,
    fontWeight: FontWeight.w500,
  ),

  titleLarge: GoogleFonts.outfit(fontSize: 18.h, fontWeight: FontWeight.w600),

  titleMedium: GoogleFonts.outfit(fontSize: 16.h, fontWeight: FontWeight.w500),

  titleSmall: GoogleFonts.outfit(fontSize: 14.h, fontWeight: FontWeight.w500),

  bodyLarge: GoogleFonts.outfit(fontSize: 16.h, fontWeight: FontWeight.normal),

  bodyMedium: GoogleFonts.outfit(fontSize: 14.h, fontWeight: FontWeight.normal),

  bodySmall: GoogleFonts.outfit(fontSize: 12.h, fontWeight: FontWeight.w400),

  labelLarge: GoogleFonts.outfit(fontSize: 14.h, fontWeight: FontWeight.w600),

  labelMedium: GoogleFonts.outfit(fontSize: 12.h, fontWeight: FontWeight.w500),

  labelSmall: GoogleFonts.outfit(fontSize: 10.h, fontWeight: FontWeight.w400),
);
