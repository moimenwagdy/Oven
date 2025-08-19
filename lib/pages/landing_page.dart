import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/widgets/landing_page_widgets/landing_language_toggler.dart';
import 'package:oven/widgets/landing_page_widgets/landing_navigation_buttons.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Image.asset(
                "lib/assets/Cheese.jpg",
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              ),
              Container(
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [onSecondary, onSecondary.withOpacity(0.0)],
                    begin: Alignment.center,
                    end: Alignment.topCenter,
                    stops: const [.40, .55],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 320.h),
                    child: Image.asset(
                      "lib/assets/logo_larg.png",
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  LandingNavigationButtons(),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: LandingLanguageToggler(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////// 
// class LandingPage extends StatelessWidget {
//   const LandingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SizedBox(
//           width: double.infinity,
//           height: double.infinity,
//           child: Stack(
//             children: [
//               Opacity(
//                 opacity: 1,
//                 child: Image.asset(
//                   "lib/assets/cookies.jpg",
//                   alignment: Alignment.topCenter,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               Container(
//                 foregroundDecoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [onSecondary, onSecondary.withOpacity(0.0)],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                     stops: const [.44, .65],
//                   ),
//                 ),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 70),
//                     child: ConstrainedBox(
//                       constraints: BoxConstraints(maxWidth: 320.h),
//                       child: Image.asset(
//                         "lib/assets/logo_larg.png",
//                         alignment: Alignment.center,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   LandingNavigationButtons(),
//                 ],
//               ),
//               // const SizedBox(height: 80),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: LandingLanguageToggler(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





/////////////////////////////////////////// LOGO 

// class LandingPage extends StatelessWidget {
//   const LandingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SizedBox(
//           width: double.infinity,
//           height: double.infinity,
//           child: Stack(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(top: 80.h),
//                 child: Align(
//                   alignment: Alignment.topCenter,
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(maxWidth: 320.h),
//                     child: Image.asset(
//                       "lib/assets/logo_larg.png",
//                       alignment: Alignment.center,
//                     ),
//                   ),
//                 ),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   LandingNavigationButtons(),
//                   SizedBox(height: 40),
//                   SkipLandingPage(),
//                   SizedBox(height: 80),
//                 ],
//               ),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: LandingLanguageToggler(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
