import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/add_to_cart_buttons/global_quantity_buttons_add_and_increase_decrease.dart';
import 'package:oven/widgets/custom_widgets/oven_logo.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';

class SearchResultItem extends StatefulWidget {
  final Product product;
  final bool showFavoriteButton;
  final VoidCallback onTap;
  const SearchResultItem({
    super.key,
    required this.product,
    required this.showFavoriteButton,
    required this.onTap,
  });

  @override
  State<SearchResultItem> createState() => _SearchResultItemState();
}

class _SearchResultItemState extends State<SearchResultItem> {
  late final TextEditingController quantityController;

  @override
  void initState() {
    super.initState();
    quantityController = TextEditingController();
  }

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.isSmallDevice ? 90 : 100,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Theme.of(context).colorScheme.onSecondaryFixed,
        elevation: 0,
        margin: EdgeInsets.only(bottom: 5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            spacing: 10,
            children: [
              GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  width: context.isSmallDevice ? 70 : 80,
                  height: context.isSmallDevice ? 65 : 75,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: context.isDarkMode
                        ? Colors.grey.withValues(alpha: .2)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: OvenLogo(minW: 40, maxW: 80),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: widget.onTap,
                            child: Text(
                              widget.product.title,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontSize: context.isSmallDevice ? 12 : 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 5),
                      SizedBox(
                        height: 45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: widget.onTap,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: widget.showFavoriteButton
                                      ? (context.screenWidth - 8) * .30
                                      : (context.screenWidth - 8) * .30,
                                  maxWidth: widget.showFavoriteButton
                                      ? context.isSmallDevice
                                            ? (context.screenWidth - 8) * .32
                                            : (context.screenWidth - 8) * .35
                                      : (context.screenWidth - 8) * .38,
                                ),
                                child: Text(
                                  widget.product.description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ),
                            ),
                            GlobalQuantityButtonsAddAndIncreaseDecrease(
                              key: ValueKey("normalCard_quantity_controller"),
                              controller: quantityController,
                              id: widget.product.id,
                              price: widget.product.price,
                              title: widget.product.title,
                              isSquareLayout: false,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.product.price} ${context.l10n.le}",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontSize:  10,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
