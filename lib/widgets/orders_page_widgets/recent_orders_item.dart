import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/widgets/orders_page_widgets/order_item_content.dart';
import 'package:oven/widgets/orders_page_widgets/order_item_data_and_button.dart';
import 'package:oven/widgets/orders_page_widgets/order_status.dart';

class RecentOrdersItem extends StatelessWidget {
  final String type;
  final List<String> contentItemsList;
  final List<CartItem> cartData;
  final double totalCost;
  const RecentOrdersItem({
    super.key,
    required this.type,
    required this.contentItemsList,
    required this.totalCost,
    required this.cartData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onSecondaryFixed,
      elevation: 0,
      child: Stack(
        alignment: context.isArabic ? Alignment.topRight : Alignment.topLeft,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.isSmallDevice ? 20 : 10,
              horizontal: 5,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 120, maxHeight: 130),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  OrderItemContent(contentItemsList: contentItemsList),
                  OrderItemDataAndButton(
                    cartData: cartData,
                    contentItemsList: contentItemsList,
                    totalCost: totalCost,
                    type: type,
                  ),
                ],
              ),
            ),
          ),
          OrderStatus(status: type),
        ],
      ),
    );
  }
}
