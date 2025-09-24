import 'package:flutter/material.dart';
import 'package:oven/widgets/home_page_widgets/home_most_ordered/home_most_ordered_item.dart';

class HomeMostOrderedItems extends StatelessWidget {
  const HomeMostOrderedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) => HomeMostOrderedItem(),
    );
  }
}
