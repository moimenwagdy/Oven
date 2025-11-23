import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/sugestions_items_widget/suggestions_widget_items.dart';

class TitledItemsWithHeader extends StatelessWidget {
  final String itemsTitle;
  const TitledItemsWithHeader({super.key, required this.itemsTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        spacing: 8,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(6),
              border: BoxBorder.all(color: primary),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: context.screenWidth * .4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  itemsTitle,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 150, child: SuggestionsWidgetItems()),
        ],
      ),
    );
  }
}
