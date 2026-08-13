import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:oven/providers/categories_provider/categories_list_extesion/categories_list_extesion.dart';
import 'package:oven/providers/categories_provider/filtered_maincategory.dart';
import 'package:oven/providers/categories_provider/selected_category_provider.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/categories/categories_loading_placeholder.dart';
import 'package:oven/widgets/categories/category.dart';

class Categories extends ConsumerWidget {
  const Categories({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final grouppedSubCategories = ref.watch(
      filteredGroupedSubCategoriesProvider,
    );
    return grouppedSubCategories.when(
      data: (groupedCategories) {
        final entries = groupedCategories.entries.toList();
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 2.5),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Center(
                child: Container(margin: EdgeInsets.symmetric(horizontal: 2.5)),
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
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
                        // color: Colors.green,
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
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 2.5),
                            width: context.isSmallDevice ? 103 : 113,
                            height: 20,
                            child: Center(
                              child: Text(
                                entry.key.title,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            color: Theme.of(context).colorScheme.onPrimary,
                            height: context.isSmallDevice ? 230 : 320,
                            child: Wrap(
                              textDirection: TextDirection.rtl,
                              runSpacing: 5,
                              spacing: 5,
                              direction: Axis.vertical,
                              children: List.generate(entry.value.length, (
                                index,
                              ) {
                                final item = entry.value[index];
                                return SizedBox(
                                  width: context.isSmallDevice ? 103 : 113,
                                  height: context.isSmallDevice ? 70 : 73,
                                  child: CategoryItem(
                                    title: item.name,
                                    currentIndex: index,
                                    imgUrl:
                                        img[index], // or whatever image source you use
                                    isSelectedCategory:
                                        ref.watch(selectedCategoryProvider) ==
                                        item.id,
                                    onTap: () {
                                      ref
                                          .read(
                                            selectedCategoryProvider.notifier,
                                          )
                                          .selectCategory(item.id);
                                    },
                                  ),
                                );
                              }),
                            ),
                          ),
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

final img = [
  "lib/assets/tart2.png",
  "lib/assets/tart3.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart.png",
  "lib/assets/tart.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart.png",
  "lib/assets/tart.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart.png",
  "lib/assets/tart2.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart.png",
  "lib/assets/tart2.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart3.png",
  "lib/assets/tart3.png",
];

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
