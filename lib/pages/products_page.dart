import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/categories/categories.dart';
import 'package:oven/widgets/products_page_widgets/products_page_items.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            toolbarHeight: 200,
            backgroundColor: Colors.white,
            elevation: 0,
            pinned: false,
            floating: false,
            expandedHeight: context.isSmallDevice ? 310 : 360,
            flexibleSpace: const Categories(),
          ),
        ],
        body: const ProductsPageItems(),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:oven/widgets/home_page_widgets/home_most_ordered/home_most_ordered_items.dart';
// import 'package:oven/widgets/home_page_widgets/home_page_categories/categories.dart';

// class ProductsPage extends StatelessWidget {
//   const ProductsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(child: Categories()),
//         Expanded(child: HomeMostOrderedItems()),
//       ],
//     );
//   }
// }
