import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/categories_provider/sub_categories_provider.dart';
import 'package:oven/providers/categories_provider/selected_category_provider.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/categories/categories.dart';
import 'package:oven/widgets/categories/categories_filter/categories_filter_container.dart';
import 'package:oven/widgets/categories/categories_filter/categories_filter_icon.dart';
import 'package:oven/widgets/products_page_widgets/fade_out_screen_on_categories_section.dart';
import 'package:oven/widgets/products_page_widgets/products_page_list.dart';
import 'package:oven/widgets/products_page_widgets/selected_category_tile_placeholder.dart';
import 'package:oven/widgets/products_page_widgets/selected_category_title.dart';

class ProductsPage extends ConsumerStatefulWidget {
  const ProductsPage({super.key});

  @override
  ConsumerState<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends ConsumerState<ProductsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final categoriesList = ref.watch(categoriesProvider);
    final selectedCategoryId = ref.watch(selectedCategoryProvider);
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        physics: SnapScrollPhysics(
          expandedHeight: context.isSmallDevice ? 305.0 : 395.0,
        ),
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            toolbarHeight: context.isSmallDevice ? 200 : 320,
            elevation: 0,
            backgroundColor: colorScheme.onPrimary,
            pinned: false,
            floating: false,
            expandedHeight: context.isSmallDevice ? 305 : 395,
            flexibleSpace: Column(
              children: [
                SizedBox(height: 25, child: CategoriesFilterContainer()),
                Expanded(
                  child: Stack(
                    children: [
                      const Categories(),
                      FadeOutScreenOnCategoriesSection(
                        scrollControler: _scrollController,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        body: Column(
          children: [
            if (!context.isSmallDevice) const SizedBox(height: 5),
            categoriesList.when(
              data: (categories) {
                final item = categories.firstWhere(
                  (ele) => ele.id == selectedCategoryId,
                );
                return SelectedCategoryTitle(title: item.name, imgUrl: img[6]);
              },
              loading: () => const SelectedCategoryTilePlaceholder(),
              error: (error, stackTrace) => Text("$error"),
            ),
            if (!context.isSmallDevice) const SizedBox(height: 5),
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
