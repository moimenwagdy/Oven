import 'package:oven/providers/managers_provider/manager_assignment_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'expand_collapse_edit_manager_screen_proivder.g.dart';

@Riverpod(keepAlive: true)
class ExpandCollapseEditManagerScreen
    extends _$ExpandCollapseEditManagerScreen {
  @override
  Set<String> build() => initialState();

  Set<String> initialState() {
    final managersAsync = ref.watch(visibleAssignableManagersProvider).value;
    final ids = managersAsync?.map((ele) => ele.id).toSet() ?? {};
    return ids;
  }

  void toggleItem(String id) {
    if (state.contains(id)) {
      state = {...state}..remove(id);
    } else {
      state = {...state, id};
    }
  }

  void expandAll() {
    state = initialState();
  }

  void collapseAll() {
    state = {};
  }

  void toggleAll() {
    state = state.isEmpty ? initialState() : {};
  }

  bool isExpanded(String id) => state.contains(id);
}
