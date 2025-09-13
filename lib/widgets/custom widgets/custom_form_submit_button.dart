import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';

class FormSubmitButtom extends StatelessWidget {
  final Widget textChild;
  final VoidCallback? onPressed;
  const FormSubmitButtom({
    super.key,
    required this.textChild,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(220, 50),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: lighterPrimary,
        overlayColor: Theme.of(context).colorScheme.onPrimary,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: BorderSide(
          color: onPressed != null
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onPrimary,
          width: 1,
        ),
        animationDuration: const Duration(milliseconds: 200),
      ),

      onPressed: onPressed,
      child: textChild,
    );
  }
}
