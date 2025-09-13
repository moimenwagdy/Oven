import 'package:flutter/material.dart';
import 'colors.dart';

ColorScheme buildLightColorScheme() {
  return const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.white,
    // primary: primary,
    onPrimary: onPrimary,
    secondary: secondary,
    onSecondary: onSecondary,
    surface: surface,
    onSurface: onSurface,
    error: error,
    onError: onError,
  );
}

ColorScheme buildDarkColorScheme() {
  return const ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.white,
    // primary: darkPrimary,
    onPrimary: darkOnPrimary,
    secondary: darkSecondary,
    onSecondary: darkOnSecondary,
    surface: darkSurface,
    onSurface: darkOnSurface,
    error: darkError,
    onError: darkOnError,
  );
}
