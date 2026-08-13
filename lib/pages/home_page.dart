import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/home_page_widgets/home_page_favorites/home_page_favorite_items.dart';
import 'package:oven/widgets/home_page_widgets/home_page_image_slider/images_slider.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';
import 'package:oven/widgets/custom_items_list_with_header/custom_items_list_with_header.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final loggedIn = ref.watch(fakeAuthProvider).value;
    return SingleChildScrollView(
      child: Column(
        children: [
          if (loggedIn != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    loggedIn.name,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          const ImageSlidingAnnouncment(),
          const SizedBox(height: 20),
          const HomePageFavoriteItems(),
          const SizedBox(height: 20),
          CustomItemsListWithHeader(
            header: context.l10n.mostOrderedTab,
            itemsList: englishProducts.sublist(0, 15),
            color: Theme.of(context).colorScheme.onPrimary,
            activefavoriteStyle: true,
            specialStyle: false,
          ),
          const SizedBox(height: 20),
          CustomItemsListWithHeader(
            header: context.l10n.othersFavroiteTab,
            itemsList: englishProducts.sublist(15, 30),
            color: Theme.of(
              context,
            ).colorScheme.onSecondaryFixed.withValues(alpha: .1),
            activefavoriteStyle: false,
            specialStyle: false,
          ),
        ],
      ),
    );
  }
}
