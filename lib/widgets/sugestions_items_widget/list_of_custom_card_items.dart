import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';
import 'package:oven/widgets/sugestions_items_widget/custom_square_card_item.dart';

class ListOfCustomCardItems extends StatefulWidget {
  final List<Product> itemsList;
  final bool activefavoriteStyle;
  final bool sepcialStyle;

  const ListOfCustomCardItems({
    super.key,
    required this.itemsList,
    required this.activefavoriteStyle,
    required this.sepcialStyle,
  });

  @override
  State<ListOfCustomCardItems> createState() => _ListOfCustomCardItemsState();
}

class _ListOfCustomCardItemsState extends State<ListOfCustomCardItems> {
  List<TextEditingController> _controllers = [];

  @override
  void didUpdateWidget(covariant ListOfCustomCardItems oldWidget) {
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
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.sepcialStyle
          ? context.isSmallDevice
                ? 140
                : 160
          : context.isSmallDevice
          ? 170
          : 190,
      // height: context.isSmallDevice ? 170 : 190,
      child: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: GridView.builder(
            addAutomaticKeepAlives: true,
            key: const PageStorageKey("suggestionGridSystem"),
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              childAspectRatio: 1.05,
            ),
            padding: const EdgeInsets.all(5),
            itemCount: widget.itemsList.length,
            itemBuilder: (context, index) {
              final item = widget.itemsList[index];
              final controller = _controllers[index];
              return CustomSquareCardItem(
                key: Key("suggestItem$index"),
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
