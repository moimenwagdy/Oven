import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/constants/text_theme.dart';

ThemeData buildTheme(ColorScheme colorScheme) {
  return ThemeData(
    scaffoldBackgroundColor: colorScheme.onPrimary,
    primaryColor: colorScheme.primary,
    useMaterial3: true,
    colorScheme: colorScheme,
    fontFamily: "EnglishFont",
    fontFamilyFallback: ["ArabicFont"],
    textTheme: buildTextTheme("EnglishFont", ["ArabicFont"]),
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.primary,
      titleTextStyle: TextStyle(
        color: colorScheme.onSecondary,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    scrollbarTheme: ScrollbarThemeData(
      crossAxisMargin: .5,
      thumbColor: WidgetStateProperty.all(colorScheme.primary),
      thickness: WidgetStateProperty.all(3),
      radius: const Radius.circular(16),
    ),
  );
}
