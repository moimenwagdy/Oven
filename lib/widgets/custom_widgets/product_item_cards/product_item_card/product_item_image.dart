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
    // Render-time pixel size for the decode cache. Multiplying by
    // devicePixelRatio keeps it sharp on high-DPI screens without decoding
    // anywhere near the source resolution (some source images are 6000px+).
    final dpr = MediaQuery.devicePixelRatioOf(context);
    final boxWidth = context.isSmallDevice ? 65 : 90;
    final boxHeight = context.isSmallDevice ? 60 : 75;
    final cacheW = (boxWidth * dpr).round();
    final cacheH = (boxHeight * dpr).round();

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

    return RepaintBoundary(
      child: GestureDetector(
        onTap: () {
          context.push("/products/$productId");
        },
        child: isFullScreenImage
            ? Container(
                width: boxWidth.toDouble(),
                height: boxHeight.toDouble(),
                padding: EdgeInsets.all(2),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  cacheWidth: cacheW,
                  cacheHeight: cacheH,
                ),
              )
            : Container(
                width: boxWidth.toDouble(),
                height: boxHeight.toDouble(),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? Colors.grey.withValues(alpha: .1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  // Static shadow instead of a live ImageFiltered blur of a
                  // second copy of the same image — same visual weight,
                  // no extra decode and no per-frame GPU blur pass.
                  boxShadow: [
                    BoxShadow(
                      color: context.isDarkMode
                          ? Colors.black.withValues(alpha: .3)
                          : Colors.black.withValues(alpha: 0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                  cacheWidth: cacheW,
                  cacheHeight: cacheH,
                ),
              ),
      ),
    );
  }
}
