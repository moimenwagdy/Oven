import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/add_to_cart_buttons/quantity_increase_decrease_circle_button.dart';
import 'package:oven/widgets/custom_widgets/add_to_cart_buttons/quantity_text_field.dart';

class QuantityFieldAndIncreaseDecreaseCircleButtons extends ConsumerWidget {
  final TextEditingController controller;
  final String id;
  final String title;
  final double price;
  final bool allowAttachImage;
  const QuantityFieldAndIncreaseDecreaseCircleButtons({
    super.key,
    required this.controller,
    required this.id,
    required this.price,
    required this.title,
    required this.allowAttachImage,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      width: context.isSmallDevice ? 114 : 120,
      height: 35,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: TextDirection.ltr,
        children: [
          CyrcleIncreaseDecreaseQuantityButton(
            key: Key("remove"),
            icon: Icons.remove,
            controler: controller,
            isIncrement: false,
            editingEnd: () => {},
            price: price,
            title: title,
            allowAttachImage: allowAttachImage,
            id,
          ),
          QuantityTextField(
            controller: controller,
            editingEnd: () {
              if (controller.text.isEmpty) {
                controller.text = 0.toString();
              }
              ref
                  .read(cartProvider.notifier)
                  .replaceItem(id, int.parse(controller.text));
            },
          ),
          CyrcleIncreaseDecreaseQuantityButton(
            key: Key("add"),
            icon: Icons.add,
            controler: controller,
            isIncrement: true,
            editingEnd: () => {},
            id,
            price: price,
            title: title,
            allowAttachImage: allowAttachImage,
          ),
        ],
      ),
    );
  }
}
