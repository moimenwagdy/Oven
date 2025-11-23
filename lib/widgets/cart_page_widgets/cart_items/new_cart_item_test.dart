import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items/cart_notifier.dart';
import 'package:oven/widgets/custom%20widgets/add_to_cart_buttons/quantity_field_and_increase_decrease_circle_buttons.dart';

class NewCartItemTest extends ConsumerWidget {
  final TextEditingController controller;
  final int quantity;
  final String description;
  final double price;
  final String id;
  const NewCartItemTest({
    super.key,
    required this.quantity,
    required this.description,
    required this.price,
    required this.id,
    required this.controller,
  });
  @override
  Widget build(BuildContext context, ref) {
    final cartItemProvider = ref.watch(cartProvider).value;
    final currentItemIndex = cartItemProvider?.indexWhere((e) => e.id == id);
    final currentItem = cartItemProvider?[currentItemIndex!];
    final stringifiedPrice = price.toString();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        children: [
          SizedBox(width: 5),
          SizedBox(
            width: (context.screenWidth - 26) * .305,
            child: Text(
              description,
              softWrap: true,
              overflow: TextOverflow.visible,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(
            width: (context.screenWidth - 26) * .18,
            child: Wrap(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              children: [
                Text(
                  stringifiedPrice,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "EGP",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: (context.screenWidth - 26) * .20,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              textDirection: TextDirection.ltr,
              children: [
                Text(
                  '${price * quantity}',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "EGP",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: QuantityFieldAndIncreaseDecreaseCircleButtons(
              controller: TextEditingController(
                text: currentItem?.quantity.toString(),
              ),
              id: id,
            ),
          ),
        ],
      ),
    );
  }
}
