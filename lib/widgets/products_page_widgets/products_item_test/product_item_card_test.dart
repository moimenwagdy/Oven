import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/product_item_cards/large_square_product_card_with_add_butttons_and_quantity_controllers_items/large_square_product_card_with_add_butttons_and_quantity_controllers_item.dart';
import 'package:oven/widgets/products_page_widgets/products_item_test/product_image_test.dart';

class ProductItemCardTest extends StatelessWidget {
  final TextEditingController quantityController;
  final String title;
  final String description;
  final bool showFavoriteButton;
  final String id;
  final double price;
  final List<String> images;
  const ProductItemCardTest({
    super.key,
    required this.quantityController,
    required this.title,
    required this.description,
    required this.showFavoriteButton,
    required this.id,
    required this.price,
    required this.images,
  });
  @override
  Widget build(BuildContext context) {
    final image = images.isEmpty ? getRandomTestImage() : images[0];

    return Material(
      color: Colors.white,
      elevation: .1,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: context.screenWidth,
        height: 150.h,
        color: Colors.transparent,
        child: Row(
          children: [ProductImageTest(productId: id, image: image)],
        ),
      ),
    );
  }
}
