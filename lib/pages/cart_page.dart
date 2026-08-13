import 'package:flutter/material.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items_section.dart';
import 'package:oven/widgets/cart_page_widgets/cart_options_section.dart';
import 'package:oven/widgets/cart_page_widgets/cart_sugessions_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: const [
              CartItemsSection(),
              SizedBox(height: 10),
              CartListSuggesionsList(),
              CartOptionsSection(),
            ],
          ),
        ),
      ],
    );
  }
}
