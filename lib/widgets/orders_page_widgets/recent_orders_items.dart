import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/widgets/orders_page_widgets/recent_orders_item.dart';

class RecentOrdersItems extends ConsumerWidget {
  final List<OrderItem> ordersList;
  const RecentOrdersItems({super.key, required this.ordersList});
  @override
  Widget build(BuildContext context, ref) {
    return ListView.builder(
      key: const PageStorageKey("favoriteItemsPage"),
      itemCount: ordersList.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return RecentOrdersItem(
          type: ordersList[index].status,
          contentItemsList: ordersList[index].itemsList,
          totalCost: ordersList[index].totalCost,
          cartData: ordersList[index].cartData,
        );
      },
    );
  }
}

class OrderItem {
  final List<CartItem> cartData;
  final List<String> itemsList;
  final double totalCost;
  final String status; // new field

  const OrderItem({
    required this.itemsList,
    required this.totalCost,
    required this.cartData,
    required this.status, // new field
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    itemsList: List<String>.from(json['itemsList'] as List),
    totalCost: (json['totalCost'] as num).toDouble(),
    cartData: (json['cartData'] as List)
        .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['status'] as String, // new field
  );

  Map<String, dynamic> toJson() => {
    'itemsList': itemsList,
    'totalCost': totalCost,
    'cartData': cartData.map((e) => e.toJson()).toList(),
    'status': status, // new field
  };
}
