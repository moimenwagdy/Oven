import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/account_page_widgets/account_page_items.dart';
import 'package:oven/widgets/landing_page_widgets/landing_language_toggler.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                context.isDarkMode
                    ? "lib/assets/Cakes_dark.webp"
                    : "lib/assets/Cakes3-2.webp",
                fit: context.isPortrait ? BoxFit.cover : BoxFit.contain,
                width: double.infinity,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: LandingLanguageToggler(key: ValueKey("AccountToggler")),
              ),
            ],
          ),
          const AccountPageItems(),
        ],
      ),
    );
  }
}
