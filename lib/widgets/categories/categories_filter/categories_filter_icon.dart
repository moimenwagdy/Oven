import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/categories_provider/maincategory_filter.dart';
import 'package:oven/widgets/categories/categories_filter/categories_filter_list.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class CategoriesFilterIcon extends ConsumerWidget {
  const CategoriesFilterIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIds = ref.watch(mainCategoryFilterProvider);
    final isActive = selectedIds.isNotEmpty;

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
                  width: 50,
                  color: Colors.transparent,
                  child: FormSubmitButtom(
                    onPressed: () {
                      showMainCategoryFilterSheet(context);
                    },
                    textChild: Text(
                      "Filter",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    // Icons.filter_alt_rounded,
                    // size: 20,
                    // color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                if (isActive)
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
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
