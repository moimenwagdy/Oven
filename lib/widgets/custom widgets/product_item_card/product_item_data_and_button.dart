import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/add_to_cart_buttons/global_quantity_buttons_add_and_increase_decrease.dart';
import 'package:oven/widgets/home_page_widgets/home_page_favorites/star_favorite_item.dart';

class ProductItemDataAndButton extends StatelessWidget {
  final TextEditingController quantityController;
  final String title;
  final String description;
  final bool showFavoriteButton;
  const ProductItemDataAndButton({
    super.key,
    required this.quantityController,
    required this.title,
    required this.description,
    required this.showFavoriteButton,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.isSmallDevice ? 10 : 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: context.isArabic ? 16 : 16,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: context.screenWidth * .30,
                  child: Text(
                    description,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Row(
                  spacing: 15,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GlobalQuantityButtonsAddAndIncreaseDecrease(
                          controller: quantityController,
                        ),
                      ],
                    ),
                    showFavoriteButton
                        ? StarOfFavoriteItem()
                        : SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
