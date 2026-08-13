import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_categories_provider.dart';
import 'package:oven/providers/categories_provider/maincategory_filter.dart';

class SelectedCategories extends ConsumerWidget {
  const SelectedCategories({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final filteredIds = ref.watch(mainCategoryFilterProvider);
    final filteredCategories = mainCatsList.where(
      (ele) => filteredIds.contains(ele.id),
    );

    return Row(
      spacing: 2.5,
      children: [
        for (final category in filteredCategories)
          GestureDetector(
            onTap: () => ref
                .read(mainCategoryFilterProvider.notifier)
                .toggle(category.id),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 2.5),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: .04),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                spacing: 2.5,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category.title,
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(fontSize: 12),
                  ),
                  SizedBox(
                    width: 18,
                    height: 18,
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () => ref
                          .read(mainCategoryFilterProvider.notifier)
                          .toggle(category.id),
                      icon: Icon(Icons.close, size: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
