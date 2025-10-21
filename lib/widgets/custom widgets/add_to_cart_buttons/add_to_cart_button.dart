import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';

class AddToCartButton extends StatelessWidget {
  final Widget textChild;
  final VoidCallback onPressed;
  const AddToCartButton({
    super.key,
    required this.textChild,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 16),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: lighterPrimary,
          overlayColor: Theme.of(context).colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          animationDuration: const Duration(milliseconds: 200),
        ),
        onPressed: onPressed,
        child: textChild,
      ),
    );
  }
}
