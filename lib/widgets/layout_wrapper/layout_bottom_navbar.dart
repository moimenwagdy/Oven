import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/routing/destinations.dart';

class LayoutBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const LayoutBottomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelTextStyle: WidgetStatePropertyAll(TextStyle(fontSize: 12.h)),
      destinations: destinations(context),
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      indicatorColor: Theme.of(context).colorScheme.primary,
    );
  }
}
