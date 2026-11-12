import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_category_filter/maincategory_filter.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_category_filter/marked_maincategory.dart';
import 'package:oven/utils/constants/percentages_of_screen_heights.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/categories/categories_filter/categories_filter_icon.dart';
import 'package:oven/widgets/categories/categories_filter/selected_categories.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class CategoriesFilterContainer extends ConsumerWidget {
  const CategoriesFilterContainer({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final isNotEmpty = ref.watch(mainCategoryFilterProvider).isNotEmpty;
    return Container(
      height:
          context.screenHeight *
          ScreenHeightsByPercentage.productsPageCategoriesSection *
          .12,
      // margin: const EdgeInsets.only(bottom: 5, top: 5, right: 7.5, left: 7.5),
      color: isNotEmpty
          ? Theme.of(context).colorScheme.primary.withValues(alpha: .08)
          : Colors.transparent,
      child: Row(
        children: [
          CategoriesFilterIcon(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SelectedCategories(),
            ),
          ),
          if (isNotEmpty)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height:
                  context.screenHeight *
                  ScreenHeightsByPercentage.productsPageCategoriesSection *
                  .08,
              width: 60,
              child: FormSubmitButtom(
                textChild: Text(
                  context.l10n.clear,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                onPressed: () {
                  ref.read(mainCategoryFilterProvider.notifier).clear();
                  ref.read(markSelectedMaincategoryProvider.notifier).clear;
                },
              ),
            ),
        ],
      ),
    );
  }
}
