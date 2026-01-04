import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/categories_provider/categories_provider.dart';
import 'package:oven/providers/categories_provider/selected_category_provider.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/categories/categories_loading_placeholder.dart';
import 'package:oven/widgets/categories/category.dart';

class Categories extends ConsumerWidget {
  const Categories({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final categoriesArr = ref.watch(categoriesProvider);
    return categoriesArr.when(
      data: ((categoriesArr) => Center(
        child: Container(
          margin: EdgeInsets.only(top: 5),
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Scrollbar(
            child: RefreshIndicator(
              onRefresh: () async {},
              child: ListView(
                key: const PageStorageKey("CategoriesPage"),
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: context.isSmallDevice ? 290 : 340,
                    child: Consumer(
                      builder: (context, ref, child) {
                        final arr = ref.watch(categoriesProvider);
                        return arr.when(
                          data: (arr) {
                            return GridView.builder(
                              key: const PageStorageKey("CategoriesGrid"),
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: context.isSmallDevice
                                        ? 10
                                        : 15,
                                    mainAxisSpacing: context.isSmallDevice
                                        ? 10
                                        : 10,
                                    childAspectRatio: context.isSmallDevice
                                        ? .66
                                        : .68,
                                  ),
                              padding: EdgeInsets.zero,
                              itemCount: arr.length,
                              itemBuilder: (context, index) {
                                final Category item = arr[index];
                                return CategoryItem(
                                  onTap: () {
                                    ref
                                        .read(selectedCategoryProvider.notifier)
                                        .selectCategory(index);
                                  },
                                  isSelectedCategory:
                                      ref.watch(selectedCategoryProvider) ==
                                      index,
                                  imgUrl: img[index],
                                  currentIndex: index,
                                  title: item.slug,
                                  key: Key(index.toString()),
                                );
                              },
                            );
                          },
                          loading: () => CategoriesLoadingPlaceholder(),
                          error: (error, _) => Text('Error: $error'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
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
