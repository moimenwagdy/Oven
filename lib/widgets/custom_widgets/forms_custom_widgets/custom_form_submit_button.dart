import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';

class FormSubmitButtom extends StatelessWidget {
  final Widget textChild;
  final VoidCallback? onPressed;
  const FormSubmitButtom({super.key, required this.textChild, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: lighterPrimary,
        overlayColor: Theme.of(context).colorScheme.onPrimary,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        animationDuration: const Duration(milliseconds: 200),
      ),
      onPressed: onPressed,
      child: textChild,
    );
  }
}
