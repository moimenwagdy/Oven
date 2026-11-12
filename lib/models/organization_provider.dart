import 'package:oven/models/branch.dart';
import 'package:oven/models/manager_role.dart';
import 'package:oven/providers/fake_database/fake_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:oven/models/trademark.dart';
import 'package:oven/models/manager_summary.dart';
import 'package:oven/models/delivery_location_info.dart';
import 'package:oven/models/manager_assignment.dart';
part 'organization_provider.g.dart';

/// Fake backend for trademarks, branches and manager roles.
///
/// enum OrganizationError { branchNotFound, notAllowed }

enum OrganizationError { branchNotFound, notAllowed, managersWithoutBranches }

class OrganizationException implements Exception {
  final OrganizationError error;

  /// For managersWithoutBranches: the managers left without any branch.
  final List<String> managerIds;

  const OrganizationException(this.error, {this.managerIds = const []});

  @override
  String toString() => 'OrganizationException($error)';
}

extension OrganizationErrorMessage on OrganizationError {
  String get message => switch (this) {
    OrganizationError.branchNotFound => 'Branch not found',
    OrganizationError.notAllowed => 'You are not allowed to make this change',
    OrganizationError.managersWithoutBranches =>
      'Some managers now are not managing any branches. '
          'Please fix this and confirm again.',
  };
}

class OrganizationRepository {
  OrganizationRepository(this._db);
  final FakeDatabase _db;
  Future<ManagerRole> getRole(String managerId) async {
    final admin = _db.trademarks
        .where((t) => t.trademarkAdminId == managerId)
        .firstOrNull;
    if (admin != null) return TrademarkAdminRole(admin.id);
    final trademarkManager = _db.trademarks
        .where((t) => t.trademarkManagersIds.contains(managerId))
        .firstOrNull;
    if (trademarkManager != null) {
      return TrademarkManagerRole(trademarkManager.id);
    }
    final branches = _db.branches
        .where((b) => b.managerIds.contains(managerId))
        .toList();
    if (branches.isEmpty) return const NoAccessRole();
    final trademarkIds = branches.map((b) => b.trademarkId).toSet();
    if (trademarkIds.length > 1) {
      // A manager belongs to one trademark only: this is bad data.
      throw StateError('Manager $managerId has branches in several trademarks');
    }
    return BranchManagerRole(
      trademarkId: trademarkIds.first,
      branchIds: [for (final b in branches) b.id],
    );
  }

  /// The managers listed on one branch (branch-level managers only).
  /// With a real backend, the server must check that the caller may access
  /// this branch.
  /// Ids of the trademark admin and trademark managers. They are not
  /// branch managers, even when a branch lists them in `managerIds`.
  Set<String> _trademarkLevelIds(String trademarkId) {
    final trademark = _db.trademarks
        .where((t) => t.id == trademarkId)
        .firstOrNull;
    if (trademark == null) return <String>{};
    return {trademark.trademarkAdminId, ...trademark.trademarkManagersIds};
  }

  List<ManagerSummary> _summaries(Iterable<String> ids) {
    final byId = {for (final m in _db.managers) m.id: m};
    final result = <ManagerSummary>[];
    for (final id in ids) {
      final m = byId[id];
      if (m == null) continue;
      result.add(
        ManagerSummary(id: m.id, name: m.name, email: m.email, phone: m.phone),
      );
    }
    return result;
  }

  /// Branch managers of one branch. With a real backend, the server must
  /// check that the caller may access this branch.
  Future<List<ManagerSummary>> getBranchManagers(String branchId) async {
    // Simulates network time. Remove it if it gets in the way.
    await Future<void>.delayed(const Duration(milliseconds: 300));

    final branch = _db.branches.where((b) => b.id == branchId).firstOrNull;
    if (branch == null) return [];

    final excluded = _trademarkLevelIds(branch.trademarkId);
    return _summaries(branch.managerIds.where((id) => !excluded.contains(id)));
  }

