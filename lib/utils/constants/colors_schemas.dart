import 'package:flutter/material.dart';
import 'colors.dart';

ColorScheme buildLightColorScheme() {
  return const ColorScheme(
    brightness: Brightness.light,
    // primary: Colors.redAccent,
    primary: primary,
    onPrimary: Colors.white,
    // onPrimary: onPrimary,
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
    // primary: Colors.green,
    primary: darkPrimary,
    onPrimary: darkOnPrimary,
    // secondary: darkSecondary,
    secondary: secondary,
    onSecondary: darkOnSecondary,
    surface: darkSurface,
    onSurface: darkOnSurface,
    error: darkError,
    onError: darkOnError,
    onSecondaryFixed: darkOnSecondaryFixed,
  );
}
