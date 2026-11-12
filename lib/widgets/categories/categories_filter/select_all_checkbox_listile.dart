import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_category_filter/marked_maincategory.dart';

class SelectAllCheckboxListile extends ConsumerWidget {
  final int mainCategoriesLength;
  const SelectAllCheckboxListile({
    super.key,
    required this.mainCategoriesLength,
  });

  @override
  Widget build(BuildContext context, ref) {
    final markedIds = ref.watch(markSelectedMaincategoryProvider);

    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text("Select all", style: Theme.of(context).textTheme.labelLarge),
      value: markedIds.length == mainCategoriesLength,
      onChanged: (_) {
        final notifier = ref.read(markSelectedMaincategoryProvider.notifier);
        if (markedIds.length == mainCategoriesLength) {
          notifier.clear();
          return;
        }
        notifier.selectAll();
      },
    );
  }
}
