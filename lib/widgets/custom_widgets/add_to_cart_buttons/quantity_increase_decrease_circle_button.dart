import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/utils/constants/colors.dart';

class CyrcleIncreaseDecreaseQuantityButton extends ConsumerWidget {
  final IconData icon;
  final TextEditingController controler;
  final bool isIncrement;
  final VoidCallback editingEnd;
  final String id;
  final String title;
  final double price;
  final bool allowAttachImage;

  const CyrcleIncreaseDecreaseQuantityButton(
    this.id, {
    super.key,
    required this.icon,
    required this.controler,
    required this.isIncrement,
    required this.editingEnd,
    required this.price,
    required this.title,
    required this.allowAttachImage,
  });

  void _updateQuantity(WidgetRef ref) {
    editingEnd();
    final cartAction = ref.read(cartProvider.notifier);
    if (isIncrement) {
      cartAction.addItem(
        CartItem(
          id: id,
          title: title,
          price: price,
          allowAttachImage: allowAttachImage,
        ),
      );
    } else {
      cartAction.decreaseQuantity(id);
    }
  }

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () => _updateQuantity(ref),
      child: Container(
        color: Colors.transparent,
        width: 40,
        height: 35,
        child: Center(
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              // color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              icon,
              fontWeight: FontWeight.w900,
              color: primary,
              size: 20,
              applyTextScaling: true,
            ),
          ),
        ),
      ),
    );
  }
}
