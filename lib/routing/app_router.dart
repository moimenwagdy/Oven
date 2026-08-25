import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/pages/account_pages/about_page.dart';
import 'package:oven/pages/account_page.dart';
import 'package:oven/pages/cart_page.dart';
import 'package:oven/pages/home_page.dart';
import 'package:oven/pages/landing_page.dart';
import 'package:oven/pages/login_page.dart';
import 'package:oven/pages/orders_page.dart';
import 'package:oven/pages/product_details_page.dart';
import 'package:oven/pages/products_page.dart';
import 'package:oven/pages/account_pages/profile_page.dart';
import 'package:oven/pages/account_pages/requests_page.dart';
import 'package:oven/pages/search_page.dart';
import 'package:oven/pages/signup_pages/external_signup_page/external_new_manager_page/external_new_manager_first_page.dart';
import 'package:oven/pages/signup_pages/external_signup_page/external_new_manager_page/external_new_manager_second_page.dart';
import 'package:oven/pages/signup_pages/external_signup_page/extrnal_new_branch_and_manager_page/external_signup_first_page.dart';
import 'package:oven/pages/signup_pages/external_signup_page/extrnal_new_branch_and_manager_page/external_signup_second_page.dart';
import 'package:oven/pages/signup_pages/internal_signup_pages/business/signup_first_page/signup_first_page.dart';
import 'package:oven/pages/signup_pages/internal_signup_pages/business/signup_second_page/signup_second_page.dart';
import 'package:oven/pages/signup_pages/internal_signup_pages/business/signup_third_page/signup_third_page.dart';
import 'package:oven/pages/signup_pages/internal_signup_pages/personal/personal_signup_first_page.dart';
import 'package:oven/pages/signup_pages/internal_signup_pages/personal/personal_signup_second_page.dart';
import 'package:oven/pages/update_page.dart';
import 'package:oven/widgets/custom_widgets/spinner.dart';
import 'package:oven/widgets/layout_wrapper/layout_wrapper.dart';
import 'package:oven/widgets/signup_page_widgets/internal_signup/personal/personal_signup_second_page_widgets/personal_signup_second_page_form.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<StatefulNavigationShellState> _shellNavigatorKey =
    GlobalKey<StatefulNavigationShellState>();

GoRouter appRouter(String initialLocation) => GoRouter(
  debugLogDiagnostics: true,
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
                  path: 'request',
                  pageBuilder: (c, s) =>
                      NoTransitionPage(child: const RequestsPage()),
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
              path: "map",
              pageBuilder: (context, state) {
                return NoTransitionPage(child: SignupSecondPage());
              },
            ),
            GoRoute(
              path: "location",
              pageBuilder: (context, state) {
                return NoTransitionPage(child: SignupThirdPage());
              },
            ),
          ],
        ),
        GoRoute(
          path: 'external/:trademarkId',
          pageBuilder: (c, s) {
            Widget externalReciver;
            final payload = s.pathParameters['trademarkId']!;
            String prefix = payload.substring(0, 2);
            switch (prefix) {
              case "NM":
                externalReciver = ExternalNewManagerFirstPage(payload: payload);
                break;
              case "NB":
                externalReciver = ExternalSignupFirstPage(payload: payload);
                break;
              default:
                externalReciver = SmallSpinner();
                break;
            }
            return NoTransitionPage(child: externalReciver);
          },
          routes: [
            GoRoute(
              path: "map",
              pageBuilder: (context, state) {
                return NoTransitionPage(child: ExternalSignupSecondPage());
              },
            ),
            GoRoute(
              path: "managermap",
              pageBuilder: (context, state) {
                return NoTransitionPage(child: ExternalNewManagerSecondPage());
              },
            ),
            GoRoute(
              path: "location",
              pageBuilder: (context, state) {
                return NoTransitionPage(child: ExternalNewManagerSecondPage());
              },
            ),
          ],
        ),
        GoRoute(
          path: "personal",
          pageBuilder: (context, state) {
            return NoTransitionPage(child: PersonalSignupFirstPage());
          },
          routes: [
            GoRoute(
              path: "location",
              pageBuilder: (context, state) {
                return NoTransitionPage(child: PersonalSignupSecondPage());
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
