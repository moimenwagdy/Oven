import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/widgets/custom_widgets/add_to_cart_buttons/quantity_field_and_increase_decrease_circle_buttons.dart';

class SquareCardButtonsAddAndIncreaseDecrease extends ConsumerWidget {
  final TextEditingController controller;
  final String id;
  final String title;
  final double price;
  final bool allowAttachImage;
  const SquareCardButtonsAddAndIncreaseDecrease({
    super.key,
    required this.controller,
    required this.id,
    required this.price,
    required this.title,
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
    final addToCartButton = GestureDetector(
      onTap: () {
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
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: .85),
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.all(4),
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.primary,
          size: 30,
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
