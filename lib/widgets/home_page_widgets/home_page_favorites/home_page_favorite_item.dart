// import 'package:flutter/material.dart';
// import 'package:oven/utils/helpers/localization_extension.dart';
// import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
// import 'package:oven/widgets/custom%20widgets/add_to_cart_buttons/global_quantity_buttons_add_and_increase_decrease.dart';
// import 'package:oven/widgets/home_page_widgets/home_page_favorites/item_details_bottom_screen_modal.dart';
// import 'package:oven/widgets/home_page_widgets/home_page_favorites/star_favorite_item.dart';

// class HomePageFavoriteItem extends StatefulWidget {
//   final TextEditingController controller;
//   final int index;
//   final String text;

//   const HomePageFavoriteItem({
//     super.key,
//     required this.controller,
//     required this.index,
//     required this.text,
//   });

//   @override
//   State<HomePageFavoriteItem> createState() => _HomePageFavoriteItemState();
// }

// class _HomePageFavoriteItemState extends State<HomePageFavoriteItem>
//     with AutomaticKeepAliveClientMixin {
//   bool isSelected = false;

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);

//     return Container(
//       margin: EdgeInsets.only(bottom: 5),
//       color: context.isDarkMode
//           ? Theme.of(context).colorScheme.onSurface.withValues(alpha: .15)
//           : Theme.of(context).colorScheme.onSurface.withValues(alpha: .02),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
//         child: SizedBox(
//           height: context.isSmallDevice ? 70 : 80,
//           width: double.infinity,
//           child: Row(
//             children: [
//               GestureDetector(
//                 child: ConstrainedBox(
//                   constraints: BoxConstraints(
//                     maxHeight: context.isSmallDevice ? 50 : 60,
//                   ),
//                   child: Stack(
//                     children: [
//                       Image.asset(
//                         "lib/assets/Cakes3-2.webp",
//                         fit: BoxFit.cover,
//                       ),
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: StarOfFavoriteItem(),
//                       ),
//                     ],
//                   ),
//                 ),
//                 onTap: () => itemDetailBottomScreenModal(
//                   context,
//                   widget.index.toString(),
//                 ),
//               ),
//               SizedBox(width: 10),
//               Padding(
//                 padding: const EdgeInsets.only(top: 4.0),
//                 child: SizedBox(
//                   width: context.isSmallDevice ? 130 : 160,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Expanded(
//                         flex: 0,
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Text(
//                             widget.text,
//                             style: Theme.of(context).textTheme.labelLarge
//                                 ?.copyWith(
//                                   color: Theme.of(
//                                     context,
//                                   ).colorScheme.onSurface,
//                                 ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: SingleChildScrollView(
//                           child: Text(
//                             context.l10n.favoriteItemDescription,
//                             style: Theme.of(context).textTheme.labelSmall
//                                 ?.copyWith(
//                                   color: Theme.of(
//                                     context,
//                                   ).colorScheme.onSurface,
//                                 ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(width: 5),
//               Expanded(
//                 child: Center(
//                   child: SizedBox(
//                     child: GlobalQuantityButtonsAddAndIncreaseDecrease(
//                       controller: widget.controller,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   bool get wantKeepAlive => true;
// }
