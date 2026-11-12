import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_categories_provider.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_category_filter/maincategory_filter.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_category_filter/marked_maincategory.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/categories/categories_filter/categories_filter_list_item.dart';
import 'package:oven/widgets/categories/categories_filter/select_all_checkbox_listile.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

void showMainCategoryFilterSheet(BuildContext context) {
  final container = ProviderScope.containerOf(context);
  container
      .read(markSelectedMaincategoryProvider.notifier)
      .set(container.read(mainCategoryFilterProvider));

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) => const _MainCategoryFilterSheet(),
  );
}

class _MainCategoryFilterSheet extends ConsumerWidget {
  const _MainCategoryFilterSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainCategoriesAsync = ref.watch(mainCategoriesProvider);
    final markedIds = ref.watch(markSelectedMaincategoryProvider);

    return SafeArea(
      child: DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      context.l10n.filterByCategory,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: markedIds.isEmpty
                        ? null
                        : () => ref
                              .read(markSelectedMaincategoryProvider.notifier)
                              .clear(),
                    child: Text(context.l10n.clear),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: mainCategoriesAsync.when(
                data: (mainCategories) => ListView(
                  controller: scrollController,
                  children: [
                    SelectAllCheckboxListile(
                      mainCategoriesLength: mainCategories.length,
                    ),
                    for (final category in mainCategories)
                      CategoriesFilterListItem(
                        key: ValueKey(category.id),
                        category: category,
                      ),
                  ],
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: 120,
              height: 40,
              child: FormSubmitButtom(
                textChild: Text(
                  "Filter",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                onPressed: () {
                  final selectedList = ref.read(
                    markSelectedMaincategoryProvider,
                  );
                  ref
                      .read(mainCategoryFilterProvider.notifier)
                      .set(selectedList);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
