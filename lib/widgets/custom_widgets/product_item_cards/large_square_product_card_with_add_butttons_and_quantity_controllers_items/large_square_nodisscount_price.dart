import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';

class LargeSquareNodisscountPrice extends StatelessWidget {
  final double price;
  final String image;
  const LargeSquareNodisscountPrice({
    super.key,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -8),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        child: Text(
          locale: Locale("ar"),
          "${price.toString()} ${context.l10n.le}",
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontSize: 12,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
