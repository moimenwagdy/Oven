import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/pop_provider/pop_provider.dart';
import 'package:oven/routing/root_back_handler.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/widgets/custom_widgets/search_bar/home_page_search_bar.dart';
import 'package:oven/widgets/layout_wrapper/layout_bottom_navbar.dart';
import 'package:oven/widgets/layout_wrapper/where_to_deliver/where_to_deliver_modal.dart';
import 'package:oven/widgets/orders_page_widgets/filter/recent_orders_filter.dart';

class LayoutWrapper extends ConsumerWidget {
  final Widget child;
  final StatefulNavigationShell shell;
  const LayoutWrapper({super.key, required this.child, required this.shell});
  @override
  Widget build(BuildContext context, ref) {
    final cartList = ref.watch(cartProvider).value;
    final cartLength = cartList != null ? cartList.length : 0;
    final location = GoRouterState.of(context).uri.toString();

    void onTabTap(int index) {
      ref.read(navigationIndexProvider.notifier).setNavigationIndex(index);
      shell.goBranch(index, initialLocation: false);
    }
    final hideSearchBar = [
      "/orders",
      '/account',
      "/account/admin",
      "/account/fav",
    ].contains(location);
    final hideAppBar = [
      "/account/profile",
      '/account/reports',
      "/account/about",
      "/account",
      "/search",
    ].contains(location);
    final isOrdersPapge = ["/orders"].contains(location);
    final showCart = !['/cart'].contains(location);
    return Scaffold(
      appBar: hideAppBar
          ? null
          : AppBar(
              scrolledUnderElevation: 1,
              toolbarHeight: context.isSmallDevice
                  ? hideSearchBar && !isOrdersPapge
                        ? 45
                        : 85
                  : hideSearchBar && !isOrdersPapge
                  ? 45
                  : 95,
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              titleTextStyle: Theme.of(context).textTheme.headlineMedium
                  ?.copyWith(
                    fontSize: 12,
                    letterSpacing: 1,
                    color: Colors.white,
                    fontFamily: "EnglishFont",
                    locale: const Locale("en"),
                    fontWeight: FontWeight.w900,
                  ),
              title: SizedBox(
                height: context.isSmallDevice
                    ? hideSearchBar && !isOrdersPapge
                          ? 50
                          : 90
                    : hideSearchBar && !isOrdersPapge
                    ? 50
                    : 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: !showCart ? 15 : 0,
                            bottom: !showCart ? 16 : 0,
                            right: context.isArabic ? 10 : 0,
                            left: context.isArabic ? 0 : 10,
                          ),
                          child: WhereToDeliverModal(),
                        ),
                        ?showCart
                            ? Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: cartLength > 9 ? 8 : 2,
                                    ),
                                    child: IconButton(
                                      onPressed: () => context.go("/cart"),
                                      icon: Icon(
                                        Icons.shopping_cart_outlined,
                                        color: primary,
                                        size: context.isSmallDevice ? 25 : 25,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(1, 1),
                                            blurRadius: 6,
                                            color: Colors.black.withValues(
                                              alpha: .1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: primary,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 2,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "$cartLength",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : null,
                      ],
                    ),
                    ?!hideSearchBar && !isOrdersPapge
                        ? HomePageSearchBar()
                        : isOrdersPapge
                        ? RecentOrdersFilter()
                        : null,
                  ],
                ),
              ),
              centerTitle: false,
            ),
      body: child,
      bottomNavigationBar: RootBackHandler(
        key: ValueKey(location),

        ref: ref,
        navigationShell: shell,
        child: LayoutBottomNavbar(onDestinationSelected: onTabTap),
      ),
    );
  }
}
