import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items/cart_item_test.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items/cart_table_item.dart';

class CartItemsList extends ConsumerStatefulWidget {
  const CartItemsList({super.key});
  @override
  ConsumerState<CartItemsList> createState() => _CartItemsListState();
}

class _CartItemsListState extends ConsumerState<CartItemsList> {
  final Map<String, TextEditingController> _controllers = {};
  final Map<String, TextEditingController> _commentControllers = {};
  int toggelableWidget = 0;
  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    for (final c in _commentControllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartList = ref.watch(cartProvider).value ?? [];
    final currentIds = cartList.map((e) => e.id).toSet();
    _controllers.removeWhere((key, controller) => !currentIds.contains(key));
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              toggelableWidget == 0
                  ? toggelableWidget = 1
                  : toggelableWidget = 0;
            });
          },
          child: Text("Toggle Style"),
        ),
        ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              color: Theme.of(context).colorScheme.primary,
              height: 1,
            );
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cartList.length,
          itemBuilder: (context, index) {
            final item = cartList[index];
            final controller = _controllers.putIfAbsent(
              item.id,
              () => TextEditingController(text: item.quantity.toString()),
            );
            final commentController = _commentControllers.putIfAbsent(
              item.id,
              () => TextEditingController(),
            );
            final quantityText = item.quantity.toString();
            if (controller.text != quantityText) {
              final selection = controller.selection;
              controller.value = controller.value.copyWith(
                text: quantityText,
                selection: selection,
                composing: TextRange.empty,
              );
            }
            if (toggelableWidget == 0) {
              return CartTableItem(
                key: ValueKey(item.id),
                controller: controller,
                description: item.title,
                price: item.price,
                id: item.id,
                quantity: item.quantity,
                commentController: commentController,
                comment: item.comment,
                allowAttachImage: item.allowAttachImage,
              );
            }
            if (toggelableWidget == 1) {
              return CartItemTest(
                quantity: item.quantity,
                description: item.title,
                price: item.price,
                id: item.id,
                controller: controller,
                commentController: commentController,
                comment: item.comment,
                allowAttachImage: item.allowAttachImage,
              );
            }
          },
        ),
      ],
    );
  }
}
