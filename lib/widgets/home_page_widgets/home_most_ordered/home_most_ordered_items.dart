import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/product_item_card/product_item_card.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';

class HomeMostOrderedItems extends StatefulWidget {
  const HomeMostOrderedItems({super.key});

  @override
  State<HomeMostOrderedItems> createState() => _HomeMostOrderedItemsState();
}

class _HomeMostOrderedItemsState extends State<HomeMostOrderedItems>
    with AutomaticKeepAliveClientMixin {
  late final List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      englishProducts.length,
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
    return RefreshIndicator(
      onRefresh: () async => {},
      child: Scrollbar(
        child: ListView.builder(
          addAutomaticKeepAlives: true,
          padding: EdgeInsets.symmetric(horizontal: 5),
          key: const PageStorageKey("MostOrderedItems"),
          itemCount: context.isArabic
              ? arabicProducts.length
              : englishProducts.length,
          itemBuilder: (context, index) {
            final item = context.isArabic
                ? arabicProducts[index]
                : englishProducts[index];
            return ProductItemCard(
              key: Key(item.title),
              quantityController: _controllers[index],
              title: item.title,
              description: item.description,
              showFavoriteButton: false,
              id: item.id,
              price: item.price,
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
