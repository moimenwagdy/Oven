import 'package:flutter/material.dart';

class SmallSquarePrice extends StatelessWidget {
  final double price;
  const SmallSquarePrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 2,
      right: 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white.withValues(alpha: .5),
        ),
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          price.toString(),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12),
        ),
      ),
    );
  }
}
