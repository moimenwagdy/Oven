import 'dart:math';

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
  final List<String> images;
  final double? discount;
  final bool allowAttachImage;

  const ProductItemCard({
    super.key,
    required this.quantityController,
    required this.title,
    required this.description,
    required this.showFavoriteButton,
    required this.id,
    required this.price,
    required this.images,
    required this.allowAttachImage,
    this.discount,
  });

  @override
  Widget build(BuildContext context) {
    final image = images.isEmpty ? getRandomTestImage() : images[0];
    return SizedBox(
      height: context.isSmallDevice ? 120 : 125,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Theme.of(
          context,
        ).colorScheme.onSecondaryFixed.withValues(alpha: .5),
        elevation: 0,
        margin: EdgeInsets.only(bottom: 5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            spacing: 10,
            children: [
              ProductItemImage(productId: id, image: image),
              ProductItemDataAndButton(
                quantityController: quantityController,
                title: title,
                description: description,
                showFavoriteButton: showFavoriteButton,
                id: id,
                price: price,
                discount: discount,
                allowAttachImage: allowAttachImage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// class ProductItemCard extends StatelessWidget {
//   final TextEditingController quantityController;
//   final String title;
//   final String description;
//   final bool showFavoriteButton;
//   final String id;
//   final double price;
//   final List<String> images;

//   const ProductItemCard({
//     super.key,
//     required this.quantityController,
//     required this.title,
//     required this.description,
//     required this.showFavoriteButton,
//     required this.id,
//     required this.price,
//     required this.images,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final image = images.isEmpty ? getRandomTestImage() : images[0];
//     return SizedBox(
//       height: context.isSmallDevice ? 90 : 100,
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         color: Theme.of(
//           context,
//         ).colorScheme.onSecondaryFixed.withValues(alpha: .5),
//         elevation: 0,
//         margin: EdgeInsets.only(bottom: 5),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 5),
//           child: Row(
//             spacing: 10,
//             children: [
//               ProductItemImage(productId: id, image: image),
//               ProductItemDataAndButton(
//                 quantityController: quantityController,
//                 title: title,
//                 description: description,
//                 showFavoriteButton: showFavoriteButton,
//                 id: id,
//                 price: price,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

String getRandomTestImage() {
  final random = Random();
  return testProductImages[random.nextInt(testProductImages.length)];
}

const List<String> testProductImages = [
  "lib/assets/productsImages/Bluberry Cheese Cake Jar.png",
  "lib/assets/productsImages/Caramel Tartelette.png",
  "lib/assets/productsImages/Chocolate Hazelnut Cake.png",
  "lib/assets/productsImages/Dark Fudge Cake.png",
  "lib/assets/productsImages/Hazelnut Ganache Tartelette.png",
  "lib/assets/productsImages/Hazelnut Oven Molten Cake.png",
  "lib/assets/productsImages/Honey Cake.png",
  "lib/assets/productsImages/Kinder Tartelette.png",
  "lib/assets/productsImages/Lotus Jar.png",
  "lib/assets/productsImages/Maltesers Cake.png",
  "lib/assets/productsImages/Marble English Cake.png",
  "lib/assets/productsImages/Mars Tartelette.png",
  "lib/assets/productsImages/Mini Bluberry Cheese Cake.png",
  "lib/assets/productsImages/Mini Caramel Cheese Cake.png",
  "lib/assets/productsImages/Mini Caramel Fudge.png",
  "lib/assets/productsImages/Mini Chocolate Lovers.png",
  "lib/assets/productsImages/Mini Coffee Mousse.png",
  "lib/assets/productsImages/Mini Flutes.png",
  "lib/assets/productsImages/Mini KitKat.png",
  "lib/assets/productsImages/Mini Lotus Molten Cake.png",
  "lib/assets/productsImages/Mini Nutella Cheese Cake.png",
  "lib/assets/productsImages/Mini Quatra.png",
  "lib/assets/productsImages/Mini Strawberry Cheese Cake.png",
  "lib/assets/productsImages/Nutella Tartelette.png",
  "lib/assets/productsImages/pananna.png",
  "lib/assets/productsImages/Red Velvet Jar.png",
  "lib/assets/productsImages/Snickers Tartelette.png",
  "lib/assets/productsImages/Vienna 22 Sesame.png",
  "lib/assets/productsImages/details101.png",
  "lib/assets/productsImages/details102.png",
  "lib/assets/productsImages/details103.png",
  "lib/assets/productsImages/CAT Bun.jpeg",
  "lib/assets/productsImages/CAT Toast.jpg",
  "lib/assets/productsImages/CAT Vienna Bread.jpg",
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
