import 'package:flutter/material.dart';

class SmallSquareImage extends StatelessWidget {
  const SmallSquareImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: Image.asset("lib/assets/Cakes3-2.webp"),
    );
  }
}
