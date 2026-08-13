import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class LargeCardDiscountedPrice extends StatelessWidget {
  final double price;
  final double discount;
  const LargeCardDiscountedPrice({
    super.key,
    required this.price,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    final priceAfterDiscount = price - ((price * discount) / 100);

    return PositionedDirectional(
      top: 0,
      start: 0,
      child: Column(
        children: [
          if (discount > 0)
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .9),
                borderRadius: !context.isArabic
                    ? BorderRadius.only(
                        bottomRight: Radius.circular(8),
                        topLeft: Radius.circular(8),
                      )
                    : BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
              ),
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
              child: Column(
                children: [
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
              ),
            ),
        ],
      ),
    );
  }
}
