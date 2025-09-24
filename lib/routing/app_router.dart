import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/pages/about_page.dart';
import 'package:oven/pages/account_page.dart';
import 'package:oven/pages/admin_page.dart';
import 'package:oven/pages/home_page.dart';
import 'package:oven/pages/landing_page.dart';
import 'package:oven/pages/login_page.dart';
import 'package:oven/pages/order_details_page.dart';
import 'package:oven/pages/orders_page.dart';
import 'package:oven/pages/product_details_page.dart';
import 'package:oven/pages/products_page.dart';
import 'package:oven/pages/profile_page.dart';
import 'package:oven/pages/reports_page.dart';
import 'package:oven/pages/signup_pages/signup_first_page/signup_first_page.dart';
import 'package:oven/pages/signup_pages/signup_second_page/signup_second_page.dart';
import 'package:oven/pages/update_page.dart';
import 'package:oven/pages/user_fav_page.dart';
import 'package:oven/widgets/layout_wrapper/layout_wrapper.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

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
    ShellRoute(
      builder: (context, state, child) => LayoutWrapper(child: child),
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return navigationShell;
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/home',
                  builder: (context, state) => const HomePage(),
                  routes: [
                    GoRoute(
                      path: 'products',
                      builder: (c, s) => const ProductsPage(),
                      routes: [
                        GoRoute(
                          path: "productsDetails",
                          builder: (context, state) =>
                              const ProductDetailsPage(productId: "productId"),
                        ),
                      ],
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
                  routes: [
                    GoRoute(
                      path: ':orderId',
                      builder: (c, s) {
                        // final id = s.pathParameters['orderId']!;
                        // return OrderDetailsPage(orderId: id);
                        return const OrderDetailsPage(orderId: 'mo');
                      },
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/account',
                  builder: (context, state) => const AccountPage(),
                  routes: [
                    GoRoute(path: 'profile', builder: (c, s) => ProfilePage()),
                    GoRoute(
                      path: 'about',
                      builder: (c, s) => const AboutPage(),
                    ),
                    GoRoute(
                      path: 'reports',
                      builder: (c, s) => const ReportsPage(),
                    ),
                    GoRoute(
                      path: 'admin',
                      builder: (c, s) => const AdminPage(),
                    ),
                    GoRoute(
                      path: 'fav',
                      builder: (c, s) => const UserFavPage(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/',
      builder: (c, s) => const LandingPage(),
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
              path: "more",
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
