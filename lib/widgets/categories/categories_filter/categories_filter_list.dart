import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_categories_provider.dart';
import 'package:oven/providers/categories_provider/maincategory_filter.dart';

void showMainCategoryFilterSheet(BuildContext context) {
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
    final selectedIds = ref.watch(mainCategoryFilterProvider);

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
                  const Expanded(
                    child: Text(
                      'Filter by category',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: selectedIds.isEmpty
                        ? null
                        : () => ref
                              .read(mainCategoryFilterProvider.notifier)
                              .clear(),
                    child: const Text('Clear'),
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
                    for (final cat in mainCategories)
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          cat.title,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        value: selectedIds.contains(cat.id),
                        onChanged: (_) => ref
                            .read(mainCategoryFilterProvider.notifier)
                            .toggle(cat.id),
                      ),
                  ],
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
