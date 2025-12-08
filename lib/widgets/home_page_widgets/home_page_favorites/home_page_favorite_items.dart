import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/favorite_items_provider/favorite_items_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/spinner.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';
import 'package:oven/widgets/sugestions_items_widget/custom_list_with_header.dart';

class HomePageFavoriteItems extends ConsumerWidget {
  const HomePageFavoriteItems({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final favoriteIdsListProvider = ref.watch(favoriteItemsProProvider);
    final usedArray = context.isArabic ? arabicProducts : englishProducts;
    return favoriteIdsListProvider.when(
      data: (data) {
        final favoriteItemsList = data
            .map((id) => findProductById(id, usedArray))
            .whereType<Product>()
            .toList();

        return CustomListWithHeader(
          header: context.l10n.favoritesTab,
          itemsList: favoriteItemsList,
          color: Theme.of(context).colorScheme.onPrimary,
          activefavoriteStyle: true,
          specialStyle: false,
        );
      },
      error: (e, _) => Text(" ${e.toString()}"),
      loading: () => SmallSpinner(),
    );
  }
}

Product? findProductById(String id, List<Product> usedArray) {
  for (final p in usedArray) {
    if (p.id == id) return p;
  }
  return null;
}
