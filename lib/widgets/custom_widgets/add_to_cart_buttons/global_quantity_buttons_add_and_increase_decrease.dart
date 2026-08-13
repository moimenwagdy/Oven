import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/widgets/custom_widgets/add_to_cart_buttons/add_to_cart_button.dart';
import 'package:oven/widgets/custom_widgets/add_to_cart_buttons/quantity_field_and_increase_decrease_circle_buttons.dart';

class GlobalQuantityButtonsAddAndIncreaseDecrease extends ConsumerWidget {
  final TextEditingController controller;
  final String id;
  final bool isSquareLayout;
  final String title;
  final double price;
  final bool allowAttachImage;
  const GlobalQuantityButtonsAddAndIncreaseDecrease({
    super.key,
    required this.controller,
    required this.id,
    required this.price,
    required this.title,
    required this.isSquareLayout,
    required this.allowAttachImage,
  });
  @override
  Widget build(BuildContext context, ref) {
    final quantity = ref.watch(
      cartProvider.select((asyncCart) {
        final cart = asyncCart.value;
        if (cart == null) return 0;
        final item = cart.firstWhere(
          (ele) => ele.id == id,
          orElse: () => CartItem(
            id: id,
            title: "",
            price: 0,
            quantity: 0,
            allowAttachImage: false,
          ),
        );
        return item.quantity;
      }),
    );
    final newValue = quantity.toString();

    if (controller.text != newValue) {
      controller.text = newValue;
    }
    final isActive = controller.text != '0';
    final addToCartButton = SizedBox(
      height: 40,
      width: context.isSmallDevice ? 125 : 135,
      child: Center(
        child: SizedBox(
          height: 30,
          width: context.isSmallDevice ? 110 : 120,
          child: AddToCartButton(
            specialStyle: isSquareLayout,
            textChild: Text(
              context.l10n.addToCart,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: 11,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              controller.text = '1';
              ref
                  .read(cartProvider.notifier)
                  .addItem(
                    CartItem(
                      id: id,
                      title: title,
                      price: price,
                      quantity: int.parse(controller.text),
                      allowAttachImage: allowAttachImage,
                    ),
                  );

              Fluttertoast.showToast(
                msg: context.isArabic
                    ? 'تم أضافة $title الى العربة'
                    : '$title is added to your cart',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.black.withValues(alpha: .4),
                textColor: Colors.white,
              );
            },
          ),
        ),
      ),
    );
    final quantityBar = SizedBox(
      height: 40,
      width: 130,
      child: Center(
        child: QuantityFieldAndIncreaseDecreaseCircleButtons(
          controller: controller,
          id: id,
          price: price,
          title: title,
          allowAttachImage: allowAttachImage,
        ),
      ),
    );

    return isActive ? quantityBar : addToCartButton;
  }
}
