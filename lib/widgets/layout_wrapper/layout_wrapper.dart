import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/routing/root_back_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/pop_provider/pop_provider.dart';
import 'package:oven/utils/constants/percentages_of_screen_heights.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/layout_wrapper/back_arrow_app_bar.dart';
import 'package:oven/widgets/layout_wrapper/layout_bottom_navbar.dart';
import 'package:oven/widgets/layout_wrapper/main_app_bar.dart';

class LayoutWrapper extends ConsumerWidget {
  final Widget child;
  final StatefulNavigationShell shell;
  const LayoutWrapper({super.key, required this.child, required this.shell});
  @override
  Widget build(BuildContext context, ref) {
    final location = GoRouterState.of(context).uri.toString();

    void onTabTap(int index) {
      ref.read(navigationIndexProvider.notifier).setNavigationIndex(index);
      shell.goBranch(index, initialLocation: true);
    }

    final hideAppBar = [
      "/account/profile",
      "/account/about",
      "/account/request",
      "/account/request/newBranch",
      "/account/request/newBranch/mySelf",
      "/account/request/newBranch/otherPerson",
      "/account/request/managerSettings",
      "/account/request/managerSettings/addManager",
      "/account/request/managerSettings/deleteManager",
      "/account/request/managerSettings/resetManager",
      "/account/request/managerSettings/editManager",
      "/account",
      "/search",
    ].contains(location);
    final showBackArrowAppBar = [
      "/account/profile",
      "/account/about",
      "/account/request",
      "/account/request/newBranch",
      "/account/request/newBranch/mySelf",
      "/account/request/newBranch/otherPerson",
      "/account/request/managerSettings",
      "/account/request/managerSettings/addManager",
      "/account/request/managerSettings/deleteManager",
      "/account/request/managerSettings/resetManager",
      "/account/request/managerSettings/editManager",
    ].contains(location);
    return Scaffold(
      appBar: hideAppBar
          ? showBackArrowAppBar
                ? PreferredSize(
                    preferredSize: Size.fromHeight(
                      context.screenHeight *
                          ScreenHeightsByPercentage.backArrowHeightAppbar,
                    ),
                    child: BackArrowAppBar(),
                  )
                : null
          : PreferredSize(
              preferredSize: Size.fromHeight(
                context.screenHeight *
                    ScreenHeightsByPercentage.fullHeightAppbar,
              ),
              child: MainAppBar(shell: shell),
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
