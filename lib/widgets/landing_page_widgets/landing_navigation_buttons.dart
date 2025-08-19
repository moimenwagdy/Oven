import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/constants/colors.dart';
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
//               color: primary.withOpacity(.7),
//             ),
//             SizedBox(height: 20.h),
//             LandingNavigathionButton(
//               child: context.l10n.newMerchant,
//               color: onSurface.withOpacity(.6),
//               destination: "/signup",
//             ),
//             SizedBox(height: 20.h),
//             LandingNavigathionButton(
//               child: context.l10n.personalCustomer,
//               destination: "/login",
//               color: onPrimary.withOpacity(.7),
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
              destination: "/",
              color: primary.withOpacity(.7),
            ),
            SizedBox(height: 20.h),
            LandingNavigathionButton(
              child: context.l10n.newMerchant,
              color: onSurface.withOpacity(.6),
              destination: "/signup",
            ),
            SizedBox(height: 20.h),
            LandingNavigathionButton(
              child: context.l10n.personalCustomer,
              destination: "/login",
              color: onPrimary.withOpacity(.7),
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
