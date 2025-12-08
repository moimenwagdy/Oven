import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class OrderItemDataAndButton extends StatelessWidget {
  final List<String> contentItemsList;
  final double totalCost;
  final String type;
  final List<CartItem> cartData;

  const OrderItemDataAndButton({
    super.key,
    required this.contentItemsList,
    required this.totalCost,
    required this.type,
    required this.cartData,
  });

  @override
  Widget build(BuildContext context) {
    final formatted = DateFormat("dd MMM, hh:mm a").format(DateTime.now());

    String toto = "";

    switch (type) {
      case "Delivered":
        toto = "Reorder";
      case "Preparing":
        toto = "Cancel";
      case "Cancelled":
        toto = "Reorder";

        break;
      default:
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(formatted, style: Theme.of(context).textTheme.labelLarge),
        Container(
          width: 150,
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface.withValues(
              alpha: context.isDarkMode ? .15 : .1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: [
              Text(
                " ${context.l10n.itemsCount} ${contentItemsList.length}",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              Text(
                "${totalCost.toStringAsFixed(2)} ${context.l10n.itemPriceType}",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: context.isSmallDevice ? 130 : 150,
          height: context.isSmallDevice ? 25 : 30,
          child: Consumer(
            builder: (context, ref, child) {
              return FormSubmitButtom(
                textChild: Text(
                  toto,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: context.isSmallDevice ? 14 : 16,
                  ),
                ),
                onPressed: () async => {
                  ref.watch(cartProvider.notifier).extractToCart(cartData),
                  await Future.delayed(const Duration(milliseconds: 200)),
                  if (context.mounted) {context.go("/cart")},
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
