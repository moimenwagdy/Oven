import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/routing/destinations.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/search_bar/home_page_search_bar.dart';
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
        final targets = ['/home', '/products', '/orders', '/account'];
        context.go(targets[index]);
      }
    }

    final showSearchBar = [
      '/orders',
      '/account',
      "/account/admin",
      "/account/profile",
      "/account/reports",
      "/account/about",
      "/account/fav",
    ].contains(location);
    final showCart = !['/cart'].contains(location);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: context.isSmallDevice
            ? showSearchBar
                  ? 50
                  : 100
            : showSearchBar
            ? 60
            : 90,
        backgroundColor: primary,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontSize: 12,
          letterSpacing: 1,
          color: Colors.white,
          fontFamily: "EnglishFont",
          locale: const Locale("en"),
          fontWeight: FontWeight.w900,
        ),
        title: SizedBox(
          height: context.isSmallDevice
              ? showSearchBar
                    ? 50
                    : 100
              : showSearchBar
              ? 60
              : 90,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: !showCart ? 15 : 0,
                      bottom: !showCart ? 16 : 0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text("${context.l10n.whereToDeliver}..."),
                    ),
                  ),
                  ?showCart
                      ? IconButton(
                          onPressed: () => context.go("/cart"),
                          icon: Icon(Icons.shopping_cart, color: surface),
                        )
                      : null,
                ],
              ),
              ?!showSearchBar ? HomePageSearchBar() : null,
            ],
          ),
        ),
        centerTitle: false,
      ),
      body: child,
      bottomNavigationBar: LayoutBottomNavbar(
        selectedIndex: selectedIndexToUse,
        onDestinationSelected: onTabTap,
      ),
    );
  }
}
