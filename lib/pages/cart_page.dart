import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/cart_page_widgets/cart_counts/cart_counts.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items/cart_items_list.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items/cart_notifier.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items/new_cart_items_header_test.dart';
import 'package:oven/widgets/custom%20widgets/titled_items_with_header.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final cartLength = ref.watch(cartProvider).value?.length;
    final cartISEmpty = cartLength == 0;
    return cartISEmpty
        ? Column(
            children: [
              Expanded(child: Center(child: Text("Cart Is Empty"))),
              TitledItemsWithHeader(itemsTitle: context.l10n.itemsYouMayLike),
            ],
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                NewCartItemsHeaderTest(),
                SizedBox(height: 10),
                ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 200),
                  child: Column(children: [CartItemsList()]),
                ),
                TitledItemsWithHeader(itemsTitle: context.l10n.itemsYouMayLike),
                CartCounts(),
              ],
            ),
          );
  }
}
