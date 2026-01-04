import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';

class CyrcleIncreaseDecreaseQuantityButton extends ConsumerWidget {
  final IconData icon;
  final TextEditingController controler;
  final bool isIncrement;
  final VoidCallback editingEnd;
  final String id;
  final String title;
  final double price;

  const CyrcleIncreaseDecreaseQuantityButton(
    this.id, {
    super.key,
    required this.icon,
    required this.controler,
    required this.isIncrement,
    required this.editingEnd,
    required this.price,
    required this.title,
  });

  void _updateQuantity(WidgetRef ref) {
    editingEnd();
    final cartAction = ref.read(cartProvider.notifier);
    final currentText = controler.text;
    final currentValue = int.tryParse(currentText) ?? 0;
    final int newValue;
    if (isIncrement == true) {
      newValue = currentValue + 1;
      cartAction.addItem(CartItem(id: id, title: title, price: price));
    } else {
      newValue = currentValue > 0 ? currentValue - 1 : 0;
      cartAction.decreaseQuantity(id);
    }
    controler.text = newValue.toString();
  }

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () => _updateQuantity(ref),
      child: Container(
        color: Colors.transparent,
        width: 45,
        height: 45,
        child: Center(
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              icon,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              size: 16,
              applyTextScaling: true,
            ),
          ),
        ),
      ),
    );
  }
}
