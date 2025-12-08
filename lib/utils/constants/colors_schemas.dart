import 'package:flutter/material.dart';
import 'colors.dart';

ColorScheme buildLightColorScheme() {
  return const ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: Colors.white,
    secondary: secondary,
    onSecondary: onSecondary,
    surface: surface,
    onSurface: onSurface,
    error: error,
    onError: onError,
    onSecondaryFixed: onSecondaryFixed,
  );
}

ColorScheme buildDarkColorScheme() {
  return const ColorScheme(
    brightness: Brightness.dark,
    primary: darkPrimary,
    onPrimary: darkOnPrimary,
    secondary: secondary,
    onSecondary: darkOnSecondary,
    surface: darkSurface,
    onSurface: darkOnSurface,
    error: darkError,
    onError: darkOnError,
    onSecondaryFixed: darkOnSecondaryFixed,
  );
}
