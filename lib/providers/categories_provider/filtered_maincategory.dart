import 'package:oven/providers/categories_provider/categories_list_extesion/categories_list_extesion.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_categories_provider.dart';
import 'package:oven/providers/categories_provider/maincategory_filter.dart';
import 'package:oven/providers/categories_provider/sub_categories_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'filtered_maincategory.g.dart';

@riverpod
FutureOr<Map<MainCategory, List<SubCategory>>> filteredGroupedSubCategories(
  Ref ref,
) async {
  final grouped = await ref.watch(groupedSubCategoriesProvider.future);
  final filterIds = ref.watch(mainCategoryFilterProvider);

  if (filterIds.isEmpty) return grouped;

  return {
    for (final entry in grouped.entries)
      if (filterIds.contains(entry.key.id)) entry.key: entry.value,
  };
}
