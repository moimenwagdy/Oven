import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  bool get isSmallDevice => MediaQuery.of(this).size.shortestSide < 380;

  /// Medium device (tablet) - between 600dp and 1024dp
  bool get isTablet =>
      MediaQuery.of(this).size.shortestSide >= 600 &&
      MediaQuery.of(this).size.shortestSide < 1024;

  /// Large device (desktop) - >=1024dp
  bool get isDesktop => MediaQuery.of(this).size.shortestSide >= 1024;
}
