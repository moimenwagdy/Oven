import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/categories/categories_loading_placeholder.dart';
import 'package:oven/widgets/categories/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'categories.g.dart';

@riverpod
class CategoriesNotifier extends _$CategoriesNotifier {
  @override
  FutureOr<List<Category>> build() async {
    return fetchCategories();
  }

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products/categories'),
    );
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Category.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(fetchCategories);
  }
}

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
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? Theme.of(
                    context,
                  ).colorScheme.onSecondaryFixed.withValues(alpha: .04)
                : Theme.of(
                    context,
                  ).colorScheme.onSecondaryFixed.withValues(alpha: .5),
          ),
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
