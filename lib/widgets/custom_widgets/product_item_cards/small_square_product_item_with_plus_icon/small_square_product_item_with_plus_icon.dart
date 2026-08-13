// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
// import 'package:oven/widgets/custom_widgets/product_item_cards/small_square_product_item_with_plus_icon/small_square_add_buoon_icon.dart';
// import 'package:oven/widgets/custom_widgets/product_item_cards/small_square_product_item_with_plus_icon/small_square_image.dart';
// import 'package:oven/widgets/custom_widgets/product_item_cards/small_square_product_item_with_plus_icon/small_square_price.dart';
// import 'package:oven/widgets/home_page_widgets/home_page_favorites/star_favorite_item.dart';
// import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';

// class SmallSquareProductItemWithPlusIcon extends StatefulWidget {
//   const SmallSquareProductItemWithPlusIcon({super.key});

//   @override
//   State<SmallSquareProductItemWithPlusIcon> createState() =>
//       _SmallSquareProductItemWithPlusIconState();
// }

// class _SmallSquareProductItemWithPlusIconState
//     extends State<SmallSquareProductItemWithPlusIcon>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Scrollbar(
//       child: Padding(
//         padding: EdgeInsets.only(bottom: 2),
//         child: GridView.builder(
//           key: const PageStorageKey("suggestionGridSfystem"),
//           scrollDirection: Axis.horizontal,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 1,
//             mainAxisSpacing: 10,
//             childAspectRatio: 1,
//           ),
//           padding: EdgeInsets.all(5),
//           itemCount: 20,
//           itemBuilder: (context, index) {
//             final usedArr = englishProducts.sublist(0, 20);
//             final item = usedArr[index];
//             return Container(
//               padding: EdgeInsets.all(2),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: Theme.of(context).colorScheme.onPrimary,
//                 boxShadow: [
//                   BoxShadow(
//                     color: context.isDarkMode
//                         ? Colors.white.withValues(alpha: .5)
//                         : Colors.black.withValues(alpha: .3),
//                     offset: Offset(0, context.isDarkMode ? 0 : 1),
//                     blurRadius: context.isDarkMode ? 2 : 1,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   Stack(
//                     alignment: Alignment.topRight,
//                     children: [
//                       GestureDetector(
//                         onTap: () => context.push("/products/${item.id}"),
//                         child: const SmallSquareImage(),
//                       ),
//                       SmallSquareAddButtonIcon(
//                         id: item.id,
//                         price: item.price,
//                         title: item.title,
//                       ),
//                       SmallSquarePrice(price: item.price),
//                       Positioned(
//                         top: 12,
//                         left: 10,
//                         child: StarOfFavoriteItem(
//                           activeFavoriteStyle: false,
//                           id: item.id,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Expanded(
//                     child: Container(
//                       width: double.infinity,
//                       padding: context.isArabic
//                           ? EdgeInsets.only(right: 5)
//                           : EdgeInsets.only(left: 5),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           GestureDetector(
//                             onTap: () => context.push("/products/${item.id}"),
//                             child: Text(
//                               textAlign: TextAlign.start,
//                               item.title,
//                               style: Theme.of(
//                                 context,
//                               ).textTheme.labelLarge?.copyWith(fontSize: 12),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   bool get wantKeepAlive => true;
// }
