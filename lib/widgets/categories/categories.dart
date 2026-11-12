import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/pages/products_page.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_category_filter/filtered_maincategory.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_categories_provider.dart';
import 'package:oven/providers/categories_provider/sub_categories_provider.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/constants/percentages_of_screen_heights.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/categories/categories_loading_placeholder.dart';
import 'package:oven/widgets/categories/categories_subcategories_wraper.dart';
import 'package:oven/widgets/categories/categories_verticat_axe_header.dart';
import 'package:oven/widgets/categories/main_category_direct_products_list/category_with_direct_product_child_list.dart';

class Categories extends ConsumerWidget {
  const Categories({super.key});
  List<List<MapEntry<MainCategory, List<SubCategory>>>> _chunkEntries(
    List<MapEntry<MainCategory, List<SubCategory>>> entries,
    int chunkSize,
  ) {
    final chunks = <List<MapEntry<MainCategory, List<SubCategory>>>>[];
    for (var i = 0; i < entries.length; i += chunkSize) {
      chunks.add(
        entries.sublist(
          i,
          i + chunkSize > entries.length ? entries.length : i + chunkSize,
        ),
      );
    }
    return chunks;
  }

  @override
  Widget build(BuildContext context, ref) {
    int maxItemsPerTailColumn = 3;
    final grouppedSubCategories = ref.watch(
      filteredGroupedSubCategoriesProvider,
    );
    return grouppedSubCategories.when(
      data: (groupedCategories) {
        final allEntries = groupedCategories.entries.toList();
        final enrtiesWithSubCategories = allEntries
            .where((entry) => entry.key.products == null)
            .toList();
        final entriesWithDirectProducts = allEntries
            .where(
              (entry) =>
                  entry.key.products != null && entry.key.products!.isNotEmpty,
            )
            .toList();
        final directProductChunks = _chunkEntries(
          entriesWithDirectProducts,
          maxItemsPerTailColumn,
        );
        final itemCount =
            enrtiesWithSubCategories.length + directProductChunks.length;
        return ListView.separated(
          separatorBuilder: (context, index) {
            return Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: context.isSmallDevice ? 2.5 : 2.5,
                ),
              ),
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            if (index >= enrtiesWithSubCategories.length) {
              final chunkIndex = index - enrtiesWithSubCategories.length;
              final chunk = directProductChunks[chunkIndex];
              return CategoryWithDirectProductChildList(
                chunk: chunk,
                chunkIndex: chunkIndex,
                maxItemsPerTailColumn: maxItemsPerTailColumn,
              );
            }
            final entry = enrtiesWithSubCategories[index];
            return Container(
              margin: EdgeInsets.all(
                context.screenHeight *
                    ScreenHeightsByPercentage.productsPageCategoriesSection *
                    .01,
              ),
              width:
                  calculateCategoryColumnWidth(entry.value.length, context) +
                  10,
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
              child: Column(
                children: [
                  SizedBox(
                    height:
                        context.screenHeight *
                        ScreenHeightsByPercentage
                            .productsPageCategoriesSection *
                        .01,
                  ),
                  CategoriesMainCategoryVerticaltAxeHeader(
                    title: entry.key.title,
                  ),
                  SizedBox(
                    height:
                        context.screenHeight *
                        ScreenHeightsByPercentage
                            .productsPageCategoriesSection *
                        .01,
                  ),
                  CategoriesSubcategoriesWraper(entry: entry),
                ],
              ),
            );
          },
        );
      },
      loading: () => CategoriesLoadingPlaceholder(),
      error: (error, _) => Text('Error: $error'),
    );
  }
}

double calculateCategoryColumnWidth(int itemCount, BuildContext context) {
  double singleColumnWidth = 110.w;
  int maxItemsPerColumn = 3;
  final columns = (itemCount / maxItemsPerColumn).ceil();
  return columns * singleColumnWidth;
}
