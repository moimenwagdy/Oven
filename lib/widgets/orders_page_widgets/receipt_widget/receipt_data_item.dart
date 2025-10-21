import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class ReceiptDataItem extends StatelessWidget {
  final int quantity;
  final String description;
  final double price;

  const ReceiptDataItem({
    super.key,
    required this.quantity,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final stringifiedQuantity = quantity.toString();
    final stringifiedPrice = price.toString();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: (context.screenWidth - 26) * .10,
            child: Text(
              textAlign: TextAlign.center,
              stringifiedQuantity,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(width: (context.screenWidth - 26) * .008),
          SizedBox(
            width: (context.screenWidth - 26) * .45,
            child: Text(
              description,
              softWrap: true,
              overflow: TextOverflow.visible,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 12,
              ),
            ),
          ),
          Container(
            width: (context.screenWidth - 26) * .22,
            padding: EdgeInsets.fromLTRB(8,0,0,0),
            child: Text(
              "$stringifiedPrice EGP",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(
            width: (context.screenWidth - 26) * .22,
            child: Text(
              '${price * quantity} EGP',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
