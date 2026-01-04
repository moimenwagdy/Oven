import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.push("/products/$id");
                  },
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push("/products/$id");
                        },
                        child: SizedBox(
                          width: (context.screenWidth - 8) * .30,
                          child: Text(
                            description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GlobalQuantityButtonsAddAndIncreaseDecrease(
                          key: ValueKey("normalCard_quantity_controller"),
                          controller: quantityController,
                          id: id,
                          price: price,
                          title: title,
                          isSquareLayout: false,
                        ),
                        SizedBox(width: context.isSmallDevice ? 5 : 10),
                        ?showFavoriteButton
                            ? StarOfFavoriteItem(
                                activeFavoriteStyle: false,
                                id: id,
                              )
                            : null,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "$price ${context.l10n.le}",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
