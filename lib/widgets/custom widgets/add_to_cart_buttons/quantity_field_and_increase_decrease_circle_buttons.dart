import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items/cart_notifier.dart';
import 'package:oven/widgets/custom%20widgets/add_to_cart_buttons/quantity_increase_decrease_circle_button.dart';
import 'package:oven/widgets/custom%20widgets/add_to_cart_buttons/quantity_text_field.dart';

class QuantityFieldAndIncreaseDecreaseCircleButtons extends ConsumerWidget {
  final TextEditingController controller;
  final String id;
  const QuantityFieldAndIncreaseDecreaseCircleButtons({
    super.key,
    required this.controller,
    required this.id,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.ltr,
      children: [
        CyrcleIncreaseDecreaseQuantityButton(
          key: Key("remove"),
          icon: Icons.remove,
          controler: controller,
          isIncrement: false,
          editingEnd: () => {},
          id,
        ),
        QuantityTextField(
          key: const ValueKey('quantityField'),
          controller: controller,
          editingEnd: () => {
            ref
                .watch(cartProvider.notifier)
                .replaceItem(id, int.parse(controller.text)),
          },
        ),
        CyrcleIncreaseDecreaseQuantityButton(
          key: Key("add"),
          icon: Icons.add,
          controler: controller,
          isIncrement: true,
          editingEnd: () => {},
          id,
        ),
      ],
    );
  }
}
