import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/product_item_cards/product_item_card/product_item_data_and_button.dart';
import 'package:oven/widgets/custom_widgets/product_item_cards/product_item_card/product_item_image.dart';

class ProductItemCard extends StatelessWidget {
  final TextEditingController quantityController;
  final String title;
  final String description;
  final bool showFavoriteButton;
  final String id;
  final double price;

  const ProductItemCard({
    super.key,
    required this.quantityController,
    required this.title,
    required this.description,
    required this.showFavoriteButton,
    required this.id,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.isSmallDevice ? 70 : 80,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Theme.of(context).colorScheme.onSecondaryFixed,
        elevation: 0,
        margin: EdgeInsets.only(bottom: 5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            spacing: 10,
            children: [
              ProductItemImage(productId: id),
              ProductItemDataAndButton(
                quantityController: quantityController,
                title: title,
                description: description,
                showFavoriteButton: showFavoriteButton,
                id: id,
                price: price,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
