import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cart_notifier.g.dart';

@Riverpod(keepAlive: true)
class CartNotifier extends _$CartNotifier {
  @override
  FutureOr<List<CartItem>> build() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString('cart');
    if (stored != null) {
      final List decoded = jsonDecode(stored);
      return decoded.map((e) => CartItem.fromJson(e)).toList();
    }
    return [];
  }

  Future<void> addItem(CartItem payload) async {
    state = await AsyncValue.guard(() async {
      final cart = List<CartItem>.from(state.value ?? []);

      final existingIndex = cart.indexWhere((e) => e.id == payload.id);
      if (existingIndex != -1) {
        cart[existingIndex].quantity += payload.quantity;
      } else {
        cart.add(payload);
      }

      await _save(cart);
      if (!ref.mounted) return [];
      return [...cart];
    });
  }

  Future<void> replaceItem(String id, int newQty) async {
    if (newQty == 0) {
      removeItem(id);
      return;
    }

    state = await AsyncValue.guard(() async {
      final cart = List<CartItem>.from(state.value ?? []);
      final newCart = [
        for (final item in cart)
          if (item.id == id)
            CartItem(
              id: item.id,
              title: item.title,
              price: item.price,
              quantity: newQty,
            )
          else
            item,
      ];

      await _save(newCart);

      return newCart;
    });
  }

  Future<void> extractToCart(List<CartItem> cart) async {
    state = await AsyncValue.guard(() async {
      final newCart = [...cart];
      await _save(newCart);
      return newCart;
    });
  }

  Future<void> removeItem(String id) async {
    state = await AsyncValue.guard(() async {
      final cart = state.value ?? [];
      final newCart = cart.where((e) => e.id != id).toList();
      await _save(newCart);
      return newCart;
    });
  }

  Future<void> decreaseQuantity(String id) async {
    state = await AsyncValue.guard(() async {
      final cart = state.value ?? [];
      final index = cart.indexWhere((e) => e.id == id);
      if (index != -1) {
        if (cart[index].quantity > 1) {
          cart[index].quantity--;
        } else {
          cart.removeAt(index);
        }
      }
      await _save(cart);
      return [...cart];
    });
  }

  Future<void> clearCart() async {
    state = await AsyncValue.guard(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('cart');
      return [];
    });
  }

  Future<void> _save(List<CartItem> cart) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(cart.map((e) => e.toJson()).toList());
    await prefs.setString('cart', encoded);
  }
}

class CartItem {
  final String id;
  final String title;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    this.quantity = 1,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json['id'] as String,
    title: json['title'] as String,
    price: (json['price'] as num).toDouble(),
    quantity: json['quantity'] as int,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'quantity': quantity,
  };
}


  // Future<void> addItem(CartItem item) async {
  //   state = await AsyncValue.guard(() async {
  //     final cart = state.value ?? [];
  //     final existingIndex = cart.indexWhere((e) => e.id == item.id);
  //     if (existingIndex != -1) {
  //       cart[existingIndex].quantity += item.quantity;
  //     } else {
  //       cart.add(item);
  //     }
  //     await _save(cart);
  //     if (!ref.mounted) return [];

  //     return [...cart];
  //   });
  //   print('Cart updated: ${state.value}');
  // }