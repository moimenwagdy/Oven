import 'package:oven/providers/cart_provider/cart_notifier.dart';

class OrderItem {
  final List<CartItem> cartData;
  final List<String> itemsList;
  final double totalCost;
  final String status;
  final String id;
  final DateTime date;
  final DateTime? deliveryDate;
  final String orderComment;

  const OrderItem({
    required this.itemsList,
    required this.totalCost,
    required this.cartData,
    required this.status,
    required this.id,
    required this.date,
    required this.orderComment,
    this.deliveryDate,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    itemsList:
        (json['itemsList'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    totalCost: (json['totalCost'] as num?)?.toDouble() ?? 0.0,
    cartData:
        (json['cartData'] as List<dynamic>?)
            ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    status: json['status'] as String? ?? 'Preparing',
    id: json['id'] as String? ?? '',
    date: json['date'] != null
        ? DateTime.parse(json['date'] as String)
        : DateTime.now(),
    orderComment: json['orderComment'] as String? ?? '',
    deliveryDate: json['deliveryDate'] != null
        ? DateTime.parse(json['deliveryDate'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    'itemsList': itemsList,
    'totalCost': totalCost,
    'cartData': cartData.map((e) => e.toJson()).toList(),
    'status': status,
    'id': id,
    'date': date.toIso8601String(),
    'deliveryDate': deliveryDate?.toIso8601String(),
  };
}
