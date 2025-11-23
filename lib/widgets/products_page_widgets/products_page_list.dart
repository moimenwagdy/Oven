import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/categories/categories.dart';
import 'package:oven/widgets/categories/category.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';
import 'package:oven/widgets/products_page_widgets/products_page_items.dart';

class ProductsPageList extends ConsumerWidget {
  const ProductsPageList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return categoriesAsync.when(
      data: (categories) {
        final myList = context.isArabic ? arabicProducts : englishProducts;
        final selectedCategoryIndex = ref.watch(selectedCategoryProvider);
        final categoryList = ref.watch(categoriesProvider).value;
        final selectedCategory = categoryList?[selectedCategoryIndex].name;
        final productsList = myList
            .where((product) => product.categoryId == selectedCategory)
            .toList();
        return Expanded(
          child: ProductsPageItems(
            productsList: productsList,
            showFavoriteButton: true,
          ),
        );
      },

      loading: () =>
          const Expanded(child: Center(child: CircularProgressIndicator())),

      error: (err, _) => Expanded(child: Center(child: Text('Error: $err'))),
    );
  }
}
