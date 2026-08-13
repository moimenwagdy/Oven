import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom_items_list_with_header/custom_items_list_with_header.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';

class CartListSuggesionsList extends StatelessWidget {
  const CartListSuggesionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomItemsListWithHeader(
      header: context.l10n.itemsYouMayLike,
      itemsList: englishProducts.sublist(20, 40),
      activefavoriteStyle: false,
      color: Colors.transparent,
      specialStyle: false,
    );
  }
}
