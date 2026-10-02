import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class CategoriesMainCategoryVerticaltAxeHeader extends StatelessWidget {
  final String title;
  const CategoriesMainCategoryVerticaltAxeHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.5),
      width: context.isSmallDevice ? 103 : 113,
      height: 20,
      child: Center(
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
