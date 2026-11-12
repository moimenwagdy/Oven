import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_categories_provider.dart';
import 'package:oven/providers/categories_provider/selected_category_provider.dart';
import 'package:oven/providers/categories_provider/sub_categories_provider.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/constants/percentages_of_screen_heights.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/categories/categories.dart';
import 'package:oven/widgets/categories/categories_subcategories_wraper.dart';
import 'package:oven/widgets/categories/main_category_direct_products_list/direct_child_category_item.dart';

class CategoryWithDirectProductChildList extends ConsumerWidget {
  final List<MapEntry<MainCategory, List<SubCategory>>> chunk;
  final int chunkIndex;
  final int maxItemsPerTailColumn;
  const CategoryWithDirectProductChildList({
    super.key,
    required this.chunk,
    required this.chunkIndex,
    required this.maxItemsPerTailColumn,
  });
  @override
  Widget build(BuildContext context, ref) {
    final selectedCategoryId = ref.watch(selectedCategoryProvider);
    return Container(
      margin: EdgeInsets.all(
        context.screenHeight *
            ScreenHeightsByPercentage.productsPageCategoriesSection *
            .01,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        spacing:
            context.screenHeight *
            ScreenHeightsByPercentage.productsPageCategoriesSection *
            .02,
        children: [
          for (final (i, entry) in chunk.indexed)
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                bottom:
                    context.screenHeight *
                    ScreenHeightsByPercentage.productsPageCategoriesSection *
                    .01,
              ),
              // constraints: BoxConstraints(minWidth: 130.w, maxWidth: 130.w),
              width: calculateCategoryColumnWidth(3, context) + 10,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: onSurface.withValues(alpha: .1),
                    blurRadius: 2,
                    offset: Offset(0, 0),
                    spreadRadius: .5,
                  ),
                ],
              ),
              child: DirectChildCategoryItem(
                title: entry.key.title,
                currentIndex: 0,
                imgUrl: img[0],
                isSelectedCategory: selectedCategoryId == entry.key.id,
                onTap: () => ref
                    .read(selectedCategoryProvider.notifier)
                    .selectCategory(entry.key.id),
              ),
            ),
        ],
      ),
    );
  }
}
