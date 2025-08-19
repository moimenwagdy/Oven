import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/routing/destinations.dart';
import 'package:oven/widgets/layout_wrapper/language_toggler.dart';
import 'package:oven/widgets/layout_wrapper/layout_bottom_navbar.dart';
import 'package:oven/widgets/layout_wrapper/layout_image.dart';

class LayoutWrapper extends StatelessWidget {
  final Widget child;
  const LayoutWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    final isShell = child is StatefulNavigationShell;
    final int? shellIndex = isShell
        ? (child as StatefulNavigationShell).currentIndex
        : null;

    final computedIndex = shellIndex ?? indexFromLocation(location);
    final selectedIndexToUse = computedIndex ?? 0;

    void onTabTap(int index) {
      if (isShell) {
        final navShell = child as StatefulNavigationShell;
        navShell.goBranch(index);
      } else {
        final targets = ['/home', '/orders', '/account'];
        context.go(targets[index]);
      }
    }

    final showBackButton = !['/home', '/orders', '/account'].contains(location);

    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
          fontSize: 24.h,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        title: const Text("Oven"),
        centerTitle: showBackButton,
        leading: showBackButton
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => context.pop(),
              )
            : null,
        actions: [LanguageToggler()],
      ),
      body: Stack(
        alignment: const Alignment(0, 0.6),
        children: [const LayoutImageStack(), child],
      ),
      bottomNavigationBar: LayoutBottomNavbar(
        selectedIndex: selectedIndexToUse,
        onDestinationSelected: onTabTap,
      ),
    );
  }
}
