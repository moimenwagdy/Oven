import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/home_page_widgets/home_page_favorites/home_page_favorite_items.dart';
import 'package:oven/widgets/home_page_widgets/home_page_image_slider/images_slider.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';
import 'package:oven/widgets/custom_items_list_with_header/custom_items_list_with_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ImageSlidingAnnouncment(),
          const SizedBox(height: 20),
          const HomePageFavoriteItems(),
          const SizedBox(height: 20),
          CustomItemsListWithHeader(
            header: context.l10n.mostOrderedTab,
            itemsList: context.isArabic
                ? arabicProducts.sublist(0, 15)
                : englishProducts.sublist(0, 15),
            color: Theme.of(context).colorScheme.onPrimary,
            activefavoriteStyle: true,
            specialStyle: false,
          ),
          const SizedBox(height: 20),
          CustomItemsListWithHeader(
            header: context.l10n.othersFavroiteTab,
            itemsList: context.isArabic
                ? arabicProducts.sublist(15, 30)
                : englishProducts.sublist(15, 30),
            color: Theme.of(context).colorScheme.onSecondaryFixed,
            activefavoriteStyle: false,
            specialStyle: false,
          ),
        ],
      ),
    );
  }
}
