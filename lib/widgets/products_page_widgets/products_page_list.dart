import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_categories_provider.dart';
import 'package:oven/providers/categories_provider/sub_categories_provider.dart';
import 'package:oven/providers/categories_provider/selected_category_provider.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';
import 'package:oven/widgets/products_page_widgets/products_page_items.dart';
import 'package:collection/collection.dart';

class ProductsPageList extends ConsumerWidget {
  const ProductsPageList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);
    List<Product> list;
    return categoriesAsync.when(
      data: (categories) {
        final myList = context.isArabic ? arabicProducts : englishProducts;
        final selectedCategoryId = ref.watch(selectedCategoryProvider);
        final productsList = myList
            .where((product) => product.subCategoryId.id == selectedCategoryId)
            .toList();
        final targetMainCategory = ref
            .watch(mainCategoriesProvider)
            .value
            ?.firstWhereOrNull((ele) => ele.id == selectedCategoryId);

        final mainCategoryProductsList = myList
            .where(
              (item) =>
                  targetMainCategory?.products?.contains(item.id) ?? false,
            )
            .toList();
        if (targetMainCategory == null) {
          list = productsList;
        } else {
          list = mainCategoryProductsList;
        }

        return Expanded(
          child: ProductsPageItems(
            key: Key(list.length.toString()),
            productsList: list,
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
