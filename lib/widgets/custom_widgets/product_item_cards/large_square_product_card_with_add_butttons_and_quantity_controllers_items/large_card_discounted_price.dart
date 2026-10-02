import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class LargeCardDiscountedPrice extends StatelessWidget {
  final double price;
  final double discount;
  final String image;
  const LargeCardDiscountedPrice({
    super.key,
    required this.price,
    required this.discount,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final priceAfterDiscount = price - ((price * discount) / 100);

    return Column(
      children: [
        if (discount > 0)
          Container(
            // color: Colors.green,
            // decoration: BoxDecoration(
            //   borderRadius: !context.isArabic
            //       ? BorderRadius.only(
            //           bottomRight: Radius.circular(8),
            //           topLeft: Radius.circular(8),
            //         )
            //       : BorderRadius.only(
            //           topRight: Radius.circular(8),
            //           bottomLeft: Radius.circular(8),
            //         ),
            // ),
            child: Column(
              children: [
                Row(
                  spacing: 2,
                  children: [
                    Text(
                      priceAfterDiscount.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      context.l10n.le,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 3,
                  children: [
                    Text(
                      price.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                        color: Theme.of(context).colorScheme.error,
                        fontWeight: FontWeight.bold,
                        decorationThickness: 2,
                        decorationColor: Colors.red,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                    Text(
                      context.l10n.le,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}

Future<ui.Image> loadAssetImage(String path) async {
  final data = await rootBundle.load(path);

  final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());

  final frame = await codec.getNextFrame();

  return frame.image;
}
