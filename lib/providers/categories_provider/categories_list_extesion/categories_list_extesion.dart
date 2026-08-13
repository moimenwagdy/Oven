import 'package:oven/providers/categories_provider/main_categories_provider/main_categories_provider.dart';
import 'package:oven/providers/categories_provider/sub_categories_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'categories_list_extesion.g.dart';

@riverpod
class GroupedSubCategories extends _$GroupedSubCategories {
  @override
  FutureOr<Map<MainCategory, List<SubCategory>>> build() async {
    final subCategories = ref.watch(categoriesProvider).value ?? [];
    final mainCategories = ref.watch(mainCategoriesProvider).value ?? [];
    return {
      for (final mainCat in mainCategories)
        mainCat: subCategories
            .where((sub) => sub.mainCategory.id == mainCat.id)
            .toList(),
    };
  }
}
