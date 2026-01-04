import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class ProductDetailsHeaderData extends StatelessWidget {
  final String productTitle;
  final String productDescription;
  final double price;

  const ProductDetailsHeaderData({
    super.key,
    required this.productTitle,
    required this.productDescription,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          productTitle,
          style: context.isSmallDevice
              ? Theme.of(context).textTheme.displayMedium
              : Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          price.toString(),
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: primary),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            productDescription,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: .5),
            ),
          ),
        ),
      ],
    );
  }
}
