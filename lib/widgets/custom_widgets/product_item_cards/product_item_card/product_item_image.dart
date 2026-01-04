import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class ProductItemImage extends StatelessWidget {
  final String productId;
  final String image;
  const ProductItemImage({
    super.key,
    required this.productId,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final isFullScreenImage = [
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
      "lib/assets/productsImages/CAT Bun.jpeg",
      "lib/assets/productsImages/CAT Toast.jpg",
      "lib/assets/productsImages/CAT Vienna Bread.jpg",
    ].contains(image);

    return GestureDetector(
      onTap: () {
        context.push("/products/$productId");
      },
      child: isFullScreenImage
          ? Container(
              width: context.isSmallDevice ? 70 : 90,
              height: context.isSmallDevice ? 65 : 75,
              padding: EdgeInsets.all(2),

              child: Image.asset(image, fit: BoxFit.cover),
            )
          : Container(
              width: context.isSmallDevice ? 70 : 90,
              height: context.isSmallDevice ? 65 : 75,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: context.isDarkMode
                    ? Colors.grey.withValues(alpha: .1)
                    : Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.translate(
                    offset: const Offset(0, 6),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Image.asset(
                        image,
                        fit: BoxFit.contain,
                        color: context.isDarkMode
                            ? Colors.black.withValues(alpha: .3)
                            : Colors.black.withValues(alpha: 0.25),
                        colorBlendMode: BlendMode.srcIn,
                      ),
                    ),
                  ),
                  Image.asset(image, fit: BoxFit.contain),
                ],
              ),
            ),
    );
  }
}
