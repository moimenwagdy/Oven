import 'package:flutter/material.dart';

class DiscountedPrice extends StatelessWidget {
  final double discount;
  final double price;
  const DiscountedPrice({
    super.key,
    required this.discount,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final priceAfterDiscount = price - ((price * discount) / 100);

    return Column(
      children: [
        if (discount > 0)
          Text(
            '${priceAfterDiscount.toStringAsFixed(2)} LE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        Text(
          '${price.toStringAsFixed(2)} LE',
          style: TextStyle(
            fontSize: 13,
            decoration: TextDecoration.lineThrough,
            color: Theme.of(context).colorScheme.error,
            fontWeight: FontWeight.bold,
            decorationThickness: 2,
            decorationColor: Theme.of(context).colorScheme.onSurface,
            decorationStyle: TextDecorationStyle.solid,
          ),
        ),
      ],
    );
  }
}
