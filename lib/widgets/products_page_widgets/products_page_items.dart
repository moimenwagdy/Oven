import 'package:flutter/material.dart';
import 'package:oven/widgets/custom_widgets/product_item_cards/product_item_card/product_item_card.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';

class ProductsPageItems extends StatefulWidget {
  final List<Product> productsList;
  final bool showFavoriteButton;
  const ProductsPageItems({
    super.key,
    required this.productsList,
    required this.showFavoriteButton,
  });

  @override
  State<ProductsPageItems> createState() => _ProductsPageItemsState();
}

class _ProductsPageItemsState extends State<ProductsPageItems>
    with AutomaticKeepAliveClientMixin {
  late final List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.productsList.length,
      (_) => TextEditingController(text: "0"),
    );
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
      key: PageStorageKey("ProductsPageItems"),
      itemCount: widget.productsList.length,
      itemBuilder: (context, index) {
        final product = widget.productsList[index];
        return ProductItemCard(
          key: Key("ProdcutItem${product.id}"),
          quantityController: _controllers[index],
          title: product.title,
          description: product.description,
          showFavoriteButton: widget.showFavoriteButton,
          id: product.id,
          price: product.price,
          images: product.images,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
