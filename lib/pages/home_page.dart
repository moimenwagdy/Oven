import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/home_page_widgets/home_page_image_slider/images_slider.dart';
import 'package:oven/widgets/home_page_widgets/home_page_search_bar/home_page_search_bar.dart';
import 'package:oven/widgets/home_page_widgets/home_page_taps/home_tabs_view.dart';
import 'package:oven/widgets/home_page_widgets/home_page_taps/home_page_taps.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomePageSearchBar(),
        ImageSlidingAnnouncment(),
        SizedBox(height: context.isSmallDevice ? 15 : 15),
        HomePageTaps(tabController: _tabController),
        SizedBox(height: context.isSmallDevice ? 15 : 15),
        HomeTabsView(tabController: _tabController),
      ],
    );
  }
}
