import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/account_page_widgets/account_page_widget_child_container_item.dart';

class AccountPageItems extends ConsumerWidget {
  const AccountPageItems({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final isLoggedin = ref.watch(fakeAuthProvider).value;
    print("-***** ${isLoggedin?.name}");
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              if (isLoggedin != null) Text(isLoggedin.name),
              AccountPageWidgetChildContainerItem(
                key: ValueKey("/account/profile"),
                icon: Icons.person_3_outlined,
                title: context.l10n.profile,
                onTap: () => context.push("/account/profile"),
              ),
              AccountPageWidgetChildContainerItem(
                key: ValueKey("/account/about"),
                icon: Icons.email_outlined,
                title: context.l10n.about,
                onTap: () => context.push("/account/about"),
              ),
              AccountPageWidgetChildContainerItem(
                key: ValueKey("request"),
                icon: Icons.request_page,
                onTap: () => context.push("/account/request"),
                title: "Request",
              ),
              AccountPageWidgetChildContainerItem(
                key: ValueKey("logOut"),
                icon: Icons.logout,
                onTap: () {
                  ref.read(fakeAuthProvider.notifier).signOut();
                },
                title: context.l10n.logout,
              ),
              AccountPageWidgetChildContainerItem(
                key: ValueKey("external"),
                icon: Icons.offline_bolt,
                onTap: () => context.push("/external/NM-1515"),
                title: "External",
              ),
              AccountPageWidgetChildContainerItem(
                key: ValueKey("external2"),
                icon: Icons.offline_bolt,
                onTap: () => context.push("/external/NB-1515"),
                title: "External",
              ),
              GestureDetector(
                child: Text(
                  context.l10n.landing,
                  style: TextStyle(fontFamily: "Poppins"),
                ),
                onTap: () => context.push("/"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
