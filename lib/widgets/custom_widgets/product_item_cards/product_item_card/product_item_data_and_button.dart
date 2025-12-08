import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/add_to_cart_buttons/global_quantity_buttons_add_and_increase_decrease.dart';
import 'package:oven/widgets/home_page_widgets/home_page_favorites/star_favorite_item.dart';

class ProductItemDataAndButton extends StatelessWidget {
  final TextEditingController quantityController;
  final String title;
  final double price;
  final String description;
  final bool showFavoriteButton;
  final String id;
  const ProductItemDataAndButton({
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
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    context.isArabic
                        ? context.push("/products/${Uri.encodeComponent(id)}")
                        : context.push("/products/$id");
                  },
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: context.isSmallDevice ? 12 : 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.isArabic
                        ? context.push("/products/${Uri.encodeComponent(id)}")
                        : context.push("/products/$id");
                  },
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: showFavoriteButton
                          ? (context.screenWidth - 8) * .30
                          : (context.screenWidth - 8) * .30,
                      maxWidth: showFavoriteButton
                          ? context.isSmallDevice
                                ? (context.screenWidth - 8) * .32
                                : (context.screenWidth - 8) * .35
                          : (context.screenWidth - 8) * .38,
                    ),
                    child: Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
                Row(
                  spacing: 5,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GlobalQuantityButtonsAddAndIncreaseDecrease(
                          key: ValueKey("normalCard_quantity_controller"),
                          controller: quantityController,
                          id: id,
                          price: price,
                          title: title,
                        ),
                      ],
                    ),
                    ?showFavoriteButton
                        ? StarOfFavoriteItem(
                            activeFavoriteStyle: false,
                            id: id,
                          )
                        : null,
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
