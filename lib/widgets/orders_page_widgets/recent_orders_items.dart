import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items/cart_notifier.dart';
import 'package:oven/widgets/orders_page_widgets/recent_orders_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'recent_orders_items.g.dart';

@Riverpod(keepAlive: true)
class RecentOrdersList extends _$RecentOrdersList {
  static const _storageKey = "recent_orders";

  @override
  List<OrderItem> build() {
    _loadFromStorage();
    return [];
  }

  Future<void> _loadFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);

    if (jsonString == null) return;

    final List decoded = jsonDecode(jsonString) as List;
    final loadedOrders = decoded
        .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
        .toList();

    state = loadedOrders;
  }

  Future<void> _saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(state.map((e) => e.toJson()).toList());
    await prefs.setString(_storageKey, encoded);
  }

  void addOrder(OrderItem orderItem) {
    state = [...state, orderItem];
    _saveToStorage();
  }
}

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
        String type;
        if (index == 0) {
          type = "approved";
        } else if (index == 1) {
          type = "preparing";
        } else {
          type = "cancelled";
        }
        return RecentOrdersItem(
          type: type,
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

  const OrderItem({
    required this.itemsList,
    required this.totalCost,
    required this.cartData,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    itemsList: List<String>.from(json['itemsList'] as List),
    totalCost: (json['totalCost'] as num).toDouble(),
    cartData: (json['cartData'] as List)
        .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'itemsList': itemsList,
    'totalCost': totalCost,
    'cartData': cartData.map((e) => e.toJson()).toList(),
  };
}
