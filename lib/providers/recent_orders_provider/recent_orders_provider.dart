import 'dart:convert';

import 'package:oven/widgets/orders_page_widgets/recent_orders_items.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'recent_orders_provider.g.dart';

@Riverpod(keepAlive: false)
class RecentOrdersList extends _$RecentOrdersList {
  static const _storageKey = "recent_orders";

  @override
  Future<List<OrderItem>> build() async {
    return _loadFromStorage();
  }

  Future<List<OrderItem>> _loadFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);

    if (jsonString == null) return [];

    final List decoded = jsonDecode(jsonString) as List;
    final loadedOrders = decoded
        .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
        .toList();

    return loadedOrders;
  }

  Future<void> _saveToStorage(List<OrderItem> list) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(list.map((e) => e.toJson()).toList());
    await prefs.setString(_storageKey, encoded);
  }

  Future<void> addOrder(OrderItem orderItem) async {
    final currentOrders = state.value ?? [];
    final updatedOrders = [...currentOrders, orderItem];
    state = AsyncData(updatedOrders);
    await _saveToStorage(updatedOrders);
  }
}
