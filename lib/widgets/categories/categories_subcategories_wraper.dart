import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_categories_provider.dart';
import 'package:oven/providers/categories_provider/selected_category_provider.dart';
import 'package:oven/providers/categories_provider/sub_categories_provider.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/categories/category.dart';

class CategoriesSubcategoriesWraper extends ConsumerWidget {
  final MapEntry<MainCategory, List<SubCategory>> entry;
  const CategoriesSubcategoriesWraper({super.key, required this.entry});

  @override
  Widget build(BuildContext context, ref) {
    final selectedCategoryId = ref.watch(selectedCategoryProvider);

    return Container(
      color: Theme.of(context).colorScheme.onPrimary,
      height: context.isSmallDevice ? 230 : 320,
      child: Wrap(
        textDirection: TextDirection.rtl,
        runSpacing: 5,
        spacing: 5,
        direction: Axis.vertical,
        children: List.generate(entry.value.length, (index) {
          final item = entry.value[index];
          return SizedBox(
            width: context.isSmallDevice ? 103 : 113,
            height: context.isSmallDevice ? 70 : 73,
            child: CategoryItem(
              title: item.name,
              currentIndex: index,
              imgUrl: img[index], // or whatever image source you use
              isSelectedCategory: selectedCategoryId == item.id,
              onTap: () {
                ref
                    .read(selectedCategoryProvider.notifier)
                    .selectCategory(item.id);
              },
            ),
          );
        }),
      ),
    );
  }
}

final img = [
  "lib/assets/tart2.png",
  "lib/assets/tart3.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart.png",
  "lib/assets/tart.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart.png",
  "lib/assets/tart.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart.png",
  "lib/assets/tart2.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart.png",
  "lib/assets/tart2.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart3.png",
  "lib/assets/tart3.png",
];
