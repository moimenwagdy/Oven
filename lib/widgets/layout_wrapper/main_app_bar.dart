import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/constants/percentages_of_screen_heights.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/search_bar/home_page_search_bar.dart';
import 'package:oven/widgets/layout_wrapper/where_to_deliver/where_to_deliver_modal.dart';
import 'package:oven/widgets/orders_page_widgets/filter/recent_orders_filter.dart';

class MainAppBar extends ConsumerWidget {
  final StatefulNavigationShell shell;

  const MainAppBar({super.key, required this.shell});

  @override
  Widget build(BuildContext context, ref) {
    final cartList = ref.watch(cartProvider).value;
    final cartLength = cartList != null ? cartList.length : 0;
    final isLoggedIn = ref.watch(
      currentSessionProvider.select((session) => session != null),
    );
    final location = GoRouterState.of(context).uri.toString();

    final showSearchbar = ["/home", "/products"].contains(location);
    final isOrdersPapge = ["/orders"].contains(location);

    final showCart = !['/cart'].contains(location);

    return AppBar(
      scrolledUnderElevation: 1,
      toolbarHeight:
          context.screenHeight * ScreenHeightsByPercentage.fullHeightAppbar,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
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
        height:
            context.screenHeight * ScreenHeightsByPercentage.fullHeightAppbar,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height:
                  context.screenHeight *
                  ScreenHeightsByPercentage.fullHeightAppbar *
                  .45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(0),
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
                                padding: EdgeInsets.zero,
                                onPressed: () => context.go("/cart"),
                                icon: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: primary,
                                  size: context.isSmallDevice ? 25 : 25,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 6,
                                      color: Colors.black.withValues(alpha: .1),
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
                                padding: EdgeInsets.symmetric(horizontal: 2),
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
            ),
            if (showSearchbar) HomePageSearchBar(),
            if (isOrdersPapge && isLoggedIn) RecentOrdersFilter(),
          ],
        ),
      ),
      centerTitle: false,
    );
  }
}
