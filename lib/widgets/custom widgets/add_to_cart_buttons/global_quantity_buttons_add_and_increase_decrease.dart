import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items/cart_notifier.dart';
import 'package:oven/widgets/custom widgets/add_to_cart_buttons/add_to_cart_button.dart';
import 'package:oven/widgets/custom widgets/add_to_cart_buttons/quantity_field_and_increase_decrease_circle_buttons.dart';

class GlobalQuantityButtonsAddAndIncreaseDecrease extends ConsumerWidget {
  final TextEditingController controller;
  final String id;
  final bool isSquareLayout;
  final String title;
  final double price;

  const GlobalQuantityButtonsAddAndIncreaseDecrease({
    super.key,
    required this.controller,
    required this.id,
    required this.price,
    required this.title,
    this.isSquareLayout = false,
  });
  @override
  Widget build(BuildContext context, ref) {
    final cartList = ref.watch(cartProvider).value;
    final item = cartList?.firstWhere(
      (ele) => ele.id == id,
      orElse: () => CartItem(id: id, title: "", price: 0, quantity: 0),
    );
    final newValue = item != null ? item.quantity.toString() : "0";

    if (controller.text != newValue) {
      controller.text = newValue;
    }
    final isActive = controller.text != '0';
    final addToCartButton = AddToCartButton(
      specialStyle: isSquareLayout,
      textChild: Text(
        context.l10n.addToCart,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontSize: context.isArabic ? 8 : 10,
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
    );
    final quantityBar = SizedBox(
      height: 30,
      child: QuantityFieldAndIncreaseDecreaseCircleButtons(
        controller: controller,
        id: id,
      ),
    );

    return isActive ? quantityBar : addToCartButton;
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:oven/utils/helpers/localization_extension.dart';
// import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
// import 'package:oven/widgets/cart_page_widgets/cart_items/cart_notifier.dart';
// import 'package:oven/widgets/custom%20widgets/add_to_cart_buttons/add_to_cart_button.dart';
// import 'package:oven/widgets/custom%20widgets/add_to_cart_buttons/quantity_field_and_increase_decrease_circle_buttons.dart';
// part 'global_quantity_buttons_add_and_increase_decrease.g.dart';

// @riverpod
// class ActiveQuantityBar extends _$ActiveQuantityBar {
//   @override
//   bool build(String id) => false;
//   void activate() => state = true;
//   void deactivate() => state = false;
// }

// class GlobalQuantityButtonsAddAndIncreaseDecrease extends ConsumerWidget {
//   final TextEditingController controller;
//   final bool? isDetails;
//   final String id;

//   const GlobalQuantityButtonsAddAndIncreaseDecrease({
//     super.key,
//     required this.controller,
//     this.isDetails,
//     required this.id,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isActive = ref.watch(activeQuantityBarProvider(id));
//     return Padding(
//       padding: EdgeInsets.only(right: context.isSmallDevice ? 0 : 0),
//       child: isActive
//           ? SizedBox(
//               height: 30,
//               child: QuantityFieldAndIncreaseDecreaseCircleButtons(
//                 controller: controller,
//                 id: id,
//               ),
//             )
//           : AddToCartButton(
//               specialStyle: false,
//               textChild: Text(
//                 context.l10n.addToCart,
//                 style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                   fontSize: context.isArabic ? 8 : 10,
//                   color: Theme.of(context).colorScheme.onPrimary,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               onPressed: () {
//                 ref.read(activeQuantityBarProvider(id).notifier).activate();
//                 controller.text = '1';
//                 ref
//                     .read(cartProvider.notifier)
//                     .addItem(
//                       CartItem(
//                         id: id,
//                         title: id,
//                         price: 25,
//                         quantity: int.parse(controller.text),
//                       ),
//                     );
//               },
//             ),
//     );
//   }
// }


     // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     backgroundColor: context.isDarkMode ? Colors.black : Colors.white,
        //     duration: const Duration(milliseconds: 1200),
        //     content: Text(
        //       context.isArabic
        //           ? 'تم أضافة $title الى العربة'
        //           : '$title is added to your cart',
        //       style: Theme.of(context).textTheme.labelSmall?.copyWith(
        //         color: primary,
        //         fontWeight: FontWeight.bold,
        //       ),
        //       textAlign: TextAlign.center,
        //     ),
        //   ),
        // );