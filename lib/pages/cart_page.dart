import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/cart_page_widgets/cart_counts/cart_counts.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items/cart_items_list.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items/new_cart_items_header_test.dart';
import 'package:oven/widgets/custom_widgets/spinner.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';
import 'package:oven/widgets/sugestions_items_widget/custom_list_with_header.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final cartLogic = ref.watch(cartProvider);
    return cartLogic.when(
      data: (data) {
        return data.isEmpty
            ? Column(
                children: [
                  const Expanded(child: Center(child: Text("Cart Is Empty"))),
                  CustomListWithHeader(
                    header: context.l10n.itemsYouMayLike,
                    itemsList: context.isArabic
                        ? arabicProducts.sublist(45, 60)
                        : englishProducts.sublist(45, 60),
                    color: Colors.transparent,
                    activefavoriteStyle: false,
                    specialStyle: false,
                  ),
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const NewCartItemsHeaderTest(),
                    const SizedBox(height: 10),
                    ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 200),
                      child: Column(children: [CartItemsList()]),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () => {
                        ref.read(cartProvider.notifier).clearCart(),
                      },
                      child: Text("Clear"),
                    ),
                    CustomListWithHeader(
                      header: context.l10n.itemsYouMayLike,
                      itemsList: context.isArabic
                          ? arabicProducts.sublist(45, 60)
                          : englishProducts.sublist(45, 60),
                      color: Colors.transparent,
                      activefavoriteStyle: false,
                      specialStyle: false,
                    ),
                   
                    const CartCounts(),
                  ],
                ),
              );
      },
      error: (e, _) => Text("error"),
      loading: () => SmallSpinner(),
    );
  }
}
