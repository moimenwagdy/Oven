import 'dart:async';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cart_notifier.g.dart';

@Riverpod(keepAlive: true)
class CartNotifier extends _$CartNotifier {
  Future<void> _queue = Future.value();

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

  Future<void> _mutate(
    Future<List<CartItem>> Function(List<CartItem> current) mutator,
  ) {
    final completer = Completer<void>();
    _queue = _queue.then((_) async {
      try {
        final current = List<CartItem>.from(state.value ?? []);
        final updated = await mutator(current);
        await _save(updated);
        if (ref.mounted) {
          state = AsyncValue.data(updated);
        }
      } catch (error, stackTrace) {
        if (ref.mounted) {
          state = AsyncValue.error(error, stackTrace);
        }
      } finally {
        completer.complete();
      }
    });
    return completer.future;
  }

  Future<void> addItem(CartItem payload) {
    return _mutate((cart) async {
      final existingIndex = cart.indexWhere((e) => e.id == payload.id);
      if (existingIndex != -1) {
        final existing = cart[existingIndex];
        cart[existingIndex] = existing.copyWith(
          quantity: existing.quantity + payload.quantity,
        );
      } else {
        cart.add(payload);
      }
      return cart;
    });
  }

  Future<void> replaceItem(String id, int newQty) {
    if (newQty == 0) {
      return removeItem(id);
    }
    return _mutate((cart) async {
      return [
        for (final item in cart)
          if (item.id == id) item.copyWith(quantity: newQty) else item,
      ];
    });
  }

  Future<void> addItemComment(String id, String comment) {
    return _mutate((cart) async {
      return [
        for (final item in cart)
          if (item.id == id) item.copyWith(comment: comment) else item,
      ];
    });
  }

  Future<void> addItemImage(String id, XFile? image) {
    return _mutate((cart) async {
      return [
        for (final item in cart)
          if (item.id == id) item.copyWith(image: image) else item,
      ];
    });
  }

  Future<void> extractToCart(List<CartItem> cart) {
    return _mutate((_) async => [...cart]);
  }

  Future<void> removeItem(String id) {
    return _mutate((cart) async {
      return cart.where((e) => e.id != id).toList();
    });
  }

  Future<void> decreaseQuantity(String id) {
    return _mutate((cart) async {
      final index = cart.indexWhere((e) => e.id == id);
      if (index == -1) return cart;
      final existing = cart[index];
      if (existing.quantity > 1) {
        cart[index] = existing.copyWith(quantity: existing.quantity - 1);
      } else {
        cart.removeAt(index);
      }
      return cart;
    });
  }

  Future<void> clearCart() {
    return _mutate((_) async => <CartItem>[]);
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
  final bool allowAttachImage;
  int quantity;
  String? comment;
  XFile? image;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.allowAttachImage,
    this.quantity = 1,
    this.comment,
    this.image,
  });

  // Sentinel so `image` can be explicitly cleared to null via copyWith
  // while still defaulting to "keep existing value" when omitted.
  static const _unset = Object();

  CartItem copyWith({
    String? id,
    String? title,
    double? price,
    bool? allowAttachImage,
    int? quantity,
    String? comment,
    Object? image = _unset,
  }) {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      allowAttachImage: allowAttachImage ?? this.allowAttachImage,
      quantity: quantity ?? this.quantity,
      comment: comment ?? this.comment,
      image: identical(image, _unset) ? this.image : image as XFile?,
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      comment: json['comment'] as String?,
      image: json['image'] != null ? XFile(json['image'] as String) : null,
      allowAttachImage: json['allowAttachImage'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'quantity': quantity,
    'comment': comment,
    'image': image?.path,
    'allowAttachImage': allowAttachImage,
  };
}
