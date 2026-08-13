import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/categories_provider/maincategory_filter.dart';
import 'package:oven/widgets/categories/categories_filter/categories_filter_icon.dart';
import 'package:oven/widgets/categories/categories_filter/selected_categories.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class CategoriesFilterContainer extends ConsumerWidget {
  const CategoriesFilterContainer({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isNotEmpty = ref.watch(mainCategoryFilterProvider).isNotEmpty;
    return Container(
      color: isNotEmpty
          ? Theme.of(context).colorScheme.primary.withValues(alpha: .08)
          : null,
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
              width: 50,
              height: 20,
              child: FormSubmitButtom(
                textChild: Text(
                  "Clear",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                onPressed: () =>
                    ref.read(mainCategoryFilterProvider.notifier).clear(),
              ),
            ),
        ],
      ),
    );
  }
}
