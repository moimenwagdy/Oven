import 'package:flutter/material.dart';
import 'package:oven/widgets/cart_page_widgets/cart_counts/cart_counts.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items/cart_item.dart';
import 'package:oven/widgets/sugestions_items_widget/suggestions_widget_items.dart';

class CartItems extends StatefulWidget {
  const CartItems({super.key});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  late final List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(10, (_) => TextEditingController(text: "0"));
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                spacing: 5,
                children: List.generate(10, (index) {
                  return CartItem(controller: _controllers[index]);
                }),
              ),
              Column(
                spacing: 5,
                children: List.generate(3, (index) {
                  return CartItem(controller: _controllers[index]);
                }),
              ),
              SizedBox(height: 145, child: SuggestionsWidgetItems()),
              CartCounts(),
            ],
          ),
        ),
      ),
    );
  }
}
