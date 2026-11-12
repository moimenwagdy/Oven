import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/widgets/custom_widgets/add_to_cart_buttons/quantity_field_and_increase_decrease_circle_buttons.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';

class SquareCardButtonsAddAndIncreaseDecrease extends ConsumerWidget {
  final TextEditingController controller;
  final Product productItem;
  const SquareCardButtonsAddAndIncreaseDecrease({
    super.key,
    required this.controller,
    required this.productItem,
  });
  @override
  Widget build(BuildContext context, ref) {
    final productHasOptions = productItem.options != null;
    final quantity = ref.watch(
      cartProvider.select((asyncCart) {
        final cart = asyncCart.value;
        if (cart == null) return 0;
        final item = cart.firstWhere(
          (ele) => ele.id == productItem.id,
          orElse: () => CartItem(
            id: productItem.id,
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
        if (productHasOptions) {
          context.push("/products/options/${productItem.id}");
          return;
        }
        controller.text = '1';
        ref
            .read(cartProvider.notifier)
            .addItem(
              CartItem(
                id: productItem.id,
                title: productItem.title,
                price: productItem.price,
                quantity: int.parse(controller.text),
                allowAttachImage: productItem.enabledImageAttachment,
              ),
            );

        Fluttertoast.showToast(
          msg: context.isArabic
              ? 'تم أضافة ${productItem.title} الى العربة'
              : '${productItem.title} is added to your cart',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.black.withValues(alpha: .4),
          textColor: Colors.white,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.onPrimary.withValues(alpha: .85),
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.all(4),
            child: Icon(
              productHasOptions ? Icons.arrow_right_rounded : Icons.add,
              color: Theme.of(context).colorScheme.primary,
              size: 25,
            ),
          ),
        ],
      ),
    );
    final quantityBar = SizedBox(
      height: 35,
      width: 125,
      child: QuantityFieldAndIncreaseDecreaseCircleButtons(
        controller: controller,
        allowAttachImage: productItem.enabledImageAttachment,
        id: productItem.id,
        price: productItem.price,
        title: productItem.title,
      ),
    );

    return isActive ? quantityBar : addToCartButton;
  }
}
