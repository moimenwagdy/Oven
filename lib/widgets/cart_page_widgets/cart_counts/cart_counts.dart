import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/cart_page_widgets/cart_counts/cart_count_item.dart';
import 'package:oven/widgets/landing_page_widgets/landing_navigation_button.dart';

class CartCounts extends StatelessWidget {
  const CartCounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.isSmallDevice ? 170 : 190,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: .4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            spacing: 5,
            children: [
              CartCountItem(
                countKey: context.l10n.subTotal,
                countValue: "9600000",
              ),
              CartCountItem(countKey: context.l10n.taxes, countValue: "96"),
              CartCountItem(countKey: context.l10n.delivery, countValue: "15"),
              CartCountItem(countKey: context.l10n.total, countValue: "1071"),
              Container(
                width: context.screenWidth * .65,
                height: context.isSmallDevice ? 40 : 50,
                margin: EdgeInsets.only(top: 5),
                child: LandingNavigathionButton(
                  child: context.l10n.placeOrder,
                  destination: "",
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: .7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
