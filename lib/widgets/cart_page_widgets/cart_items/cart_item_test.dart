import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/cart_page_widgets/cart_item_bottom_section_options/cart_item_bottom_section_options_buttons.dart';
import 'package:oven/widgets/custom_widgets/add_to_cart_buttons/quantity_field_and_increase_decrease_circle_buttons.dart';

class CartItemTest extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final TextEditingController commentController;
  final int quantity;
  final String description;
  final double price;
  final String id;
  final String? comment;
  final bool allowAttachImage;

  const CartItemTest({
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
  ConsumerState<CartItemTest> createState() => _CartItemTestState();
}

class _CartItemTestState extends ConsumerState<CartItemTest> {
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

    return Container(
      margin: EdgeInsets.all(context.isSmallDevice ? 2.5 : 5),
      padding: EdgeInsets.symmetric(
        horizontal: context.isSmallDevice ? 5 : 5,
        vertical: 5,
      ),
      height: context.isSmallDevice ? 90 : 100,
      decoration: BoxDecoration(
        // border: Border.symmetric(
        //   horizontal: BorderSide(
        //     color: Theme.of(context).colorScheme.primary,
        //     width: 1,
        //   ),
        // ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: context.isSmallDevice ? 75.w : 80.w,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(8),
                  child: Image.asset(
                    "lib/assets/productsImages/CAT Vienna Bread.jpg",
                  ),
                ),
              ),
              SizedBox(width: context.isSmallDevice ? 5 : 10),
              Container(
                constraints: BoxConstraints(minWidth: 120.w, maxWidth: 130.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Text(
                      widget.description,
                      style: context.isSmallDevice
                          ? Theme.of(
                              context,
                            ).textTheme.labelLarge?.copyWith(fontSize: 13)
                          : Theme.of(context).textTheme.labelLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text(
                          "$stringifiedPrice EGP",
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(color: primary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: context.isSmallDevice ? 5 : 10,
            children: [
              QuantityFieldAndIncreaseDecreaseCircleButtons(
                key: const ValueKey("cart_quantity_controller"),
                controller: widget.controller,
                id: widget.id,
                price: widget.price,
                title: widget.description,
                allowAttachImage: widget.allowAttachImage,
              ),
              if (context.isSmallDevice)
                CartItemBottomSectionOptionsButtons(
                  id: widget.id,
                  commentController: widget.commentController,
                  allowAttachImage: widget.allowAttachImage,
                ),
              if (!context.isSmallDevice)
                CartItemBottomSectionOptionsButtons(
                  id: widget.id,
                  commentController: widget.commentController,
                  allowAttachImage: widget.allowAttachImage,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
