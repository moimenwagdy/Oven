import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/add_to_cart_buttons/global_quantity_increase_decrease.dart';

class CartItem extends StatelessWidget {
  final TextEditingController controller;
  const CartItem({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Theme.of(
        context,
      ).colorScheme.secondary.withValues(alpha: context.isDarkMode ? .15 : .1),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: context.isSmallDevice ? 120 : 130,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                context.l10n.cartITemTitle,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5,
            children: [
              Text(
                "5680",
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text("EGP", style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
          GlobalQuantityIncreaseDecrease(controller: controller),
          SizedBox(
            height: 20,
            width: 20,
            child: IconButton(
              padding: EdgeInsets.all(0),
              iconSize: 12,
              onPressed: () => {},
              icon: Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
