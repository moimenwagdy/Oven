// For AsyncValue.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/models/branch.dart';
import 'package:oven/models/manager_summary.dart';
import 'package:oven/models/organization_provider.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/providers/current_session_provider/manager_access_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'managed_branch.g.dart';

/// Which screen a branch selection belongs to. Every screen has its own
/// selection, and it starts fresh each time the screen is opened.
enum BranchSelectionScope {
  /// Reset manager list: starts with every branch ticked.
  reset,

  /// Delete manager list: starts with every branch ticked.
  delete,

  /// Add manager invitation: starts with no branch ticked, because access
  /// is granted by an explicit choice, never by a default.
  invite,
  assign,
}

/// The branches ticked on one screen.
/// Null means "not touched yet": the scope's default applies.
/// Not keepAlive: leaving the screen drops its ticks.
@Riverpod(keepAlive: true)
class ManagedBranchesSelection extends _$ManagedBranchesSelection {
  @override
  Set<String>? build(BranchSelectionScope scope) {
    // A different user must not inherit the previous user's ticks.
    ref.watch(currentUserIdProvider);
    return null;
  }

  /// Every accessible branch id. This reads the source provider and never
  /// `managedBranchIdsProvider`: that one depends on this notifier, so
  /// reading it from here is a circular dependency.
  Set<String> _allIds() {
    final branches =
        ref.read(accessibleBranchesProvider).value ?? const <Branch>[];
    return {for (final b in branches) b.id};
  }

  void toggle(String branchId) {
    final allIds = _allIds();
    final untouched = scope == BranchSelectionScope.invite
        ? <String>{}
        : allIds;
    final current = state ?? untouched;
    final next = {...current.intersection(allIds)};
    if (!next.remove(branchId)) next.add(branchId);
    state = next; // replaced, never mutated
  }

  void selectAll() => state = _allIds();

  void clearAll() => state = <String>{};
}

/// The branch ids currently selected on one screen: the ticks (limited to
/// branches that are still accessible), or the scope's default if nothing
/// was touched yet.
@riverpod
Set<String> managedBranchIds(Ref ref, BranchSelectionScope scope) {
  final branches =
      ref.watch(accessibleBranchesProvider).value ?? const <Branch>[];
  final allIds = {for (final b in branches) b.id};

  // A manager with exactly one branch has no choice to make.
  if (allIds.length == 1) return allIds;

  final picked = ref.watch(managedBranchesSelectionProvider(scope));
  if (picked == null) {
    return scope == BranchSelectionScope.invite ? <String>{} : allIds;
  }
  return picked.intersection(allIds);
}

/// Branch managers of every accessible branch, fetched once. The checkboxes
/// filter this list in memory, so ticking a branch is instant.
@riverpod
Future<List<ManagerSummary>> accessibleBranchManagers(Ref ref) async {
  // Read before the await.
  final repository = ref.watch(organizationRepositoryProvider);
  final branches = await ref.watch(accessibleBranchesProvider.future);
  if (branches.isEmpty) return const <ManagerSummary>[];

  return repository.getManagersOfBranches({for (final b in branches) b.id});
}

/// The managers shown on one list screen: the ones listed on at least one
/// branch selected on that screen, each once.
@riverpod
AsyncValue<List<ManagerSummary>> branchManagers(
  Ref ref,
  BranchSelectionScope scope,
) {
  final selected = ref.watch(managedBranchIdsProvider(scope));
  return ref
      .watch(accessibleBranchManagersProvider)
      .whenData(
        (managers) => [
          for (final m in managers)
            if (m.branchIds.any(selected.contains)) m,
        ],
      );
}
