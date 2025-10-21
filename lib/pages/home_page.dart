import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/home_page_widgets/home_most_ordered/home_most_ordered_items.dart';
import 'package:oven/widgets/home_page_widgets/home_page_favorites/home_page_favorite_items.dart';
import 'package:oven/widgets/home_page_widgets/home_page_image_slider/images_slider.dart';
import 'package:oven/widgets/home_page_widgets/home_page_middle_tabs_bar/home_page_middle_tabs_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (_currentPage != page) {
        setState(() => _currentPage = page);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ImageSlidingAnnouncment(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                HomePageMidlleTabsBar(
                  controller: _pageController,
                  currentIndex: _currentPage,
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: context.isSmallDevice ? 340 : 380,
                        minHeight: context.isSmallDevice ? 320 : 340,
                      ),
                      child: PageView(
                        controller: _pageController,
                        children: const [
                          HomePageFavoriteItems(),
                          HomeMostOrderedItems(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
