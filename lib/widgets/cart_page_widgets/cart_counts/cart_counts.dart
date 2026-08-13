import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/cart_page_widgets/cart_counts/cart_count_item.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/widgets/cart_page_widgets/cart_counts/confirm_cart_button.dart';

class CartCounts extends ConsumerWidget {
  const CartCounts({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final cartList = ref.watch(cartProvider).value;
    final isLoggedin = ref.watch(fakeAuthProvider).value != null;
    final totalCost = cartList?.fold<double>(
      0,
      (sum, item) => sum + item.quantity * item.price,
    );

    final taxes = (totalCost! * .10);
    final netTotal = (totalCost + taxes + 15);

    return Column(
      children: [
        if (!isLoggedin)
          Column(
            children: [
              Text.rich(
                TextSpan(
                  text: "Please ",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.go("/login/:type");
                        },
                    ),
                    const TextSpan(text: ' to confirm order!'),
                  ],
                ),
              ),
              SizedBox(height: 15),
            ],
          ),

        Container(
          height: context.isSmallDevice ? 170 : 190,
          width: double.infinity,
          color: Theme.of(context).colorScheme.primary.withValues(alpha: .1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SingleChildScrollView(
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
                  ConfirmCartButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
