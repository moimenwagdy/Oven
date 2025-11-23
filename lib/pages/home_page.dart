import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/home_page_widgets/home_page_favorites/home_page_favorite_items.dart';
import 'package:oven/widgets/home_page_widgets/home_page_image_slider/images_slider.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';
import 'package:oven/widgets/sugestions_items_widget/custom_list_with_header.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageSlidingAnnouncment(),
          SizedBox(height: 10),
          HomePageFavoriteItems(),
          SizedBox(height: 10),
          CustomListWithHeader(
            header: context.l10n.mostOrderedTab,
            itemsList: context.isArabic
                ? arabicProducts.sublist(0, 15)
                : englishProducts.sublist(0, 15),
            color: Theme.of(context).colorScheme.onPrimary,
            activefavoriteStyle: true,
            specialStyle: false,
          ),
          CustomListWithHeader(
            header: context.l10n.othersFavroiteTab,
            itemsList: context.isArabic
                ? arabicProducts.sublist(15, 30)
                : englishProducts.sublist(15, 30),
            color: Theme.of(context).colorScheme.onSecondaryFixed,
            activefavoriteStyle: false,
            specialStyle: false,
          ),

          CustomListWithHeader(
            header: "Style Test",
            itemsList: context.isArabic
                ? arabicProducts.sublist(30, 45)
                : englishProducts.sublist(30, 45),
            color: Theme.of(context).colorScheme.onSecondaryFixed,
            activefavoriteStyle: false,
            specialStyle: true,
          ),
        ],
      ),
    );
  }
}
