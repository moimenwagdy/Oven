import 'package:oven/providers/categories_provider/main_categories_provider/main_categories_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'marked_maincategory.g.dart';

// 1. Holds the selected main category ids. Empty = no filter.
@Riverpod(keepAlive: true)
class MarkSelectedMaincategory extends _$MarkSelectedMaincategory {
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
