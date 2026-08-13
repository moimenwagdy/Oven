import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/widgets/custom_widgets/add_to_cart_buttons/quantity_field_and_increase_decrease_circle_buttons.dart';
import 'package:oven/widgets/product_details_page_widgets/product_details_add_to_cart_button/product_details_add_to_cart_button.dart';
import 'package:oven/widgets/product_details_page_widgets/product_details_header/product_details_header.dart';
import 'package:oven/widgets/product_details_page_widgets/product_media/product_media_data.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';

class ProductDetails extends ConsumerWidget {
  final String productId;
  final TextEditingController controller;
  const ProductDetails({
    super.key,
    required this.productId,
    required this.controller,
  });

  @override
  Widget build(BuildContext context, ref) {
    final usedArr = englishProducts;
    // final usedArr = context.isArabic ? arabicProducts : englishProducts;
    final product = usedArr.firstWhere((item) => item.id == productId);
    final cartList = ref.watch(cartProvider).value;

    final item = cartList?.firstWhere(
      (ele) => ele.id == productId,
      orElse: () => CartItem(
        id: productId,
        title: "",
        price: 0,
        quantity: 0,
        allowAttachImage: false,
      ),
    );
    controller.text = item != null ? item.quantity.toString() : controller.text;
    return Scaffold(
      backgroundColor: Colors.white.withValues(alpha: .1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            ProductMediaData(),
            ProductDetailsHeaderData(
              productTitle: product.title,
              productDescription: product.description,
              price: product.price,
            ),
            SizedBox(height: 20),
            QuantityFieldAndIncreaseDecreaseCircleButtons(
              controller: controller,
              id: productId,
              price: product.price,
              title: product.title,
              allowAttachImage: product.enabledImageAttachment,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: ProductDetailsAddToCartButton(
        id: productId,
        price: product.price,
        title: product.title,
        controller: controller,
        allowAttachImage: product.enabledImageAttachment,
      ),
    );
  }
}
