import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/providers/recent_orders_provider/recent_orders_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/custom_dialog_alert.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class OrderItemButton extends StatelessWidget {
  final String id;
  final List<CartItem> cartData;
  final String status;
  const OrderItemButton({
    super.key,
    required this.id,
    required this.cartData,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    String buttonText = "";
    bool extractToCart = true;
    switch (status) {
      case "Delivered":
        buttonText = context.l10n.orderdAgainButton;
        break;
      case "Preparing":
        buttonText = context.l10n.cancelOrder;
        extractToCart = false;
        break;
      case "Cancelled":
        buttonText = context.l10n.orderdAgainButton;
        break;
      case "Scheduled":
        buttonText = context.l10n.cancelOrder;
        extractToCart = false;
        break;
      default:
    }
    return SizedBox(
      width: context.isSmallDevice ? 130 : 150,
      height: context.isSmallDevice ? 25 : 30,
      child: Consumer(
        builder: (context, ref, child) {
          return FormSubmitButtom(
            textChild: Text(
              buttonText,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: context.isSmallDevice ? 12 : 14,
              ),
            ),
            onPressed: () async {
              if (extractToCart) {
                ref.read(cartProvider.notifier).extractToCart(cartData);
                await Future.delayed(const Duration(milliseconds: 200));
                if (context.mounted) {
                  context.go("/cart");
                }
              } else {
                await customDialogAlert(
                  context: context,
                  onCancel: () => context.pop(),
                  onConfirm: () {
                    ref
                        .read(recentOrdersListProvider.notifier)
                        .updateOrderState(id, "Cancelled");
                    context.pop();
                  },
                  message: Text(
                    context.isArabic
                        ? "هل انت متأكد, تريد الغاء الطلب ؟"
                        : "Are You Sure, cancel order ?",
                  ),
                  confirmationMessage: "Yes",
                  cancelationMessage: "No",
                );
              }
            },
          );
        },
      ),
    );
  }
}
