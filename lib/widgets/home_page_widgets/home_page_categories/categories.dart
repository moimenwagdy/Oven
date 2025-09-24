import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/home_page_widgets/home_page_categories/category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: context.isSmallDevice ? 250 : 450,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.isSmallDevice ? 3 : 4,
                crossAxisSpacing: context.isSmallDevice ? 20 : 25,
                mainAxisSpacing: context.isSmallDevice ? 15 : 20,
                childAspectRatio: 1,
              ),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              itemCount: 22,
              itemBuilder: (context, index) {
                return CategoryItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
