import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/orders_page_widgets/order_item_button.dart';
import 'package:oven/widgets/orders_page_widgets/recent_order_date_information.dart';
import 'package:oven/widgets/orders_page_widgets/recent_orders_items.dart';

class OrderItemDataAndButton extends StatelessWidget {
  final OrderItem orderItem;

  const OrderItemDataAndButton({super.key, required this.orderItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 150,
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface.withValues(
              alpha: context.isDarkMode ? .15 : .1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: [
              Text(
                " ${context.l10n.itemsCount} ${orderItem.itemsList.length}",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              Text(
                "${orderItem.totalCost.toStringAsFixed(2)} ${context.l10n.le}",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        RecentOrderDateInformation(
          date: orderItem.date,
          deliveryDate: orderItem.deliveryDate!,
          status: orderItem.status,
        ),
        OrderItemButton(
          cartData: orderItem.cartData,
          id: orderItem.id,
          status: orderItem.status,
        ),
      ],
    );
  }
}
