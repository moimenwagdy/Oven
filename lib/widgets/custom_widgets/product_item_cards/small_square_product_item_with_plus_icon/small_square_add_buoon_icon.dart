// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:oven/providers/cart_provider/cart_notifier.dart';
// import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

// class SmallSquareAddButtonIcon extends ConsumerWidget {
//   final String id;
//   final String title;
//   final double price;
//   const SmallSquareAddButtonIcon({
//     super.key,
//     required this.id,
//     required this.title,
//     required this.price,
//     required,
//   });

//   @override
//   Widget build(BuildContext context, ref) {
//     return Positioned(
//       top: 4,
//       right: 4,
//       child: Container(
//         width: 35,
//         height: 35,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: context.isDarkMode
//               ? Theme.of(context).colorScheme.surface.withValues(alpha: .8)
//               : Theme.of(context).colorScheme.surface,
//         ),
//         child: IconButton(
//           icon: const Icon(Icons.add),
//           iconSize: 18,
//           padding: EdgeInsets.zero,
//           constraints: const BoxConstraints(minWidth: 35, minHeight: 35),
//           color: Theme.of(context).colorScheme.primary,
//           onPressed: () {
//             ref
//                 .watch(cartProvider.notifier)
//                 .addItem(CartItem(id: id, title: title, price: price));
//           },
//         ),
//       ),
//     );
//   }
// }
