import 'package:flutter/material.dart';
import 'package:image_palette_extractor/image_palette_extractor.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/product_item_cards/large_square_product_card_with_add_butttons_and_quantity_controllers_items/large_card_discounted_price.dart';

class LargeSquareNodisscountPrice extends StatefulWidget {
  final double price;
  final String image;
  const LargeSquareNodisscountPrice({
    super.key,
    required this.image,
    required this.price,
  });

  @override
  State<LargeSquareNodisscountPrice> createState() =>
      _LargeSquareNodisscountPriceState();
}

class _LargeSquareNodisscountPriceState
    extends State<LargeSquareNodisscountPrice> {
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
          const Rect.fromLTWH(0, 0, 100, 30),
        );

    if (!mounted) return;

    setState(() {
      color = extractedColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textColor = (color ?? Colors.white).computeLuminance() > 0.6
        ? Colors.black
        : Colors.white;
    return PositionedDirectional(
      top: 4,
      start: 2,
      child: Container(
        // decoration: BoxDecoration(
        //   // color: Colors.white.withValues(alpha: .1),
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
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
        child: Text(
          locale: Locale("ar"),
          "${widget.price.toString()} ${context.l10n.le}",
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(fontSize: 12, color: textColor),
        ),
      ),
    );
  }
}
