import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/categories_provider/sub_categories_provider.dart';
import 'package:oven/providers/categories_provider/selected_category_provider.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';
import 'package:oven/widgets/products_page_widgets/products_page_items.dart';

class ProductsPageList extends ConsumerWidget {
  const ProductsPageList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return categoriesAsync.when(
      data: (categories) {
        final myList = englishProducts;
        final selectedCategoryId = ref.watch(selectedCategoryProvider);
        final productsList = myList
            .where((product) => product.subCategoryId.id == selectedCategoryId)
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
