import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/add_to_cart_buttons/global_quantity_buttons_add_and_increase_decrease.dart';
import 'package:oven/widgets/home_page_widgets/home_page_favorites/star_favorite_item.dart';

class CustomSquareCardItem extends StatelessWidget {
  final String title;
  final double price;
  final String id;
  final bool activefavoriteStyle;
  final TextEditingController controller;
  final bool sepecialStyle;
  const CustomSquareCardItem({
    super.key,
    required this.title,
    required this.price,
    required this.id,
    required this.controller,
    required this.activefavoriteStyle,
    required this.sepecialStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.onPrimary,
        boxShadow: [
          BoxShadow(
            color: context.isDarkMode
                ? Colors.white.withValues(alpha: .5)
                : Colors.black.withValues(alpha: .3),
            offset: Offset(0, context.isDarkMode ? 0 : 1),
            blurRadius: context.isDarkMode ? 2 : 1,
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  sepecialStyle
                      ? "lib/assets/Cakes2-1.webp"
                      : "lib/assets/Cakes3-2.webp",
                ),
                // child: Image.asset("lib/assets/Cakes3-2.webp"),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: StarOfFavoriteItem(
                  activeFavoriteStyle: activefavoriteStyle,
                  id: id,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Text(
                  price.toString(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 11,
                    color: primary,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 0), // how far the shadow moves (x, y)
                        blurRadius: 2, // how soft the shadow is
                        color: Colors.white, // shadow color
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Flexible(
                    child: AutoSizeText(
                      maxLines: 2,
                      title,
                      minFontSize: 8,
                      maxFontSize: 11,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 30,
            child: GlobalQuantityButtonsAddAndIncreaseDecrease(
              key: ValueKey(Random()),
              id: id,
              controller: controller,
              isSquareLayout: true,
              price: price,
              title: title,
            ),
          ),
        ],
      ),
    );
  }
}








//price at the same line with the title, without heart 
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:oven/utils/constants/colors.dart';
// import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
// import 'package:oven/widgets/custom%20widgets/add_to_cart_buttons/global_quantity_buttons_add_and_increase_decrease_copy.dart';

// class ItemTesting extends StatelessWidget {
//   final String title;
//   final String price;
//   const ItemTesting({super.key, required this.title, required this.price});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(2),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Theme.of(context).colorScheme.onPrimary,
//         boxShadow: [
//           BoxShadow(
//             color: context.isDarkMode
//                 ? Colors.white.withValues(alpha: .5)
//                 : Colors.black.withValues(alpha: .3),
//             offset: Offset(0, context.isDarkMode ? 0 : 1),
//             blurRadius: context.isDarkMode ? 2 : 1,
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(12),
//               topRight: Radius.circular(12),
//             ),
//             child: Image.asset("lib/assets/Cakes3-2.webp"),
//           ),
//           Expanded(
//             child: Container(
//               width: double.infinity,
//               padding: EdgeInsets.symmetric(horizontal: 5),
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Flexible(
//                     child: AutoSizeText(
//                       maxLines: 2,
//                       title,
//                       minFontSize: 8,
//                       maxFontSize: 11,
//                       style: Theme.of(context).textTheme.labelLarge,
//                     ),
//                   ),
//                   Text(
//                     price,
//                     style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                       fontSize: 11,
//                       color: primary,
//                     ),
//                   ),
//                   // Center(
//                   //   child: SizedBox(
//                   //     height: 25,
//                   //     child: GlobalQuantityButtonsAddAndIncreaseDecrease(
//                   //       controller: TextEditingController(text: "0"),
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             width: double.infinity,
//             height: 30,
//             child: GlobalQuantityButtonsAddAndIncreaseDecreaseCopy(
//               controller: TextEditingController(text: "0"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
