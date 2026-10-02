import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_categories_provider.dart';
import 'package:oven/providers/categories_provider/selected_category_provider.dart';
import 'package:oven/providers/categories_provider/sub_categories_provider.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/categories/categories_subcategories_wraper.dart';

class CategoryWithDirectProductChildList extends ConsumerWidget {
  final List<MapEntry<MainCategory, List<SubCategory>>> chunk;
  final int chunkIndex;
  final int maxItemsPerTailColumn;
  const CategoryWithDirectProductChildList({
    super.key,
    required this.chunk,
    required this.chunkIndex,
    required this.maxItemsPerTailColumn,
  });

  @override
  Widget build(BuildContext context, ref) {
    final selectedCategoryId = ref.watch(selectedCategoryProvider);
    return SingleChildScrollView(
      child: Column(
        spacing: context.isSmallDevice ? 10 : 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final (i, entry) in chunk.indexed)
            GestureDetector(
              onTap: () => ref
                  .read(selectedCategoryProvider.notifier)
                  .selectCategory(entry.key.id),
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                margin: EdgeInsets.all(3),
                width: 115,
                height: context.isSmallDevice ? 75 : 85,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: onSurface.withValues(alpha: .1),
                      blurRadius: 2,
                      offset: Offset(0, 0),
                      spreadRadius: .5,
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Theme.of(context).colorScheme.primary
                              .withValues(alpha: context.isDarkMode ? .1 : .2),
                        ),
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                img[chunkIndex * maxItemsPerTailColumn + i],
                                alignment: Alignment.topCenter,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: selectedCategoryId == entry.key.id
                            ? Theme.of(context).colorScheme.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            entry.key.title,
                            overflow: TextOverflow.ellipsis,
                            textScaler: TextScaler.linear(.9),
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  fontSize: context.isSmallDevice ? 9 : 10,
                                  color: selectedCategoryId == entry.key.id
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
