import 'package:oven/models/branch.dart';
import 'package:oven/models/manager_assignment.dart';
import 'package:oven/models/organization_provider.dart';
import 'package:oven/providers/authentication_provider/managed_branch.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/providers/current_session_provider/manager_access_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manager_assignment_provider.g.dart';

/// The managers the user can change, with their branches. Fetched once; the
/// branch picker filters it in memory.
@riverpod
Future<List<ManagerAssignment>> assignableManagers(Ref ref) async {
  // Read before the await.
  final repository = ref.watch(organizationRepositoryProvider);
  final editorId = ref.watch(currentUserIdProvider);
  if (editorId == null) return const <ManagerAssignment>[];

  // Refetch when the accessible branches change.
  await ref.watch(accessibleBranchesProvider.future);
  return repository.getAssignableManagers(editorId);
}

/// The managers on screen: the ones on at least one branch ticked in the
/// picker (a trademark manager is on all of them).
@riverpod
AsyncValue<List<ManagerAssignment>> visibleAssignableManagers(Ref ref) {
  final selected = ref.watch(
    managedBranchIdsProvider(BranchSelectionScope.assign),
  );
  return ref
      .watch(assignableManagersProvider)
      .whenData(
        (managers) => [
          for (final m in managers)
            if (m.branchIds.any(selected.contains)) m,
        ],
      );
}

bool _sameSet(Set<String> a, Set<String> b) =>
    a.length == b.length && a.containsAll(b);

/// The edited rows that are waiting for Save: manager id -> ticked branches.
/// A row that is edited back to its original state is removed.
/// Not keepAlive: leaving the screen drops the unsaved edits.
@riverpod
class ManagerAssignmentEdits extends _$ManagerAssignmentEdits {
  @override
  Map<String, Set<String>> build() {
    // A different user must not inherit the previous user's edits.
    ref.watch(currentUserIdProvider);
    return const <String, Set<String>>{};
  }

  Set<String> _original(String managerId) {
    final managers =
        ref.read(assignableManagersProvider).value ??
        const <ManagerAssignment>[];
    return managers.where((m) => m.id == managerId).firstOrNull?.branchIds ??
        <String>{};
  }

  Set<String> _scopeIds() {
    final branches =
        ref.read(accessibleBranchesProvider).value ?? const <Branch>[];
    return {for (final b in branches) b.id};
  }

  void _set(String managerId, Set<String> ticked) {
    final next = {...state};
    if (_sameSet(ticked, _original(managerId))) {
      next.remove(managerId);
    } else {
      next[managerId] = ticked;
    }
    state = next; // replaced, never mutated
  }

  void toggle(String managerId, String branchId) {
    final current = {...(state[managerId] ?? _original(managerId))};
    if (!current.remove(branchId)) current.add(branchId);
    _set(managerId, current);
  }

  /// Ticks every branch the editor can act on.
  void selectAll(String managerId) => _set(managerId, _scopeIds());

  void clearAll(String managerId) => _set(managerId, <String>{});

  /// Puts one row back to its saved state.
  void discard(String managerId) => state = {...state}..remove(managerId);
}

/// The branches ticked on one row: the edit if there is one, otherwise the
/// saved branches.
@riverpod
Set<String> tickedBranchIds(Ref ref, String managerId) {
  final edited = ref.watch(managerAssignmentEditsProvider)[managerId];
  if (edited != null) return edited;

  final managers =
      ref.watch(assignableManagersProvider).value ??
      const <ManagerAssignment>[];
  return managers.where((m) => m.id == managerId).firstOrNull?.branchIds ??
      <String>{};
}

class SaveAssignmentsResult {
  final String? errorMessage;

  /// Managers that block the save (for example, left without any branch).
  final Set<String> problemManagerIds;

  const SaveAssignmentsResult.success()
    : errorMessage = null,
      problemManagerIds = const <String>{};

  const SaveAssignmentsResult.failure(
    String message, {
    this.problemManagerIds = const <String>{},
  }) : errorMessage = message;

  bool get ok => errorMessage == null;
}

@Riverpod(keepAlive: true)
class ManagerAssignmentActions extends _$ManagerAssignmentActions {
  @override
  void build() {}

  /// Saves every edited row in one batch. All of them, or none.
  /// Saves every edited row in one batch. All of them, or none.
  Future<SaveAssignmentsResult> save() async {
    final editorId = ref.read(currentUserIdProvider);
    if (editorId == null) {
      return const SaveAssignmentsResult.failure('Not signed in');
    }

    final edits = ref.read(managerAssignmentEditsProvider);
    if (edits.isEmpty) return const SaveAssignmentsResult.success();

    // Read everything needed before the await.
    final repository = ref.read(organizationRepositoryProvider);
    final changes = [
      for (final e in edits.entries)
        ManagerBranchChange(managerId: e.key, branchIds: e.value),
    ];

    try {
      await repository.applyManagerBranchChanges(
        editorId: editorId,
        changes: changes,
      );
    } on OrganizationException catch (e) {
      return SaveAssignmentsResult.failure(
        e.error.message,
        problemManagerIds: e.managerIds.toSet(),
      );
    } catch (e) {
      return SaveAssignmentsResult.failure(e.toString());
    }

    // Saved. Refetch everything that shows who manages what. This runs
    // after the await, which is safe because this notifier is keepAlive.
    ref.invalidate(accessibleBranchManagersProvider);
    ref.invalidate(trademarkBranchManagersProvider);
    ref.invalidate(assignableManagersProvider);
    try {
      // Wait for the fresh rows before dropping the edits, so the rows do
      // not flash back to their old state.
      await ref.read(assignableManagersProvider.future);
    } catch (_) {
      // The save itself worked. The list shows its own error.
    }
    ref.invalidate(managerAssignmentEditsProvider);
    return const SaveAssignmentsResult.success();
  }
}
