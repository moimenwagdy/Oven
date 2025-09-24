import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/routing/destinations.dart';
import 'package:oven/widgets/layout_wrapper/layout_bottom_navbar.dart';

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
        titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontSize: 24,
          letterSpacing: 1,
          color: Colors.white,
          fontFamily: "EnglishFont",
          locale: Locale("en"),
          fontWeight: FontWeight.w900,
        ),
        title: const Text("Oven"),
        centerTitle: showBackButton,
        leading: showBackButton
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                onPressed: () => context.pop(),
              )
            : null,
        toolbarHeight: 40,
        // actions: [LanguageToggler()],
      ),
      body: child,
      bottomNavigationBar: LayoutBottomNavbar(
        selectedIndex: selectedIndexToUse,
        onDestinationSelected: onTabTap,
      ),
    );
  }
}
