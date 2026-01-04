import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/pages/about_page.dart';
import 'package:oven/pages/account_page.dart';
import 'package:oven/pages/cart_page.dart';
import 'package:oven/pages/home_page.dart';
import 'package:oven/pages/landing_page.dart';
import 'package:oven/pages/login_page.dart';
import 'package:oven/pages/orders_page.dart';
import 'package:oven/pages/product_details_page.dart';
import 'package:oven/pages/products_page.dart';
import 'package:oven/pages/profile_page.dart';
import 'package:oven/pages/reports_page.dart';
import 'package:oven/pages/search_page.dart';
import 'package:oven/pages/signup_pages/signup_first_page/signup_first_page.dart';
import 'package:oven/pages/signup_pages/signup_second_page/signup_second_page.dart';
import 'package:oven/pages/update_page.dart';
import 'package:oven/widgets/layout_wrapper/layout_wrapper.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<StatefulNavigationShellState> _shellNavigatorKey =
    GlobalKey<StatefulNavigationShellState>();

GoRouter appRouter(String initialLocation) => GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: initialLocation,

  routes: [
    GoRoute(
      path: "/update",
      pageBuilder: (c, s) {
        return NoTransitionPage(child: UpdatePage());
      },
    ),

    StatefulShellRoute.indexedStack(
      key: _shellNavigatorKey,
      builder: (context, state, navigationShell) {
        return LayoutWrapper(shell: navigationShell, child: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/products",
              pageBuilder: (c, s) => NoTransitionPage(child: ProductsPage()),
              routes: [
                GoRoute(
                  path: ":productId",
                  pageBuilder: (context, state) {
                    final productId = state.pathParameters['productId']!;
                    return NoTransitionPage(
                      child: ProductDetailsPage(productId: productId),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/orders',
              builder: (context, state) => const OrdersPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/account',
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: const AccountPage()),
              routes: [
                GoRoute(
                  path: 'profile',
                  pageBuilder: (c, s) =>
                      NoTransitionPage(child: const ProfilePage()),
                ),
                GoRoute(
                  path: 'about',
                  pageBuilder: (c, s) =>
                      NoTransitionPage(child: const AboutPage()),
                ),
                GoRoute(
                  path: 'reports',
                  pageBuilder: (c, s) =>
                      NoTransitionPage(child: const ReportsPage()),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/cart",
              pageBuilder: (c, s) => NoTransitionPage(child: const CartPage()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/search",
              pageBuilder: (c, s) =>
                  NoTransitionPage(child: const SearchPage()),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/',
      pageBuilder: (c, s) => NoTransitionPage(child: LandingPage()),
      routes: [
        GoRoute(
          path: 'login/:type',
          pageBuilder: (c, s) {
            final type = s.pathParameters['type']!;
            return NoTransitionPage(child: LoginPage(type: type));
          },
        ),
        GoRoute(
          path: 'signup/:type',
          pageBuilder: (c, s) {
            final type = s.pathParameters['type']!;
            return NoTransitionPage(child: SignupFirstPage(type: type));
          },
          routes: [
            GoRoute(
              path: "moreinfo",
              pageBuilder: (context, state) {
                final type = state.pathParameters['type']!;
                return NoTransitionPage(child: SignupSecondPage(type: type));
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
