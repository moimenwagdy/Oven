import 'package:flutter/material.dart';
import 'package:oven/widgets/home_page_widgets/home_page_categories/categories.dart';
import 'package:oven/widgets/home_page_widgets/home_most_ordered/home_most_ordered_items.dart';
import 'package:oven/widgets/home_page_widgets/home_page_favorites/home_page_favorite_items.dart';

class HomeTabsView extends StatelessWidget {
  final TabController tabController;

  const HomeTabsView({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: TabBarView(
          controller: tabController,
          children: [
            HomeMostOrderedItems(),
            HomePageFavoriteItems(),
            Categories(),
          ],
        ),
      ),
    );
  }
}
