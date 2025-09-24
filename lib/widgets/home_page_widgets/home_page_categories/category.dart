import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key});
  @override
  State<CategoryItem> createState() => _CategoryItemState();
}
class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: .1),
            ),
            child: Center(
              child: Stack(
                alignment: AlignmentGeometry.center,
                children: [
                  Image.asset(
                    "lib/assets/logo_larg.png",
                    alignment: Alignment.topCenter,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Category",
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize:context.isSmallDevice? 13 : 14,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: .5),
            // borderRadius: BorderRadius.circular(12),
          ),
          width: double.infinity,
          // height: 22,
          child: Text(
            "Text",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
      ],
    );
  }
}
