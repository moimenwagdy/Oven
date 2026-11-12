import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/product_item_cards/large_square_product_card_with_add_butttons_and_quantity_controllers_items/nudg_arrow.dart';
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

  final ValueNotifier<({bool left, bool right})> _arrows = ValueNotifier((
    left: false,
    right: false,
  ));

  void _updateArrows() {
    if (!mounted || !_scrollController.hasClients) return;
    final p = _scrollController.position;
    _arrows.value = (
      left: p.pixels > p.minScrollExtent + 1,
      right: p.pixels < p.maxScrollExtent - 1,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateArrows);
    _controllers = List.generate(
      widget.itemsList.length,
      (index) => TextEditingController(text: '0'),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateArrows);
    _scrollController.dispose();
    _arrows.dispose();
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Stack(
        clipBehavior: Clip.none,

        children: [
          Padding(
            padding: EdgeInsets.only(),
            child: NotificationListener<ScrollMetricsNotification>(
              onNotification: (_) {
                _updateArrows();
                return false;
              },
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 5),
                controller: _scrollController,
                addAutomaticKeepAlives: true,
                key: const PageStorageKey("suggestionGridSystem"),
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: context.isSmallDevice ? 10 : 15,
                  childAspectRatio: widget.sepcialStyle
                      ? .85
                      : context.isSmallDevice
                      ? 1.18
                      : 1.07,
                ),
                itemCount: widget.itemsList.length,
                itemBuilder: (context, index) {
                  final item = widget.itemsList[index];
                  final controller = _controllers[index];
                  return LargeSquareProductCardWithAddButttonsAndQuantityControllersItem(
                    key: Key("suggestItem${item.title}"),
                    productItem: item,
                    controller: controller,
                    activefavoriteStyle: widget.activefavoriteStyle,
                    sepecialStyle: widget.sepcialStyle,
                  );
                },
              ),
            ),
          ),
          Positioned(
            right: -5,
            top: 30,
            child: IgnorePointer(
              child: ValueListenableBuilder(
                valueListenable: _arrows,
                builder: (context, arrows, _) => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: arrows.right
                      ? const NudgeArrow(
                          key: ValueKey('arrowRight'),
                          icon: Icons.chevron_right_rounded,
                          distance: 6,
                        )
                      : const SizedBox.shrink(key: ValueKey('noArrowRight')),
                ),
              ),
            ),
          ),
          Positioned(
            left: -5,
            top: 30,
            child: IgnorePointer(
              child: ValueListenableBuilder(
                valueListenable: _arrows,
                builder: (context, arrows, _) => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: arrows.left
                      ? const NudgeArrow(
                          key: ValueKey('arrowLeft'),
                          icon: Icons.chevron_left_rounded,
                          distance: -6,
                        )
                      : const SizedBox.shrink(key: ValueKey('noArrowLeft')),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
