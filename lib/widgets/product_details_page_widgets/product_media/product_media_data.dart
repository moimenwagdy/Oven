import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/product_details_page_widgets/product_media/product_details_media_slider.dart';

class ProductMediaData extends StatelessWidget {
  const ProductMediaData({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: context.isSmallDevice ? 280 : 320,
        maxHeight: context.isSmallDevice ? 300 : 350,
      ),
      child: ProductDetailsMediaSlider(
        imageUrls: [
          "https://via.assets.so/img.jpg?w=300&h=200&bg=e5e7eb&f=png",
          "https://via.assets.so/img.jpg?w=400&h=600&bg=e5e7eb&f=png",
          "https://via.assets.so/img.jpg?w=400&h=400&bg=e5e7eb&f=png",
        ],
        videoUrl: "lib/assets/ln.mp4",
      ),
    );
  }
}
