import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/cart_page_widgets/cart_counts/cart_count_item.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/widgets/cart_page_widgets/cart_counts/confirm_cart_button.dart';

class CartCounts extends ConsumerWidget {
  const CartCounts({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final cartList = ref.watch(cartProvider).value;

    final totalCost = cartList?.fold<double>(
      0,
      (sum, item) => sum + item.quantity * item.price,
    );

    final taxes = (totalCost! * .10);
    final netTotal = (totalCost + taxes + 15);

    return Container(
      height: context.isSmallDevice ? 170 : 190,
      width: double.infinity,
      color: Theme.of(context).colorScheme.primary.withValues(alpha: .1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            spacing: 5,
            children: [
              CartCountItem(
                countKey: context.l10n.subTotal,
                countValue: totalCost.toStringAsFixed(2),
              ),
              CartCountItem(
                countKey: context.l10n.taxes,
                countValue: taxes.toStringAsFixed(2),
              ),
              CartCountItem(countKey: context.l10n.delivery, countValue: "15"),
              CartCountItem(
                countKey: context.l10n.total,
                countValue: netTotal.toStringAsFixed(2),
              ),

              ConfirmCartButton(),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:oven/providers/cart_provider/cart_comment_notifier.dart';
// import 'package:oven/providers/pop_provider/pop_provider.dart';
// import 'package:oven/providers/recent_orders_provider/recent_orders_provider.dart';
// import 'package:oven/providers/schedule_order_provider/scheduled_order_date_provider.dart';
// import 'package:oven/utils/constants/colors.dart';
// import 'package:oven/utils/helpers/localization_extension.dart';
// import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
// import 'package:oven/widgets/cart_page_widgets/cart_counts/cart_count_item.dart';
// import 'package:oven/providers/cart_provider/cart_notifier.dart';
// import 'package:oven/widgets/custom_widgets/custom_global_button.dart';
// import 'package:oven/widgets/orders_page_widgets/recent_orders_items.dart';
// import 'package:uuid/uuid.dart';

// class CartCounts extends ConsumerWidget {
//   const CartCounts({super.key});

//   @override
//   Widget build(BuildContext context, ref) {

//     final cartList = ref.watch(cartProvider).value;
//     final orderContentList = cartList?.map((ele) {
//       return ele.title;
//     }).toList();
//     final orderCounts = cartList
//         ?.map((ele) => ele.quantity * ele.price)
//         .toList();
//     final random = Random();
//     final cartComment = ref.watch(cartCommentProvider);
//     final totalCost = orderCounts?.reduce((value, element) => value + element);
//     final taxes = (totalCost! * .10);
//     final netTotal = (totalCost + taxes + 15);
//     final scheduledDate = ref.watch(scheduledOrderDateProvider);
//     final now = DateTime.now();
//     final deliveryDate = scheduledDate != null
//         ? DateTime(scheduledDate.year, scheduledDate.month, scheduledDate.day)
//         : DateTime(now.year, now.month, now.day + 1);

//     return Container(
//       height: context.isSmallDevice ? 170 : 190,
//       width: double.infinity,
//       color: Theme.of(context).colorScheme.primary.withValues(alpha: .1),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         child: SingleChildScrollView(
//           child: Column(
//             spacing: 5,
//             children: [
//               CartCountItem(
//                 countKey: context.l10n.subTotal,
//                 countValue: totalCost.toStringAsFixed(2),
//               ),
//               CartCountItem(
//                 countKey: context.l10n.taxes,
//                 countValue: taxes.toStringAsFixed(2),
//               ),
//               CartCountItem(countKey: context.l10n.delivery, countValue: "15"),
//               CartCountItem(
//                 countKey: context.l10n.total,
//                 countValue: netTotal.toStringAsFixed(2),
//               ),
//               Container(
//                 width: context.screenWidth * .65,
//                 height: context.isSmallDevice ? 40 : 50,
//                 margin: EdgeInsets.only(top: 5),
//                 child: CustomGlobalButton(
//                   child: context.l10n.placeOrder,
//                   onPressed: () {
//                     ref
//                         .read(recentOrdersListProvider.notifier)
//                         .addOrder(
//                           OrderItem(
//                             id: const Uuid().v4(),
//                             itemsList: orderContentList!,
//                             totalCost: netTotal,
//                             cartData: cartList!,
//                             status: scheduledDate != null
//                                 ? "Scheduled"
//                                 : filteringvalues[random.nextInt(
//                                     filteringvalues.length,
//                                   )],

//                             date: DateTime.now(),
//                             deliveryDate: deliveryDate,
//                             orderComment: cartComment,
//                           ),
//                         );
//                     ref.read(cartProvider.notifier).clearCart();
//                     ref
//                         .read(scheduledOrderDateProvider.notifier)
//                         .updateDate(null);

//                     ref
//                         .read(navigationIndexProvider.notifier)
//                         .setNavigationIndex(2);
//                     ref
//                         .read(cartCommentProvider.notifier)
//                         .setCartComment("comment");
//                     context.go("/orders");
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         backgroundColor: primary,
//                         duration: const Duration(milliseconds: 1200),
//                         content: Text(
//                           context.isArabic ? 'تم تأكيد الطلب' : 'Order Placed',
//                           style: Theme.of(context).textTheme.labelLarge
//                               ?.copyWith(
//                                 color: surface,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// final List<String> filteringvalues = ['Delivered', 'Preparing', 'Cancelled'];
