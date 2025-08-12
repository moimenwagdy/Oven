import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';

class FormSubmitButtom extends StatelessWidget {
  final Widget textChild;
  final VoidCallback onPressed;
  const FormSubmitButtom({
    super.key,
    required this.textChild,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(300, 60),
        backgroundColor: primary,
        foregroundColor: lighterPrimary,
        overlayColor: Colors.white,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: const BorderSide(color: primary, width: 1),
        animationDuration: const Duration(milliseconds: 200),
      ),

      onPressed: onPressed,
      child: textChild,
    );
  }
}
