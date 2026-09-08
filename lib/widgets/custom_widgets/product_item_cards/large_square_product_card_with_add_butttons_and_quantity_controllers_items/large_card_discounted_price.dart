import 'package:flutter/material.dart';
import 'package:image_palette_extractor/image_palette_extractor.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class LargeCardDiscountedPrice extends StatefulWidget {
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
  State<LargeCardDiscountedPrice> createState() =>
      _LargeCardDiscountedPriceState();
}

class _LargeCardDiscountedPriceState extends State<LargeCardDiscountedPrice> {
  Color? color;

  @override
  void initState() {
    super.initState();
    _extractColor();
  }

  Future<void> _extractColor() async {
    final image = await loadAssetImage(widget.image);

    final extractor = ImagePaletteExtractor();

    final extractedColor = await extractor
        .extractDominantColorFromUiImageRegion(
          image,
          const Rect.fromLTWH(0, 0, 200, 100),
        );

    if (!mounted) return;

    setState(() {
      color = extractedColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    final priceAfterDiscount =
        widget.price - ((widget.price * widget.discount) / 100);
    final textColor = (color ?? Colors.white).computeLuminance() > 0.6
        ? Colors.black
        : Colors.white;

    return PositionedDirectional(
      top: 0,
      start: 0,
      child: Column(
        children: [
          if (widget.discount > 0)
            Container(
              decoration: BoxDecoration(
                // color: Colors.white.withValues(alpha: .9),
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
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  Text(
                    '${widget.price.toStringAsFixed(2)} LE',
                    style: TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                      color: Theme.of(context).colorScheme.error,
                      fontWeight: FontWeight.bold,
                      decorationThickness: 2,
                      decorationColor: textColor,
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

Future<ui.Image> loadAssetImage(String path) async {
  final data = await rootBundle.load(path);

  final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());

  final frame = await codec.getNextFrame();

  return frame.image;
}
