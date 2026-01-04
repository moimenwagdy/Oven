import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/categories_provider/categories_provider.dart';
import 'package:oven/providers/categories_provider/selected_category_provider.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/categories/categories.dart';
import 'package:oven/widgets/products_page_widgets/fade_out_screen_on_categories_section.dart';
import 'package:oven/widgets/products_page_widgets/products_page_list.dart';
import 'package:oven/widgets/products_page_widgets/selected_category_tile_placeholder.dart';
import 'package:oven/widgets/products_page_widgets/selected_category_title.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
  
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        physics: SnapScrollPhysics(
          expandedHeight: context.isSmallDevice ? 305.0 : 355.0,
        ),
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            toolbarHeight: 200,
            elevation: 0,
            backgroundColor: colorScheme.onPrimary,
            pinned: false,
            floating: false,
            expandedHeight: context.isSmallDevice ? 305 : 355,
            flexibleSpace: Stack(
              children: [
                const Categories(),
                FadeOutScreenOnCategoriesSection(
                  scrollControler: _scrollController,
                ),
              ],
            ),
          ),
        ],
        body: Column(
          children: [
            const SizedBox(height: 5),
            Consumer(
              builder: (context, ref, child) {
                final index = ref.watch(selectedCategoryProvider);
                final categoriesList = ref.watch(categoriesProvider);
                return categoriesList.when(
                  data: (categories) {
                    return SelectedCategoryTitle(
                      title: categories[index].slug,
                      imgUrl: img[index],
                    );
                  },
                  loading: () => const SelectedCategoryTilePlaceholder(),
                  error: (error, stackTrace) => Text("$error"),
                );
              },
            ),
            const SizedBox(height: 5),
            const ProductsPageList(),
          ],
        ),
      ),
    );
    // );
  }
}

class SnapScrollPhysics extends ClampingScrollPhysics {
  final double expandedHeight;
  const SnapScrollPhysics({required this.expandedHeight, super.parent});
  @override
  SnapScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SnapScrollPhysics(
      expandedHeight: expandedHeight,
      parent: buildParent(ancestor),
    );
  }

  double get snapOffset {
    final expanded = expandedHeight;
    const toolbar = 0.0;
    return expanded - toolbar;
  }

  @override
  Simulation? createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
    final current = position.pixels;

    if (position.pixels <= position.minScrollExtent) {
      return null;
    }

    // Disable snapping 5px before reaching the top
    if (position.pixels <= position.minScrollExtent + 5) {
      return null;
    }

    // Disable snapping 5px before reaching the bottom
    if (position.pixels >= position.maxScrollExtent - 5) {
      return null;
    }

    // When the user is scrolling DOWN
    if (velocity > 0) {
      return ScrollSpringSimulation(
        const SpringDescription(mass: 1, stiffness: 100, damping: 20),
        current,
        snapOffset, // always go down
        velocity,
      );
    }

    // When the user is scrolling UP
    if (velocity < 0) {
      return ScrollSpringSimulation(
        const SpringDescription(mass: 1, stiffness: 100, damping: 20),
        current,
        0, // always collapse when scrolling up
        velocity,
      );
    }

    // If user stops → fallback to your distance logic
    final target = current < snapOffset / 2 ? 0.0 : snapOffset;

    return ScrollSpringSimulation(
      const SpringDescription(mass: 1, stiffness: 100, damping: 20),
      current,
      target,
      velocity,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:oven/notifires/categories_notifier.dart';
// import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
// import 'package:oven/widgets/categories/categories.dart';
// import 'package:oven/widgets/products_page_widgets/products_page_items.dart';
// import 'package:oven/widgets/products_page_widgets/selected_category_title.dart';

// class ProductsPage extends StatelessWidget {
//   const ProductsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: NestedScrollView(

//         headerSliverBuilder: (context, innerBoxIsScrolled) => [
//           SliverAppBar(
//             toolbarHeight: 200,
//             elevation: 0,
//             backgroundColor: Theme.of(context).colorScheme.onPrimary,
//             pinned: false,
//             floating: false,
//             expandedHeight: context.isSmallDevice ? 310 : 360,
//             flexibleSpace: AnimatedContainer(
//               duration: const Duration(milliseconds: 200),
//               color: innerBoxIsScrolled
//                   ? Theme.of(context).colorScheme.primary
//                   : Colors.transparent,
//               child: const Categories(),
//             ),
//           ),
//         ],
//         body: RefreshIndicator(
//           onRefresh: () async => {},
//           child: Column(
//             children: [
//               ValueListenableBuilder(
//                 valueListenable: selectedCategory,
//                 builder: (context, value, child) => value != ""
//                     ? SelectedCategoryTitle(title: value)
//                     : SizedBox.shrink(),
//               ),
//               Expanded(child: ProductsPageItems()),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
