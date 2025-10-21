import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/search_bar/home_page_search_bar.dart';

class WavyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const WavyAppBar({super.key, required this.height});
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();
    final isOrdersPage = currentRoute.contains("/orders");
    final isAccountPage = currentRoute.contains("/account");
    final hideSearchBar = isAccountPage || isOrdersPage;
    return SizedBox(
      height: preferredSize.height,
      child: AppBar(
        backgroundColor: primary,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontSize: 12,
          letterSpacing: 1,
          color: Colors.white,
          fontFamily: "EnglishFont",
          locale: const Locale("en"),
          fontWeight: FontWeight.w900,
        ),
        title: Text("${context.l10n.whereToDeliver}..."),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () => context.go("/cart"),
              icon: Icon(Icons.shopping_cart, color: surface),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, context.isSmallDevice ? 40 : 50),
          child: !hideSearchBar
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 0.0, top: 0),
                  child: HomePageSearchBar(),
                )
              : SizedBox.shrink(),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////
/////////////////////////////////////////////
/////////////////////////////////////////////
////////////////////////////////////////////
///
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:oven/utils/constants/colors.dart';
// import 'package:oven/utils/helpers/localization_extension.dart';
// import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
// import 'package:oven/widgets/home_page_widgets/home_page_recent_orders/recent_orders_filter.dart';
// import 'package:oven/widgets/home_page_widgets/home_page_search_bar/home_page_search_bar.dart';

// class WavyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final bool showBackButton;
//   final double height;

//   const WavyAppBar({
//     super.key,
//     required this.showBackButton,
//     required this.height,
//   });
//   @override
//   Size get preferredSize => Size.fromHeight(height);

//   @override
//   Widget build(BuildContext context) {
//     String appBarPageHeader = "";
//     final currentRoute = GoRouterState.of(context).uri.toString();
//     final isOrdersPage = currentRoute.contains("/orders");
//     final isAccountPage = currentRoute.contains("/account");
//     final hideSearchBar = isAccountPage || isOrdersPage;

//     if (isAccountPage) {
//       appBarPageHeader = context.l10n.accountSettings;
//     }
//     if (isOrdersPage) {
//       appBarPageHeader = context.l10n.ordersPageHeader;
//     }

//     return SizedBox(
//       height: preferredSize.height,
//       child: Stack(
//         clipBehavior: Clip.none,
//         alignment: AlignmentGeometry.topCenter,
//         children: [
//           ClipPath(
//             clipper: BottomWaveClipper(),
//             child: Container(
//               color: Theme.of(context).colorScheme.primary,
//               height: context.isSmallDevice ? 90 : 100,
//             ),
//           ),
//           AppBar(
//             backgroundColor: Colors.transparent,
//             foregroundColor: Colors.white,
//             elevation: 0,
//             surfaceTintColor: Colors.transparent,
//             titleTextStyle: Theme.of(context).textTheme.headlineMedium
//                 ?.copyWith(
//                   fontSize: 12,
//                   letterSpacing: 1,
//                   color: Colors.white,
//                   fontFamily: "EnglishFont",
//                   locale: const Locale("en"),
//                   fontWeight: FontWeight.w900,
//                 ),
//             title: Text("${context.l10n.whereToDeliver}..."),
//             centerTitle: false,
//             actions: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 10),
//                 child: IconButton(
//                   onPressed: () => context.go("/cart"),
//                   icon: Icon(Icons.shopping_cart, color: surface),
//                 ),
//               ),
//             ],

//             leading: showBackButton
//                 ? IconButton(
//                     icon: Icon(
//                       Icons.arrow_back,
//                       color: Theme.of(context).colorScheme.onSecondary,
//                     ),
//                     onPressed: () => context.pop(),
//                   )
//                 : null,
//             bottom: !hideSearchBar
//                 ? PreferredSize(
//                     preferredSize: preferredSize,
//                     child: Padding(
//                       padding: const EdgeInsets.only(bottom: 0.0, top: 0),
//                       child: HomePageSearchBar(),
//                     ),
//                   )
//                 : PreferredSize(
//                     preferredSize: Size(0, 0),
//                     child: SizedBox(
//                       height: context.isSmallDevice ? 45 : 50,
//                       width: double.infinity,
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               appBarPageHeader,
//                               style: Theme.of(context).textTheme.labelLarge,
//                               textAlign: TextAlign.start,
//                             ),
//                             ?isOrdersPage ? RecentOrdersFilter() : null,
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }

//   // @override
//   // Size get preferredSize => const Size.fromHeight(140);
// }

// class BottomWaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final Path path = Path();

//     path.lineTo(0, size.height - 10);

//     final double waveHeight1 = 8;
//     final double waveHeight2 = 10;
//     final double waveHeight3 = 4;
//     final double waveHeight4 = 6;
//     final double waveHeight5 = 11;
//     final double waveHeight6 = 6;

//     final double waveWidth = size.width / 6;

//     path.lineTo(waveWidth * 0.5, size.height - 10 - waveHeight1);
//     path.lineTo(waveWidth * 1.0, size.height - 10);

//     path.lineTo(waveWidth * 1.5, size.height - 10 - waveHeight2);
//     path.lineTo(waveWidth * 2.0, size.height - 10);

//     path.lineTo(waveWidth * 2.5, size.height - 10 - waveHeight3);
//     path.lineTo(waveWidth * 3.0, size.height - 10);

//     path.lineTo(waveWidth * 3.5, size.height - 10 - waveHeight4);
//     path.lineTo(waveWidth * 4.0, size.height - 10);

//     path.lineTo(waveWidth * 4.5, size.height - 10 - waveHeight5);
//     path.lineTo(waveWidth * 5.0, size.height - 10);

//     path.lineTo(waveWidth * 5.8, size.height - 10 - waveHeight6);
//     path.lineTo(size.width, size.height - 10);

//     path.lineTo(size.width, 0);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
