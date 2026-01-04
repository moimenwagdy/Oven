import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_category_provider.g.dart';

@riverpod
class SelectedCategoryNotifier extends _$SelectedCategoryNotifier {
  @override
  int build() => 0;

  void selectCategory(int index) => state = index;
}
