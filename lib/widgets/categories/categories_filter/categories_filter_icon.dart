import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/utils/constants/percentages_of_screen_heights.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/categories/categories_filter/categories_filter_list.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class CategoriesFilterIcon extends ConsumerWidget {
  const CategoriesFilterIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final selectedIds = ref.watch(mainCategoryFilterProvider);
    // final isActive = selectedIds.isNotEmpty;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 10,
        children: [
          GestureDetector(
            onTap: () => showMainCategoryFilterSheet(context),
            child: Stack(
              alignment: AlignmentGeometry.topRight,
              children: [
                Container(
                  height:
                      context.screenHeight *
                      ScreenHeightsByPercentage.productsPageCategoriesSection *
                      .08,
                  width: 60,
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: FormSubmitButtom(
                    onPressed: () {
                      showMainCategoryFilterSheet(context);
                    },
                    textChild: Text(
                      context.l10n.filter,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
