import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/utils/helpers/initial_location_based_on_updated_needed.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/not_logged_in_card.dart';
import 'package:oven/widgets/home_page_widgets/home_page_favorites/home_page_favorite_items.dart';
import 'package:oven/widgets/home_page_widgets/home_page_image_slider/images_slider.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';
import 'package:oven/widgets/custom_items_list_with_header/custom_items_list_with_header.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();

    _checkForUpdate();
  }

  Future<void> _checkForUpdate() async {
    debugPrint('UPDATE: check started');
    final availableUpdate = await isUpdateAvailable();
    debugPrint('UPDATE: result = $availableUpdate');

    if (!mounted) {
      debugPrint('UPDATE: widget unmounted before navigating');
      return;
    }

    if (availableUpdate != null) {
      try {
        context.goNamed(
          'update',
          queryParameters: {
            'oldVersion': availableUpdate.oldVersion,
            'newVersion': availableUpdate.newVersion.toString(),
          },
        );
        debugPrint('UPDATE: navigated');
      } catch (e, st) {
        debugPrint('UPDATE: navigation failed: $e\n$st');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = ref.watch(
      currentSessionProvider.select((session) => session != null),
    );

    final productsList = context.isArabic ? arabicProducts : englishProducts;

    return SingleChildScrollView(
      child: Column(
        children: [
          const ImageSlidingAnnouncment(),
          const SizedBox(height: 20),

          if (!isLoggedIn) NotLoggedInCard(),
          if (isLoggedIn) const HomePageFavoriteItems(),

          const SizedBox(height: 20),

          CustomItemsListWithHeader(
            header: context.l10n.mostOrderedTab,
            itemsList: productsList.sublist(0, 15),
            color: Theme.of(context).colorScheme.onPrimary,
            activefavoriteStyle: true,
            specialStyle: false,
          ),

          const SizedBox(height: 20),

          CustomItemsListWithHeader(
            header: context.l10n.othersFavroiteTab,
            itemsList: productsList.sublist(15, 30),
            color: Theme.of(
              context,
            ).colorScheme.onSecondaryFixed.withValues(alpha: .1),
            activefavoriteStyle: false,
            specialStyle: false,
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
