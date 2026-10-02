import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/account_page_widgets/account_page_widget_child_container_item.dart';
import 'package:oven/widgets/custom_widgets/not_logged_in_card.dart';

class AccountPageItems extends ConsumerWidget {
  const AccountPageItems({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final isLoggedin = ref.watch(fakeAuthProvider).value;
    return Expanded(
      child: Column(
        children: [
          if (isLoggedin == null)
            Column(
              children: [
                SizedBox(height: 10),
                NotLoggedInCard(),
                SizedBox(height: 10),
              ],
            ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: isLoggedin == null ? 0 : 10,
                ),
                child: Column(
                  children: [
                    if (isLoggedin != null)
                      AccountPageWidgetChildContainerItem(
                        key: ValueKey("/account/profile"),
                        icon: Icons.person_3_outlined,
                        title: context.l10n.profile,
                        onTap: () => context.push("/account/profile"),
                      ),
                    if (isLoggedin != null)
                      AccountPageWidgetChildContainerItem(
                        key: ValueKey("request"),
                        icon: Icons.request_page,
                        onTap: () => context.push("/account/request"),
                        title: context.l10n.request,
                      ),
                    AccountPageWidgetChildContainerItem(
                      key: ValueKey("/account/about"),
                      icon: Icons.email_outlined,
                      title: context.l10n.about,
                      onTap: () => context.push("/account/about"),
                    ),

                    // AccountPageWidgetChildContainerItem(
                    //   key: ValueKey("external manager"),
                    //   icon: Icons.offline_bolt,
                    //   onTap: () => context.push("/external/NM-1515"),
                    //   title: "External manager",
                    // ),
                    // AccountPageWidgetChildContainerItem(
                    //   key: ValueKey("external2"),
                    //   icon: Icons.offline_bolt,
                    //   onTap: () => context.push("/external/NB-1515"),
                    //   title: "External branch and manager",
                    // ),
                    // AccountPageWidgetChildContainerItem(
                    //   key: ValueKey("exit"),
                    //   icon: Icons.home,
                    //   onTap: () => context.push("/"),
                    //   title: context.l10n.landing,
                    // ),
                    if (isLoggedin != null)
                      AccountPageWidgetChildContainerItem(
                        key: ValueKey("logOut"),
                        icon: Icons.logout,
                        onTap: () {
                          ref.read(fakeAuthProvider.notifier).signOut();
                        },
                        title: context.l10n.logout,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
