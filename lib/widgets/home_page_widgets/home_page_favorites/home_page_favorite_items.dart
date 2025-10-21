import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom%20widgets/product_item_card/product_item_card.dart';

class HomePageFavoriteItems extends StatefulWidget {
  const HomePageFavoriteItems({super.key});

  @override
  State<HomePageFavoriteItems> createState() => _HomePageFavoriteItemsState();
}

class _HomePageFavoriteItemsState extends State<HomePageFavoriteItems>
    with AutomaticKeepAliveClientMixin {
  late final List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(10, (_) => TextEditingController(text: "0"));
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final items = List.generate(
      10,
      (index) => "${context.l10n.favoriteItemTitle} $index",
    );
    return ListView.builder(
      key: const PageStorageKey("favoriteItemsPage"),
      itemCount: items.length,
      // padding: EdgeInsets.zero,\
      padding: EdgeInsets.symmetric(horizontal: 5),

      itemBuilder: (context, index) {
        return ProductItemCard(
          quantityController: _controllers[index],
          key: ValueKey(index),
          title: context.l10n.mostOrderedItemTitle,
          description: context.l10n.description,
          showFavoriteButton: true,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
