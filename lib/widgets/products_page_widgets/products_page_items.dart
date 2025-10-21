import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom%20widgets/product_item_card/product_item_card.dart';

class ProductsPageItems extends StatefulWidget {
  const ProductsPageItems({super.key});

  @override
  State<ProductsPageItems> createState() => _ProductsPageItemsState();
}

class _ProductsPageItemsState extends State<ProductsPageItems>
    with AutomaticKeepAliveClientMixin {
  late final List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(50, (_) => TextEditingController(text: "0"));
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

    return ListView.builder(
      addAutomaticKeepAlives: true,
      padding: EdgeInsets.symmetric(horizontal: 5),
      key: const PageStorageKey("MostOrderedItems"),
      itemCount: _controllers.length,
      itemBuilder: (context, index) {
        return ProductItemCard(
          key: Key(index.toString()),
          quantityController: _controllers[index],
          title: context.l10n.mostOrderedItemTitle,
          description: context.l10n.description,
          showFavoriteButton: false,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
