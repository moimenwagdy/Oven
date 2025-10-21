import 'package:flutter/material.dart';

class AlignedText extends StatelessWidget {
  final String text;
  const AlignedText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "- ",
          style: Theme.of(
            context,
          ).textTheme.labelSmall?.copyWith(fontFamily: "Poppins"),
        ),
        Expanded(
          child: Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(fontFamily: "Poppins"),
          ),
        ),
      ],
    );
  }
}
