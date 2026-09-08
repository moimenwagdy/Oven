import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/user_dispaly_info.dart';
import 'package:oven/widgets/account_page_widgets/account_page_widget_child_container_item.dart';

class AccountPageItems extends ConsumerWidget {
  const AccountPageItems({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final isLoggedin = ref.watch(fakeAuthProvider).value;
    final info = extractUserInfo(isLoggedin);

    print("-***** ${isLoggedin?.name}");
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              if (info != null) Text(info.loggerState.toString()),
              if (info != null) Text(info.name),
              if (info != null) Text(info.email),
              if (info != null) Text(info.phone),
              if (info != null) Text(info.city ?? ""),
              if (info != null) Text(info.area),
              if (info != null) Text(info.street),
              if (info != null) Text(info.building),
              if (info != null) Text(info.floor),
              if (info != null) Text(info.flat),
              if (info != null) Text(info.latitude.toString()),
              if (info != null) Text(info.longitude.toString()),
              if (info != null) Text(info.ownerCity ?? ""),
              if (info != null) Text(info.ownerArea ?? ""),
              if (info != null) Text(info.ownerStreet ?? ""),
              if (info != null) Text(info.ownerBuilding ?? ""),
              if (info != null) Text(info.ownerFloor ?? ""),
              if (info != null) Text(info.ownerFlat ?? ""),
              if (info != null)
                Text(
                  info.hasOwnerLocation
                      ? "Has owner location"
                      : "No owner location",
                ),

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
                key: ValueKey("external manager"),
                icon: Icons.offline_bolt,
                onTap: () => context.push("/external/NM-1515"),
                title: "External manager",
              ),
              AccountPageWidgetChildContainerItem(
                key: ValueKey("external2"),
                icon: Icons.offline_bolt,
                onTap: () => context.push("/external/NB-1515"),
                title: "External branch and manager",
              ),
              AccountPageWidgetChildContainerItem(
                key: ValueKey("exit"),
                icon: Icons.home,
                onTap: () => context.push("/"),
                title: context.l10n.landing,
              ),
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
    );
  }
}
