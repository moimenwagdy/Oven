import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';

class AddToCartButton extends StatelessWidget {
  final Widget textChild;
  final VoidCallback onPressed;
  final bool specialStyle;
  const AddToCartButton({
    super.key,
    required this.textChild,
    required this.onPressed,
    required this.specialStyle,
  });

  @override
  Widget build(BuildContext context) {
    final isSpecialStyle = specialStyle == true;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 12),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: lighterPrimary,
        overlayColor: Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: isSpecialStyle
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                )
              : BorderRadius.circular(12),
        ),
        animationDuration: const Duration(milliseconds: 200),
      ),
      onPressed: onPressed,
      child: textChild,
    );
  }
}
