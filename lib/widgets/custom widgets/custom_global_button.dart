import 'package:flutter/material.dart';

class CustomGlobalButton extends StatelessWidget {
  final Object child;
  final VoidCallback onPressed;

  const CustomGlobalButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Widget buttonChild;

    if (child is String) {
      buttonChild = Text(
        child as String,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      );
    } else if (child is Widget) {
      buttonChild = child as Widget;
    } else {
      throw ArgumentError(
        'CustomGlobalButton child must be either a String or a Widget',
      );
    }
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        side: BorderSide(color: Theme.of(context).colorScheme.primary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      onPressed: onPressed,
      child: buttonChild,
    );
  }
}
