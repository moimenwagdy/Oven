import 'package:flutter/material.dart';
import 'package:oven/widgets/custom_widgets/product_item_cards/large_square_product_card_with_add_butttons_and_quantity_controllers_items/large_square_nodisscount_price.dart';
import 'package:oven/widgets/custom_widgets/product_item_cards/large_square_product_card_with_add_butttons_and_quantity_controllers_items/large_card_discounted_price.dart';
import 'package:oven/widgets/custom_widgets/add_to_cart_buttons/square_card_buttons_add_and_increase_decrease.dart';
import 'package:oven/widgets/home_page_widgets/home_page_favorites/star_favorite_item.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';

import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';

class LargeSquareProductCardWithAddButttonsAndQuantityControllersItem
    extends StatelessWidget {
  final Product productItem;
  final bool activefavoriteStyle;
  final TextEditingController controller;
  final bool sepecialStyle;
  const LargeSquareProductCardWithAddButttonsAndQuantityControllersItem({
    super.key,
    required this.productItem,
    required this.controller,
    required this.activefavoriteStyle,
    required this.sepecialStyle,
  });

  @override
  Widget build(BuildContext context) {
    final image = getRandomTestImage();
    final double imageHeight = context.isSmallDevice ? 110 : 120;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: imageHeight,
                minWidth: double.infinity,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: GestureDetector(
                  onTap: () {
                    context.push("/products/${productItem.id}");
                  },
                  child: Image.asset(
                    sepecialStyle ? "lib/assets/Cakes2-1.webp" : image,
                    fit: BoxFit.cover,
                  ),
                ),
                // child: Image.asset("lib/assets/Cakes3-2.webp"),
              ),
            ),
            PositionedDirectional(
              top: 8,
              start: 15,
              child: StarOfFavoriteItem(
                activeFavoriteStyle: activefavoriteStyle,
                id: productItem.id,
              ),
            ),
            Positioned(
              bottom: 6,
              right: 15,
              left: 15,
              child: SquareCardButtonsAddAndIncreaseDecrease(
                controller: controller,
                productItem: productItem,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: SizedBox(
                  height: productItem.title.length < 17 ? 35 : null,

                  child: Text(
                    productItem.title,
                    style: context.isSmallDevice
                        ? Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(fontSize: 12)
                        : Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(fontSize: 12),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                  ),
                ),
              ),

              if (productItem.discount == null)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    LargeSquareNodisscountPrice(
                      price: productItem.price,
                      image: image,
                    ),
                  ],
                ),
              if (productItem.discount != null)
                LargeCardDiscountedPrice(
                  price: productItem.price,
                  discount: productItem.discount!,
                  image: image,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

final List<String> largeCarImages = [
  // "lib/assets/productsImages/CAT Baguette.jpg",
  // "lib/assets/productsImages/CAT Bun.jpeg",
  // "lib/assets/productsImages/CAT Toast.jpg",
  // "lib/assets/productsImages/CAT Vienna Bread.jpg",
  "lib/assets/productsImages/details101.png",
  "lib/assets/productsImages/details102.png",
  "lib/assets/productsImages/details103.png",
  // "lib/assets/productsImages/Mini Quatra.png",
  // "lib/assets/productsImages/Mini Strawberry Cheese Cake.png",
  // "lib/assets/productsImages/Nutella Tartelette.png",
  // "lib/assets/productsImages/pananna.png",
  // "lib/assets/productsImages/Red Velvet Jar.png",
  "lib/assets/whats/aaa.jpeg",
  "lib/assets/whats/aab.jpeg",
  "lib/assets/whats/aac.jpeg",
  "lib/assets/whats/aad.jpeg",
  "lib/assets/whats/aae.jpeg",
  "lib/assets/whats/aaf.jpeg",
  "lib/assets/whats/aag.jpeg",
  "lib/assets/whats/aah.jpeg",
  "lib/assets/whats/aai.jpeg",
  "lib/assets/whats/aaj.jpeg",
  "lib/assets/whats/aak.jpeg",
  "lib/assets/whats/aal.jpeg",
  "lib/assets/whats/aam.jpeg",
  "lib/assets/whats/aan.jpeg",
  "lib/assets/whats/aao.jpeg",
  "lib/assets/whats/aap.jpeg",
  "lib/assets/whats/aaq.jpeg",
  "lib/assets/whats/aar.jpeg",
  "lib/assets/whats/aas.jpeg",
];

String getRandomTestImage() {
  final random = Random();
  return largeCarImages[random.nextInt(largeCarImages.length)];
}
