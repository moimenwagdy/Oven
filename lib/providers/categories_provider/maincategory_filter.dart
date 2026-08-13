import 'package:oven/providers/categories_provider/main_categories_provider/main_categories_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'maincategory_filter.g.dart';

// 1. Holds the selected main category ids. Empty = no filter.
@riverpod
class MainCategoryFilter extends _$MainCategoryFilter {
  @override
  List<String> build() => [];

  void toggle(String id) {
    state = state.contains(id)
        ? state.where((e) => e != id).toList()
        : [...state, id];
  }

  void selectAll() {
    state = mainCatsList.map((ele) => ele.id).toList();
  }

  void set(List<String> ids) => state = ids;

  void clear() => state = [];
}
