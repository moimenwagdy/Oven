import 'package:oven/models/manager_summary.dart';
import 'package:oven/providers/authentication_provider/managed_branch.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'expand_collapse_reset_manager_provider.g.dart';

const _scope = BranchSelectionScope.reset;

@Riverpod(keepAlive: true)
class ExpandCollpseResetManager extends _$ExpandCollpseResetManager {
  @override
  Set<String> build() => {};

  Set<String> initialState() {
    final managersAsync = ref.watch(branchManagersProvider(_scope));
    final visibleManagers = managersAsync.value ?? const <ManagerSummary>[];
    final ids = visibleManagers.map((ele) => ele.id).toSet();
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
