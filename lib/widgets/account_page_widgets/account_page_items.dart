import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/account_page_widgets/account_page_item.dart';
import 'package:oven/widgets/landing_page_widgets/landing_language_toggler.dart';

class AccountPageItems extends StatelessWidget {
  const AccountPageItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          AccountPageItem(
            destination: "/account/profile",
            icon: Icons.person_3_outlined,
            title: context.l10n.profile,
          ),
          AccountPageItem(
            destination: "/account/reports",
            icon: Icons.report_outlined,
            title: context.l10n.reports,
          ),
          AccountPageItem(
            destination: "/account/admin",
            icon: Icons.key,
            title: context.l10n.admin,
          ),
          AccountPageItem(
            destination: "/account/fav",
            icon: Icons.list_outlined,
            title: context.l10n.favoritesTab,
          ),
          AccountPageItem(
            destination: "/account/about",
            icon: Icons.email_outlined,
            title: context.l10n.about,
          ),
          AccountPageItem(
            destination: "",
            icon: Icons.logout_outlined,
            title: context.l10n.logout,
          ),
          ListTile(
            title: Text(
              context.l10n.landing,
              style: TextStyle(fontFamily: "Poppins"),
            ),
            onTap: () => context.push("/"),
          ),
          LandingLanguageToggler(),
        ],
      ),
    );
  }
}
