import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/account_page_widgets/account_page_widget_child_container_item.dart';

class AccountPageItems extends StatelessWidget {
  const AccountPageItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            AccountPageWidgetChildContainerItem(
              key: ValueKey("/account/profile"),
              icon: Icons.person_3_outlined,
              title: context.l10n.profile,
              onTap: () => context.push("/account/profile"),
            ),
      
            AccountPageWidgetChildContainerItem(
              key: ValueKey("/account/reports"),
              icon: Icons.report_outlined,
              title: context.l10n.reports,
              onTap: () => context.push("/account/reports"),
            ),
            AccountPageWidgetChildContainerItem(
              key: ValueKey("/account/about"),
              icon: Icons.email_outlined,
              title: context.l10n.about,
              onTap: () => context.push("/account/about"),
            ),
            AccountPageWidgetChildContainerItem(
              key: ValueKey("logOut"),
              icon: Icons.logout,
              onTap: () => {},
              title: context.l10n.logout,
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
    );
  }
}
