import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items/cart_items_list.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items/cart_items_table_header.dart';
import 'package:oven/widgets/custom_widgets/spinner.dart';

class CartItemsSection extends ConsumerWidget {
  const CartItemsSection({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final cartLogic = ref.watch(cartProvider);
    return cartLogic.when(
      data: (data) {
        if (data.isEmpty) {
          return SizedBox(
            height:350,
            child: Center(child: Text("Cart Is Empty")),
          );
        } else {
          return Column(
            children: [
              const CartItemsTableHeader(),
              const SizedBox(height: 10),
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 200),
                child: const CartItemsList(),
              ),
            ],
          );
        }
      },
      error: (e, _) => const Text("error"),
      loading: () => const SmallSpinner(),
    );
  }
}
