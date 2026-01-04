import 'package:flutter/material.dart';
import 'package:oven/widgets/cart_page_widgets/cart_counts/cart_counts.dart';
import 'package:oven/widgets/cart_page_widgets/comment_on_cart_order/comment_button.dart';
import 'package:oven/widgets/cart_page_widgets/scheduled_order/scheduled_order.dart';

class CartOptionsItems extends StatelessWidget {
  const CartOptionsItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ScheduledOrder(),
        const CommentButton(),
        const CartCounts(),
      ],
    );
  }
}
