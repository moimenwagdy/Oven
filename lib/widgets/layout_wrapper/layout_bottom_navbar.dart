import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/routing/destinations.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

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
      labelTextStyle: WidgetStatePropertyAll(TextStyle(fontSize: 10.h)),
      destinations: destinations(context),
      selectedIndex: selectedIndex,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      onDestinationSelected: onDestinationSelected,
      indicatorColor: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      labelPadding: EdgeInsets.all(0),
      height: context.isSmallDevice ? 50 : 60,
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
