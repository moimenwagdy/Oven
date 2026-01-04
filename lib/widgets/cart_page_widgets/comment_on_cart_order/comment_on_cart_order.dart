import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class CommentOnCartOrder extends StatelessWidget {
  final TextEditingController controller;
  const CommentOnCartOrder({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          maxLines: 12,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: context.isArabic
                ? "قم بإضافة التعليق هنا ..."
                : 'Enter your comment here...',
            hintStyle: Theme.of(context).textTheme.bodySmall,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
