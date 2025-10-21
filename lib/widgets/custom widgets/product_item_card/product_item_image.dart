import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/oven_logo.dart';

class ProductItemImage extends StatelessWidget {
  const ProductItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:context.isSmallDevice ? 70: 80,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: context.isDarkMode
            ? Colors.grey.withValues(alpha: .2)
            : Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: OvenLogo(minW: 40, maxW: 80),
    );
  }
}
