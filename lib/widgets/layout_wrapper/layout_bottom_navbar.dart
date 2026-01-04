import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/providers/pop_provider/pop_provider.dart';
import 'package:oven/routing/destinations.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class LayoutBottomNavbar extends ConsumerWidget {
  final ValueChanged<int> onDestinationSelected;

  const LayoutBottomNavbar({
    super.key,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context, ref) {
    final index = ref.watch(navigationIndexProvider);
    return NavigationBar(
      labelTextStyle: WidgetStatePropertyAll(TextStyle(fontSize: 10.h)),
      destinations: destinations(context),
      selectedIndex: index,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      onDestinationSelected: onDestinationSelected,
      indicatorColor: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      labelPadding: EdgeInsets.all(0),
      height: context.isSmallDevice ? 50 : 60,
    );
  }
}
