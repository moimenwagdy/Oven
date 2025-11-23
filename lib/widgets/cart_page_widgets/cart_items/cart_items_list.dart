import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items/cart_notifier.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items/new_cart_item_test.dart';

class CartItemsList extends ConsumerStatefulWidget {
  const CartItemsList({super.key});

  @override
  ConsumerState<CartItemsList> createState() => _CartItemsListState();
}

class _CartItemsListState extends ConsumerState<CartItemsList> {
  // Hold a controller for each item id
  final Map<String, TextEditingController> _controllers = {};

  @override
  void dispose() {
    // Dispose all controllers when widget is removed
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartList = ref.watch(cartProvider).value ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(cartList.length, (index) {
        final item = cartList[index];

        final controller = _controllers.putIfAbsent(
          item.id,
          () => TextEditingController(text: item.quantity.toString()),
        );

        final quantityText = item.quantity.toString();
        if (controller.text != quantityText) {
          controller.text = quantityText;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: NewCartItemTest(
            controller: controller,
            description: item.title,
            price: item.price,
            id: item.id,
            quantity: item.quantity,
          ),
        );
      }),
    );
  }
}

