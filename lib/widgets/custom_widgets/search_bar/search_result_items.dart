import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/product_item_cards/product_item_card/product_item_card.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';

class SearchResultItems extends StatefulWidget {
  final String query;
  const SearchResultItems({super.key, required this.query});

  @override
  State<SearchResultItems> createState() => _SearchResultItemsState();
}

class _SearchResultItemsState extends State<SearchResultItems> {
  final Map<String, TextEditingController> _controllers = {};

  TextEditingController _getController(String productId) {
    return _controllers.putIfAbsent(productId, () => TextEditingController());
  }

  void _cleanupControllers(List<Product> currentProducts) {
    final currentIds = currentProducts.map((e) => e.id).toSet();

    final keysToRemove = _controllers.keys
        .where((id) => !currentIds.contains(id))
        .toList();

    for (final id in keysToRemove) {
      _controllers[id]?.dispose();
      _controllers.remove(id);
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    _controllers.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listToFilter = englishProducts;
    final bool hasQuery = widget.query != "";
    if (hasQuery) {
      final List<Product> filteredTitleSartsWith = listToFilter
          .where(
            (ele) =>
                ele.title.toLowerCase().startsWith(widget.query.toLowerCase()),
          )
          .toList();
      final List<Product> filteredDecsStartsWith = listToFilter
          .where(
            (ele) => ele.description.toLowerCase().startsWith(
              widget.query.toLowerCase(),
            ),
          )
          .toList();
      final List<Product> filteredtitleHas = listToFilter
          .where(
            (ele) => ele.description.toLowerCase().contains(
              widget.query.toLowerCase(),
            ),
          )
          .toList();
      final List<Product> filteredDescHas = listToFilter
          .where(
            (ele) => ele.description.toLowerCase().contains(
              widget.query.toLowerCase(),
            ),
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
      _cleanupControllers(filteredProducts);

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: ListView.builder(
          padding: EdgeInsets.all(0),
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return ProductItemCard(
              description: product.description,
              showFavoriteButton: false,
              id: product.id,
              images: [],
              price: product.price,
              title: product.title,
              quantityController: _getController(product.id),
              allowAttachImage: product.enabledImageAttachment,
            );
          },
        ),
      );
    }
    return SizedBox.shrink();
  }
}
