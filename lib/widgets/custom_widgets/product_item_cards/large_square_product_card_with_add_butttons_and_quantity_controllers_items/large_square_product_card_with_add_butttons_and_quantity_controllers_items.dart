import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';
import 'package:oven/widgets/custom_widgets/product_item_cards/large_square_product_card_with_add_butttons_and_quantity_controllers_items/large_square_product_card_with_add_butttons_and_quantity_controllers_item.dart';

class LargeSquareProductCardWithAddButttonsAndQuantityControllersItems
    extends StatefulWidget {
  final List<Product> itemsList;
  final bool activefavoriteStyle;
  final bool sepcialStyle;

  const LargeSquareProductCardWithAddButttonsAndQuantityControllersItems({
    super.key,
    required this.itemsList,
    required this.activefavoriteStyle,
    required this.sepcialStyle,
  });

  @override
  State<LargeSquareProductCardWithAddButttonsAndQuantityControllersItems>
  createState() =>
      _LargeSquareProductCardWithAddButttonsAndQuantityControllersItemsState();
}

class _LargeSquareProductCardWithAddButttonsAndQuantityControllersItemsState
    extends
        State<
          LargeSquareProductCardWithAddButttonsAndQuantityControllersItems
        > {
  final ScrollController _scrollController = ScrollController(); // ← controller

  List<TextEditingController> _controllers = [];

  @override
  void didUpdateWidget(
    covariant LargeSquareProductCardWithAddButttonsAndQuantityControllersItems
    oldWidget,
  ) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.itemsList.length != widget.itemsList.length) {
      for (final c in _controllers) {
        c.dispose();
      }

      _controllers = List.generate(
        widget.itemsList.length,
        (_) => TextEditingController(text: '0'),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.itemsList.length,
      (index) => TextEditingController(text: '0'),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();

    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.isSmallDevice ? 190 : 210,
      child: Scrollbar(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: GridView.builder(
            controller: _scrollController,
            addAutomaticKeepAlives: true,
            key: const PageStorageKey("suggestionGridSystem"),
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              childAspectRatio: widget.sepcialStyle ? .85 : 1.05,
            ),
            padding: const EdgeInsets.all(5),
            itemCount: widget.itemsList.length,
            itemBuilder: (context, index) {
              final item = widget.itemsList[index];
              final controller = _controllers[index];
              return LargeSquareProductCardWithAddButttonsAndQuantityControllersItem(
                key: Key("suggestItem${item.title}"),
                title: item.title,
                price: item.price,
                id: item.id,
                controller: controller,
                activefavoriteStyle: widget.activefavoriteStyle,
                sepecialStyle: widget.sepcialStyle,
              );
            },
          ),
        ),
      ),
    );
  }
}

class DessertItem {
  final String title;
  final double price;

  DessertItem({required this.title, required this.price});
}
