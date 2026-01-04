import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/add_to_cart_buttons/global_quantity_buttons_add_and_increase_decrease.dart';
import 'package:oven/widgets/home_page_widgets/home_page_favorites/star_favorite_item.dart';

class LargeSquareProductCardWithAddButttonsAndQuantityControllersItem
    extends StatelessWidget {
  final String title;
  final double price;
  final String id;
  final bool activefavoriteStyle;
  final TextEditingController controller;
  final bool sepecialStyle;
  const LargeSquareProductCardWithAddButttonsAndQuantityControllersItem({
    super.key,
    required this.title,
    required this.price,
    required this.id,
    required this.controller,
    required this.activefavoriteStyle,
    required this.sepecialStyle,
  });

  @override
  Widget build(BuildContext context) {
    final image = getRandomTestImage();
    final shouldCenterImage =
        image.contains("lib/assets/productsImages/Mini Quatra.png") ||
        image.contains(
          "lib/assets/productsImages/Mini Strawberry Cheese Cake.png",
        ) ||
        image.contains("lib/assets/productsImages/Nutella Tartelette.png") ||
        image.contains("lib/assets/productsImages/pananna.png") ||
        image.contains("lib/assets/productsImages/Red Velvet Jar.png");
    final double imageHeight = shouldCenterImage
        ? 110
        : context.isSmallDevice
        ? 110
        : 120;
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.onPrimary,
        boxShadow: [
          BoxShadow(
            color: context.isDarkMode
                ? Colors.white.withValues(alpha: .5)
                : Colors.black.withValues(alpha: .3),
            offset: Offset(0, context.isDarkMode ? 0 : 1),
            blurRadius: context.isDarkMode ? 2 : 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              SizedBox(
                height: imageHeight,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.push("/products/$id");
                    },
                    child: Image.asset(
                      sepecialStyle ? "lib/assets/Cakes2-1.webp" : image,
                      fit: shouldCenterImage ? BoxFit.contain : BoxFit.cover,
                    ),
                  ),
                  // child: Image.asset("lib/assets/Cakes3-2.webp"),
                ),
              ),
              PositionedDirectional(
                top: 2,
                end: 5,
                child: StarOfFavoriteItem(
                  activeFavoriteStyle: activefavoriteStyle,
                  id: id,
                ),
              ),
              PositionedDirectional(
                top: 0,
                start: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .9),
                    borderRadius: !context.isArabic
                        ? BorderRadius.only(
                            bottomRight: Radius.circular(6),
                            topLeft: Radius.circular(6),
                          )
                        : BorderRadius.only(
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(6),
                          ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  child: Text(
                    locale: Locale("ar"),
                    "${price.toString()} ${context.l10n.le}",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 11,
                      color: primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(2, 2, 2, 0),
              child: Row(
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () => context.push("/products/$id"),
                      child: AutoSizeText(
                        maxLines: 2,
                        title,
                        minFontSize: 9,
                        maxFontSize: 11,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GlobalQuantityButtonsAddAndIncreaseDecrease(
            key: ValueKey("largeCard_quantity_controller"),
            id: id,
            controller: controller,
            isSquareLayout: true,
            price: price,
            title: title,
          ),
        ],
      ),
    );
  }
}

final List<String> largeCarImages = [
  "lib/assets/productsImages/CAT Baguette.jpg",
  "lib/assets/productsImages/CAT Bun.jpeg",
  "lib/assets/productsImages/CAT Toast.jpg",
  "lib/assets/productsImages/CAT Vienna Bread.jpg",
  "lib/assets/productsImages/details101.png",
  "lib/assets/productsImages/details102.png",
  "lib/assets/productsImages/details103.png",

  "lib/assets/productsImages/Mini Quatra.png",
  "lib/assets/productsImages/Mini Strawberry Cheese Cake.png",
  "lib/assets/productsImages/Nutella Tartelette.png",
  "lib/assets/productsImages/pananna.png",
  "lib/assets/productsImages/Red Velvet Jar.png",
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
