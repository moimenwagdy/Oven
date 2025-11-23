import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/account_page_widgets/account_page_widget_child_container_item.dart';

class AccountPageItems extends StatelessWidget {
  const AccountPageItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              AccountPageWidgetChildContainerItem(
                destination: "/account/profile",
                icon: Icons.person_3_outlined,
                title: context.l10n.profile,
              ),

              AccountPageWidgetChildContainerItem(
                destination: "/account/reports",
                icon: Icons.report_outlined,
                title: context.l10n.reports,
              ),
              AccountPageWidgetChildContainerItem(
                destination: "/account/about",
                icon: Icons.email_outlined,
                title: context.l10n.about,
              ),
              AccountPageWidgetChildContainerItem(
                icon: Icons.logout,
                onTap: () => {},
                title: context.l10n.logout,
              ),

              ListTile(
                title: Text(
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
