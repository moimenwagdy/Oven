import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/cart_page_widgets/cart_options_items.dart';
import 'package:oven/widgets/custom_widgets/custom_dialog_alert.dart';
import 'package:oven/widgets/custom_widgets/spinner.dart';

class CartOptionsSection extends ConsumerWidget {
  const CartOptionsSection({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final cartList = ref.watch(cartProvider);
    return cartList.when(
      data: (data) {
        if (data.isEmpty) {
          return SizedBox.shrink();
        } else {
          return Column(
            children: [
              const SizedBox(height: 10),
              TextButton(
                onPressed: () async {
                  await customDialogAlert(
                    context: context,
                    onCancel: () => context.pop(),
                    onConfirm: () {
                      ref.read(cartProvider.notifier).clearCart();
                      context.pop();
                    },
                    message: Text(
                      context.isArabic
                          ? "هل انت متأكد, تريد إخلاء العربة ؟"
                          : "Are You Sure, Clear Cart ?",
                    ),
                    confirmationMessage: "Yes",
                    cancelationMessage: "No",
                  );
                },
                child: Text("Clear"),
              ),
              CartOptionsItems(),
            ],
          );
        }
      },
      error: (e, _) => Text("erro"),
      loading: () => SmallSpinner(),
    );
  }
}
