import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_categories_provider.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_category_filter/marked_maincategory.dart';

class CategoriesFilterListItem extends ConsumerWidget {
  final MainCategory category;
  const CategoriesFilterListItem({super.key, required this.category});

  @override
  Widget build(BuildContext context, ref) {
    final markedIds = ref.watch(markSelectedMaincategoryProvider);

    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        category.title,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      value: markedIds.contains(category.id),
      onChanged: (_) => ref
          .read(markSelectedMaincategoryProvider.notifier)
          .toggle(category.id),
    );
  }
}
