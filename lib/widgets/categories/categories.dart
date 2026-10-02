import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/categories_provider/filtered_maincategory.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_categories_provider.dart';
import 'package:oven/providers/categories_provider/sub_categories_provider.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/categories/categories_loading_placeholder.dart';
import 'package:oven/widgets/categories/categories_subcategories_wraper.dart';
import 'package:oven/widgets/categories/categories_verticat_axe_header.dart';
import 'package:oven/widgets/categories/category_with_direct_product_child_list.dart';

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
    int maxItemsPerTailColumn = context.isSmallDevice ? 3 : 4;
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
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 2.5),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Center(
                child: Container(margin: EdgeInsets.symmetric(horizontal: 2.5)),
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
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                      margin: EdgeInsets.all(3),
                      width:
                          calculateCategoryColumnWidth(
                            entry.value.length,
                            context,
                          ) +
                          10,
                      height: context.isSmallDevice ? 270 : 355,
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
                        spacing: 5,
                        children: [
                          CategoriesMainCategoryVerticaltAxeHeader(
                            title: entry.key.title,
                          ),
                          CategoriesSubcategoriesWraper(entry: entry),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
      loading: () => CategoriesLoadingPlaceholder(),
      error: (error, _) => Text('Error: $error'),
    );
  }
}

class Category {
  final String slug;
  final String name;
  final String url;

  Category({required this.slug, required this.name, required this.url});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      slug: json['slug'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}

double calculateCategoryColumnWidth(int itemCount, BuildContext context) {
  double singleColumnWidth = context.isSmallDevice ? 108 : 118;
  int maxItemsPerColumn = context.isSmallDevice ? 3 : 4;
  final columns = (itemCount / maxItemsPerColumn).ceil();
  return columns * singleColumnWidth;
}
