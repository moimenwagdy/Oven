import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';
import 'package:oven/widgets/sugestions_items_widget/custom_list_with_header.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_page_favorite_items.g.dart';

@riverpod
class FavoriteItemsPro extends _$FavoriteItemsPro {
  @override
  List build() => [];
  void addToFavorites(String id) => state = [id, ...state];
  void removeFromFavorites(String id) =>
      state = state.where((ele) => ele != id).toList();
}

class HomePageFavoriteItems extends ConsumerWidget {
  const HomePageFavoriteItems({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final favoriteIdsList = ref.watch(favoriteItemsProProvider);
    final usedArray = context.isArabic ? arabicProducts : englishProducts;
    final favoriteItemsList = favoriteIdsList
        .map((id) => usedArray.firstWhere((p) => p.id == id))
        .toList();
    // final favoritesIsEmpty = favoriteItemsList.isEmpty;
    return
    //  favoritesIsEmpty
    //     ?
    //     :
    CustomListWithHeader(
      header: context.l10n.favoritesTab,
      itemsList: favoriteItemsList,
      color: Theme.of(context).colorScheme.onPrimary,
      activefavoriteStyle: true,
      specialStyle: false,
    );
  }
}
