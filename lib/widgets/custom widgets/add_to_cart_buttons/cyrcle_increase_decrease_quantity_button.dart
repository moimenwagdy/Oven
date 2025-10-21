import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class CyrcleIncreaseDecreaseQuantityButton extends StatefulWidget {
  final IconData icon;
  final TextEditingController controler;
  final bool isIncrement;
  final VoidCallback editingEnd;

  const CyrcleIncreaseDecreaseQuantityButton({
    super.key,
    required this.icon,
    required this.controler,
    required this.isIncrement,
    required this.editingEnd,
  });

  @override
  State<CyrcleIncreaseDecreaseQuantityButton> createState() =>
      _CyrcleIncreaseDecreaseQuantityButtonState();
}

class _CyrcleIncreaseDecreaseQuantityButtonState
    extends State<CyrcleIncreaseDecreaseQuantityButton> {
  void _updateQuantity() {
    widget.editingEnd();
    final currentText = widget.controler.text;
    final currentValue = int.tryParse(currentText) ?? 0;

    final newValue = widget.isIncrement
        ? currentValue + 1
        : (currentValue > 0 ? currentValue - 1 : 0);

    widget.controler.text = newValue.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.isSmallDevice ? 20 : 20,
      height: context.isSmallDevice ? 20 : 20,
      child: IconButton(
        onPressed: _updateQuantity,
        icon: Icon(widget.icon, fontWeight: FontWeight.w900),
        iconSize: context.isSmallDevice ? 12 : 16,
        color: Theme.of(context).colorScheme.onPrimary,
        padding: EdgeInsets.all(0),
        style: IconButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
