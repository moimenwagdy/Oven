import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/widgets/custom_widgets/custom_global_button.dart';

class ProductDetailsAddToCartButton extends ConsumerWidget {
  final String title;
  final double price;
  final String id;
  final TextEditingController controller;
  final bool allowAttachImage;

  const ProductDetailsAddToCartButton({
    super.key,
    required this.id,
    required this.price,
    required this.title,
    required this.controller,
    required this.allowAttachImage,
  });

  @override
  Widget build(BuildContext context, ref) {
    final cost = (int.parse(controller.text) * price).toStringAsFixed(2);
    final isAddedToCart = int.parse(controller.text) > 0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: context.screenWidth * .90,
          minHeight: context.isSmallDevice ? 40 : 50,
          maxHeight: 50,
        ),
        child: CustomGlobalButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isAddedToCart
                  ? Text("items ${controller.text}")
                  : Text(context.l10n.addToCart),
              ?isAddedToCart
                  ? Center(
                      child: Icon(
                        Icons.add,
                        size: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null,
              Text(cost),
            ],
          ),
          onPressed: () => {
            ref
                .watch(cartProvider.notifier)
                .addItem(
                  CartItem(
                    id: id,
                    price: 14,
                    title: title,
                    quantity: 1,
                    allowAttachImage: allowAttachImage,
                  ),
                ),
          },
        ),
      ),
    );
  }
}
