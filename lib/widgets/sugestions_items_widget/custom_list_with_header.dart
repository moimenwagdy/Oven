import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';
import 'package:oven/widgets/custom_widgets/product_item_cards/large_square_product_card_with_add_butttons_and_quantity_controllers_items/large_square_product_card_with_add_butttons_and_quantity_controllers_items.dart';

class CustomListWithHeader extends StatelessWidget {
  final String header;
  final List<Product> itemsList;
  final Color color;
  final bool activefavoriteStyle;
  final bool specialStyle;
  const CustomListWithHeader({
    super.key,
    required this.header,
    required this.itemsList,
    required this.color,
    required this.activefavoriteStyle,
    required this.specialStyle,
  });

  @override
  Widget build(BuildContext context) {
    final listIsEmpty = itemsList.isEmpty;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  header,
                  style: Theme.of(
                    context,
                  ).textTheme.displaySmall?.copyWith(color: primary),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          listIsEmpty
              ? SizedBox(
                  height: context.isSmallDevice ? 150 : 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No Items Added",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      GestureDetector(
                        child: Text(
                          "watch products and start love items",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                )
              : LargeSquareProductCardWithAddButttonsAndQuantityControllersItems(
                  itemsList: itemsList,
                  activefavoriteStyle: activefavoriteStyle,
                  sepcialStyle: specialStyle,
                ),
        ],
      ),
    );
  }
}
