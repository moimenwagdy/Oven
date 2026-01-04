import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/orders_page_widgets/order_item_content.dart';
import 'package:oven/widgets/orders_page_widgets/order_item_data_and_button.dart';
import 'package:oven/widgets/orders_page_widgets/order_status.dart';
import 'package:oven/widgets/orders_page_widgets/recent_orders_items.dart';

class RecentOrdersItem extends StatelessWidget {
  final OrderItem orderItem;

  const RecentOrdersItem({super.key, required this.orderItem});

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
              vertical: context.isSmallDevice ? 20 : 15,
              horizontal: 5,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 120, maxHeight: 130),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  OrderItemContent(
                    contentItemsList: orderItem.itemsList,
                    orderComment: orderItem.orderComment,
                  ),
                  OrderItemDataAndButton(orderItem: orderItem),
                ],
              ),
            ),
          ),
          OrderStatus(status: orderItem.status),
        ],
      ),
    );
  }
}
