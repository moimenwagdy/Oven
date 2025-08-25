import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/landing_page_widgets/landing_navigation_button.dart';
import 'package:oven/widgets/landing_page_widgets/skip_landing_page.dart';

// class LandingNavigationButtons extends StatelessWidget {
//   const LandingNavigationButtons({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 16.0, right: 16.5),
//       child: SizedBox(
//         width: double.infinity,
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             LandingNavigathionButton(
//               child: context.l10n.currentMerchant,
//               destination: "/account/fav",
//               color: Theme.of(context).colorScheme.primary.withOpacity(.7),
//             ),
//             SizedBox(height: 20.h),
//             LandingNavigathionButton(
//               child: context.l10n.newMerchant,
//               color: Theme.of(context).colorScheme.surface.withOpacity(.6),
//               destination: "/signup",
//             ),
//             SizedBox(height: 20.h),
//             LandingNavigathionButton(
//               child: context.l10n.personalCustomer,
//               destination: "/login",
//               color: Theme.of(context).colorScheme.onPrimary.withOpacity(.7),
//             ),
//               SizedBox(height: 40),
//           ],
//         ),
//       ),
//     );
//   }
// }

class LandingNavigationButtons extends StatelessWidget {
  const LandingNavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.5),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            LandingNavigathionButton(
              child: context.l10n.currentMerchant,
              destination: "/login/currentMerchant",
              color: Theme.of(context).colorScheme.primary.withOpacity(.7),
            ),
            SizedBox(height: 20.h),
            LandingNavigathionButton(
              child: context.l10n.newMerchant,
              color: Theme.of(context).colorScheme.surface.withOpacity(.6),
              destination: "/signup/newMerchant",
            ),
            SizedBox(height: 20.h),
            LandingNavigathionButton(
              child: context.l10n.personalCustomer,
              destination: "/login/personal",
              color: Theme.of(context).colorScheme.surface.withOpacity(.7),
            ),
            SizedBox(height: 40),
            SkipLandingPage(),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
