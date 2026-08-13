import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/widgets/cart_page_widgets/cart_item_bottom_section_options/cart_item_bottom_section_options_buttons.dart';
import 'package:oven/widgets/custom_widgets/add_to_cart_buttons/quantity_field_and_increase_decrease_circle_buttons.dart';

class CartTableItem extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final TextEditingController commentController;
  final int quantity;
  final String description;
  final double price;
  final String id;
  final String? comment;
  final bool allowAttachImage;

  const CartTableItem({
    super.key,
    required this.quantity,
    required this.description,
    required this.price,
    required this.id,
    required this.controller,
    required this.commentController,
    required this.comment,
    required this.allowAttachImage,
  });

  @override
  ConsumerState<CartTableItem> createState() => _CartTableItemState();
}

class _CartTableItemState extends ConsumerState<CartTableItem> {
  @override
  void initState() {
    if (widget.comment != null) {
      widget.commentController.text = widget.comment!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentItem = ref.watch(
      cartProvider.select(
        (state) => state.value?.firstWhere((e) => e.id == widget.id),
      ),
    );

    widget.controller.text = currentItem!.quantity.toString();
    final stringifiedPrice = widget.price.toStringAsFixed(1);
    final amount = (widget.price * widget.quantity).toStringAsFixed(1);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            border: BoxBorder.symmetric(
              horizontal: BorderSide(
                color: Colors.black.withValues(alpha: .05),
              ),
            ),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 35),
            child: Row(
              children: [
                const SizedBox(width: 5),
                SizedBox(
                  width: (context.screenWidth - 26) * .34,
                  child: Text(
                    widget.description,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(
                  width: (context.screenWidth - 26) * .16,
                  child: Wrap(
                    textDirection: TextDirection.ltr,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      Text(
                        stringifiedPrice,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: (context.screenWidth - 26) * .16,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        amount,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: QuantityFieldAndIncreaseDecreaseCircleButtons(
                    key: const ValueKey("cart_quantity_controller"),
                    controller: widget.controller,
                    id: widget.id,
                    price: widget.price,
                    title: widget.description,
                    allowAttachImage: widget.allowAttachImage,
                  ),
                ),
              ],
            ),
          ),
        ),
        CartItemBottomSectionOptionsButtons(
          id: widget.id,
          commentController: widget.commentController,
          allowAttachImage: widget.allowAttachImage,
        ),
      ],
    );
  }
}
