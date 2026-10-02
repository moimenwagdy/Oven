import 'package:oven/widgets/cart_page_widgets/cart_counts/cart_logged_user_address_partition.dart';
import 'package:oven/widgets/cart_page_widgets/cart_counts/cart_not_loggedin_message.dart';
import 'package:oven/widgets/cart_page_widgets/cart_counts/confirm_cart_button.dart';
import 'package:oven/widgets/cart_page_widgets/cart_counts/cart_count_item.dart';
import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CartCounts extends ConsumerWidget {
  const CartCounts({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final cartList = ref.watch(cartProvider).value;
    final loggedUser = ref.watch(fakeAuthProvider).value;
    final isLoggedin = loggedUser != null;
    final totalCost = cartList?.fold<double>(
      0,
      (sum, item) => sum + item.quantity * item.price,
    );
    final taxes = (totalCost! * .10);
    final netTotal = (totalCost + taxes + 15);
    return Column(
      children: [
        if (!isLoggedin) CartNotLoggedinMessage(),
        if (isLoggedin) CartLoggedUserAddressPartition(loggedUser: loggedUser),
        SizedBox(height: 5),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              spacing: 5,
              children: [
                CartCountItem(
                  countKey: context.l10n.subTotal,
                  countValue: totalCost.toStringAsFixed(2),
                ),
                CartCountItem(
                  countKey: context.l10n.taxes,
                  countValue: taxes.toStringAsFixed(2),
                ),
                CartCountItem(
                  countKey: context.l10n.delivery,
                  countValue: "15",
                ),
                CartCountItem(
                  countKey: context.l10n.total,
                  countValue: netTotal.toStringAsFixed(2),
                ),
                SizedBox(height: 20),
                ConfirmCartButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
