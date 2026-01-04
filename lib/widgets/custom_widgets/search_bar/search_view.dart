import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/search_bar/search_result_item_archived.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';

class SearchView extends SearchDelegate<String> {
  @override
  String? get searchFieldLabel => '';

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
        toolbarHeight: 50,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 0),
        hintStyle: theme.textTheme.labelLarge,
      ),

      textTheme: theme.textTheme.copyWith(
        titleLarge: theme.textTheme.labelLarge,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = "";
            showSuggestions(context);
          },
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(0),
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final listToFilter = context.isArabic ? arabicProducts : englishProducts;
    final List<Product> filteredTitleSartsWith = listToFilter
        .where((ele) => ele.title.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    final List<Product> filteredDecsStartsWith = listToFilter
        .where(
          (ele) =>
              ele.description.toLowerCase().startsWith(query.toLowerCase()),
        )
        .toList();
    final List<Product> filteredtitleHas = listToFilter
        .where(
          (ele) => ele.description.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    final List<Product> filteredDescHas = listToFilter
        .where(
          (ele) => ele.description.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    final merged = [
      ...filteredTitleSartsWith,
      ...filteredDecsStartsWith,
      ...filteredtitleHas,
      ...filteredDescHas,
    ];
    final itemsList = merged
        .where(
          (ele) =>
              ele.title.toLowerCase().contains(query.toLowerCase()) ||
              ele.description.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    if (itemsList.isEmpty) {
      return Center(
        child: Text(
          context.l10n.noResults,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: ListView.builder(
        itemCount: itemsList.length,
        itemBuilder: (context, index) {
          final product = itemsList[index];
          return SearchResultItem(
            product: product,
            showFavoriteButton: false,
            onTap: () => {
              context.push("/products/${product.id}"),
              close(context, ""),
            },
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listToFilter = context.isArabic ? arabicProducts : englishProducts;
    final bool hasQuery = query != "";
    if (hasQuery) {
      final List<Product> filteredTitleSartsWith = listToFilter
          .where(
            (ele) => ele.title.toLowerCase().startsWith(query.toLowerCase()),
          )
          .toList();
      final List<Product> filteredDecsStartsWith = listToFilter
          .where(
            (ele) =>
                ele.description.toLowerCase().startsWith(query.toLowerCase()),
          )
          .toList();
      final List<Product> filteredtitleHas = listToFilter
          .where(
            (ele) =>
                ele.description.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
      final List<Product> filteredDescHas = listToFilter
          .where(
            (ele) =>
                ele.description.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();

      final merged = [
        ...filteredTitleSartsWith,
        ...filteredDecsStartsWith,
        ...filteredtitleHas,
        ...filteredDescHas,
      ];
      final filteredProducts = merged
          .fold<Map<String, Product>>({}, (map, product) {
            map[product.id] = product; 
            return map;
          })
          .values
          .toList();
      if (filteredProducts.isEmpty) {
        return Center(
          child: Text(
            context.l10n.noResults,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        );
      }

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: ListView.builder(
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return SearchResultItem(
              product: product,
              showFavoriteButton: false,
              onTap: () => {
                context.push("/products/${product.id}"),
                close(context, ""),
              },
            );
          },
        ),
      );
    }
    return SizedBox.shrink();
  }
}
