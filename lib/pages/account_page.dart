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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const LandingLanguageToggler(),
              ),
            ],
          ),
          AccountPageItems(),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:oven/widgets/landing_page_widgets/landing_language_toggler.dart';

// class AccountPage extends StatelessWidget {
//   const AccountPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: ListView(
//         children: [
//           ListTile(
//             title: Text("About"),
//             onTap: () => context.push("/account/about"),
//           ),
//           ListTile(
//             title: Text("Profile"),
//             onTap: () => context.push("/account/profile"),
//           ),
//           ListTile(
//             title: Text("Reports"),
//             onTap: () => context.push("/account/reports"),
//           ),
//           ListTile(
//             title: Text("Admin"),
//             onTap: () => context.push("/account/admin"),
//           ),
//           ListTile(
//             title: Text("Fav"),
//             onTap: () => context.push("/account/fav"),
//           ),
//           ListTile(title: Text("Landing"), onTap: () => context.push("/")),
//           LandingLanguageToggler(),
//         ],
//       ),
//     );
//   }
// }
