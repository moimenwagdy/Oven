import 'dart:convert';

import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/widgets/orders_page_widgets/recent_orders_items.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'recent_orders_provider.g.dart';

@Riverpod(keepAlive: true)
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
    final currentOrders = state.value ?? await _loadFromStorage();
    final updatedOrders = [...currentOrders, orderItem];
    state = AsyncData(updatedOrders);
    await _saveToStorage(updatedOrders);
  }

  Future<void> updateOrderState(String id, String orderState) async {
    final current = state.value;
    if (current == null) return;

    final index = current.indexWhere((o) => o.id == id);
    if (index < 0) return;

    final oldOrder = current[index];

    final updatedOrder = OrderItem(
      id: oldOrder.id,
      status: orderState,
      totalCost: oldOrder.totalCost,
      itemsList: List<String>.from(oldOrder.itemsList),
      cartData: List<CartItem>.from(oldOrder.cartData),
      date: oldOrder.date,
      deliveryDate: oldOrder.deliveryDate,
      orderComment: oldOrder.orderComment,
    );

    final newList = [...current];
    newList[index] = updatedOrder; // replace — no reordering

    state = AsyncData(newList);
    await _saveToStorage(newList);
  }

  Future<void> reset() async {
    state = AsyncData([]);
    await _saveToStorage([]);
  }
}
