import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pop_provider.g.dart';

@riverpod
class NavigationIndex extends _$NavigationIndex {
  @override
  int build() => 0;

  void setNavigationIndex(int index) => state = index;
}
