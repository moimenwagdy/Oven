import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/pages/about_page.dart';
import 'package:oven/pages/account_page.dart';
import 'package:oven/pages/admin_page.dart';
import 'package:oven/pages/home_page.dart';
import 'package:oven/pages/login_page.dart';
import 'package:oven/pages/order_details_page.dart';
import 'package:oven/pages/orders_page.dart';
import 'package:oven/pages/product_details_page.dart';
import 'package:oven/pages/products_page.dart';
import 'package:oven/pages/profile_page.dart';
import 'package:oven/pages/reports_page.dart';
import 'package:oven/pages/signup_page.dart';
import 'package:oven/pages/user_fav_page.dart';
import 'package:oven/widgets/layout_wrapper/layout_wrapper.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/home",
  routes: [
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
                      path: 'prodcuts',
                      builder: (c, s) => const ProductsPage(),
                      routes: [
                        GoRoute(
                          path: "prodcutsDetails",
                          builder: (context, state) =>
                              const ProductDetailsPage(productId: "productId"),
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'login',
                      builder: (c, s) => const LoginPage(),
                    ),
                    GoRoute(
                      path: 'signup',
                      builder: (c, s) => const SignupPage(),
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

        GoRoute(path: '/login', builder: (c, s) => const LoginPage()),
        GoRoute(path: '/signup', builder: (c, s) => const SignupPage()),
      ],
    ),
  ],
);