  /// Branch managers of every branch of a trademark, each listed once even
  /// if they manage several branches. Trademark admin and trademark
  /// managers are left out.
  Future<List<ManagerSummary>> getTrademarkBranchManagers(
    String trademarkId,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));

    final excluded = _trademarkLevelIds(trademarkId);
    final ids = <String>{}; // keeps insertion order, each id once
    for (final branch in _db.branches.where(
      (b) => b.trademarkId == trademarkId,
    )) {
      ids.addAll(branch.managerIds.where((id) => !excluded.contains(id)));
    }
    return _summaries(ids);
  }

  Future<TradeMark?> getTrademark(String id) async {
    // Simulates network time. Remove it if it gets in the way.
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return _db.trademarks.where((t) => t.id == id).firstOrNull;
  }

  Future<List<Branch>> getBranches(ManagerRole role) async {
    // Simulates network time. Remove it if it gets in the way.
    await Future<void>.delayed(const Duration(milliseconds: 300));

    final branches = switch (role) {
      TrademarkAdminRole r => _branchesOfTrademark(r.trademarkId),
      TrademarkManagerRole r => _branchesOfTrademark(r.trademarkId),
      BranchManagerRole r =>
        _db.branches.where((b) => r.branchIds.contains(b.id)).toList(),
      NoAccessRole() => <Branch>[],
    };
    return _mainBranchFirst(branches);
  }

  /// Main branch first: it becomes the default delivery address.
  /// All branches here belong to one trademark.
  List<Branch> _mainBranchFirst(List<Branch> branches) {
    if (branches.isEmpty) return branches;
    final mainId = _db.trademarks
        .where((t) => t.id == branches.first.trademarkId)
        .map((t) => t.mainBranchId)
        .firstOrNull;
    return [
      ...branches.where((b) => b.id == mainId),
      ...branches.where((b) => b.id != mainId),
    ];
  }

  /// Changes the address of one branch. Allowed for the admin and trademark
  /// managers of the branch's trademark, and for managers listed on that
  /// branch. With the real backend, the server must enforce this too.
  Future<Branch> updateBranchLocation({
    required String managerId,
    required String branchId,
    required DeliveryLocationInfo location,
  }) async {
    // Simulates network time. Remove it if it gets in the way.
    await Future<void>.delayed(const Duration(milliseconds: 300));

    // Everything below runs without another await: check, then write.
    final role = await getRole(managerId);
    final index = _db.branches.indexWhere((b) => b.id == branchId);
    if (index == -1) {
      throw const OrganizationException(OrganizationError.branchNotFound);
    }

    final branch = _db.branches[index];
    final allowed = switch (role) {
      TrademarkAdminRole r => r.trademarkId == branch.trademarkId,
      TrademarkManagerRole r => r.trademarkId == branch.trademarkId,
      BranchManagerRole r => r.branchIds.contains(branchId),
      NoAccessRole() => false,
    };
    if (!allowed) {
      throw const OrganizationException(OrganizationError.notAllowed);
    }

    final updated = branch.copyWith(location: location);
    _db.branches[index] = updated; // replace, never mutate
    return updated;
  }

  /// Ids of the trademark admin and trademark managers. They are not branch
  /// managers, even when a branch lists them in `managerIds`.

  /// Branch managers of the given branches, each manager once, with the
  /// branches (among those given) they are listed on. The trademark admin
  /// and trademark managers are left out. With the real API, the server
  /// must check that the caller may access these branches.
  Future<List<ManagerSummary>> getManagersOfBranches(
    Set<String> branchIds,
  ) async {
    // Simulates network time. Remove it if it gets in the way.
    await Future<void>.delayed(const Duration(milliseconds: 300));

    // manager id -> the branches they are listed on (insertion ordered)
    final branchesByManager = <String, List<String>>{};
    for (final branch in _db.branches.where((b) => branchIds.contains(b.id))) {
      final excluded = _trademarkLevelIds(branch.trademarkId);
      for (final id in branch.managerIds) {
        if (excluded.contains(id)) continue;
        branchesByManager.putIfAbsent(id, () => <String>[]).add(branch.id);
      }
    }

    final managersById = {for (final m in _db.managers) m.id: m};
    final result = <ManagerSummary>[];
    for (final entry in branchesByManager.entries) {
      final m = managersById[entry.key];
      if (m == null) continue;
      result.add(
        ManagerSummary(
          id: m.id,
          name: m.name,
          email: m.email,
          phone: m.phone,
          branchIds: entry.value,
        ),
      );
    }
    return result;
  }

  Set<String> _branchIdsOf(String trademarkId) => {
    for (final b in _db.branches)
      if (b.trademarkId == trademarkId) b.id,
  };

  /// The branches an editor may act on, and their trademark. Null when the
  /// role gives no access. A manager who manages every branch of the
  /// trademark gets all of them, like a trademark manager.
  ({String trademarkId, Set<String> branchIds})? _editScope(ManagerRole role) {
    return switch (role) {
      TrademarkAdminRole r => (
        trademarkId: r.trademarkId,
        branchIds: _branchIdsOf(r.trademarkId),
      ),
      TrademarkManagerRole r => (
        trademarkId: r.trademarkId,
        branchIds: _branchIdsOf(r.trademarkId),
      ),
      BranchManagerRole r => (
        trademarkId: r.trademarkId,
        branchIds: r.branchIds.toSet(),
      ),
      NoAccessRole() => null,
    };
  }

  /// The managers the editor can change: the ones on a branch the editor can
  /// act on, plus the trademark managers. The admin is never listed.
  Future<List<ManagerAssignment>> getAssignableManagers(String editorId) async {
    // Simulates network time. Remove it if it gets in the way.
    await Future<void>.delayed(const Duration(milliseconds: 300));

    final scope = _editScope(await getRole(editorId));
    if (scope == null) return const <ManagerAssignment>[];

    final trademark = _db.trademarks
        .where((t) => t.id == scope.trademarkId)
        .firstOrNull;
    if (trademark == null) return const <ManagerAssignment>[];

    final trademarkBranches = [
      for (final b in _db.branches)
        if (b.trademarkId == scope.trademarkId) b,
    ];
    final allIds = {for (final b in trademarkBranches) b.id};
    final outsideTotal = allIds.difference(scope.branchIds).length;

    final visibleIds = <String>{};
    for (final b in trademarkBranches) {
      if (scope.branchIds.contains(b.id)) visibleIds.addAll(b.managerIds);
    }
    visibleIds.addAll(trademark.trademarkManagersIds);
    visibleIds.remove(trademark.trademarkAdminId);

    final managersById = {for (final m in _db.managers) m.id: m};
    final result = <ManagerAssignment>[];
    for (final id in visibleIds) {
      final m = managersById[id];
      if (m == null) continue;

      if (trademark.trademarkManagersIds.contains(id)) {
        result.add(
          ManagerAssignment(
            id: m.id,
            name: m.name,
            email: m.email,
            phone: m.phone,
            kind: ManagerKind.trademarkManager,
            branchIds: scope.branchIds,
            outsideScopeCount: outsideTotal,
          ),
        );
        continue;
      }

      final listed = {
        for (final b in trademarkBranches)
          if (b.managerIds.contains(id)) b.id,
      };
      result.add(
        ManagerAssignment(
          id: m.id,
          name: m.name,
          email: m.email,
          phone: m.phone,
          kind: ManagerKind.branchManager,
          branchIds: listed.intersection(scope.branchIds),
          outsideScopeCount: listed.difference(scope.branchIds).length,
        ),
      );
    }
    return result;
  }

  /// Applies every change in one batch: all of them, or none.
  /// A manager's final branches are the ones ticked plus the branches the
  /// editor cannot change that they already have. All of the trademark's
  /// branches make a trademark manager. Fewer make a branch manager of
  /// exactly those branches. None is rejected.
  /// With the real backend, the server must enforce every check here.
  Future<void> applyManagerBranchChanges({
    required String editorId,
    required List<ManagerBranchChange> changes,
  }) async {
    // Simulates network time. Remove it if it gets in the way.
    await Future<void>.delayed(const Duration(milliseconds: 300));
    final role = await getRole(editorId);

    // Everything below runs without another await: check all, then write all.
    final scope = _editScope(role);
    if (scope == null) {
      throw const OrganizationException(OrganizationError.notAllowed);
    }
    final trademark = _db.trademarks
        .where((t) => t.id == scope.trademarkId)
        .firstOrNull;
    if (trademark == null) {
      throw const OrganizationException(OrganizationError.notAllowed);
    }

    final trademarkBranches = [
      for (final b in _db.branches)
        if (b.trademarkId == trademark.id) b,
    ];
    final allIds = {for (final b in trademarkBranches) b.id};

    // 1. Check every change. Nothing is written yet.
    final plan = <_PlannedChange>[];
    final withoutBranches = <String>[];
    for (final change in changes) {
      final id = change.managerId;
      final isTrademarkManager = trademark.trademarkManagersIds.contains(id);
      final listed = {
        for (final b in trademarkBranches)
          if (b.managerIds.contains(id)) b.id,
      };
      final visible =
          isTrademarkManager || listed.any(scope.branchIds.contains);

      final allowed =
          id != editorId &&
          id != trademark.trademarkAdminId &&
          visible &&
          scope.branchIds.containsAll(change.branchIds);
      if (!allowed) {
        throw const OrganizationException(OrganizationError.notAllowed);
      }

      // The manager keeps the branches the editor cannot change. For a
      // trademark manager that is every branch outside the editor's scope,
      // which are listed explicitly once the trademark role is dropped.
      final outside = isTrademarkManager
          ? allIds.difference(scope.branchIds)
          : listed.difference(scope.branchIds);
      final finalIds = {...change.branchIds, ...outside};

      if (finalIds.isEmpty) {
        withoutBranches.add(id);
        continue;
      }
      plan.add(_PlannedChange(id, finalIds, finalIds.length == allIds.length));
    }
    if (withoutBranches.isNotEmpty) {
      throw OrganizationException(
        OrganizationError.managersWithoutBranches,
        managerIds: withoutBranches,
      );
    }

    // 2. Write. Lists are replaced with new ones, never mutated.
    final working = {
      for (final b in trademarkBranches) b.id: [...b.managerIds],
    };
    final trademarkManagers = [...trademark.trademarkManagersIds];

    for (final p in plan) {
      for (final entry in working.entries) {
        entry.value.removeWhere((id) => id == p.managerId);
        if (!p.trademarkLevel && p.branchIds.contains(entry.key)) {
          entry.value.add(p.managerId);
        }
      }
      trademarkManagers.removeWhere((id) => id == p.managerId);
      if (p.trademarkLevel) trademarkManagers.add(p.managerId);
    }

    for (var i = 0; i < _db.branches.length; i++) {
      final ids = working[_db.branches[i].id];
      if (ids != null) {
        _db.branches[i] = _db.branches[i].copyWith(managerIds: ids);
      }
    }
    final trademarkIndex = _db.trademarks.indexWhere(
      (t) => t.id == trademark.id,
    );
    _db.trademarks[trademarkIndex] = trademark.copyWith(
      trademarkManagersIds: trademarkManagers,
    );
  }

  List<Branch> _branchesOfTrademark(String trademarkId) =>
      _db.branches.where((b) => b.trademarkId == trademarkId).toList();
}

@Riverpod(keepAlive: true)
OrganizationRepository organizationRepository(Ref ref) =>
    OrganizationRepository(ref.watch(fakeDatabaseProvider));

class _PlannedChange {
  final String managerId;
  final Set<String> branchIds;
  final bool trademarkLevel;

  const _PlannedChange(this.managerId, this.branchIds, this.trademarkLevel);
}
