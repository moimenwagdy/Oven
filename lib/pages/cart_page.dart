import 'package:flutter/material.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items/cart_items.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [CartItems()]);
  }
}
