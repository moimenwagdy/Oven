import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/models/auth_session.dart';
import 'package:oven/models/branch.dart';
import 'package:oven/models/manager_role.dart';
import 'package:oven/models/organization_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:oven/models/trademark.dart';
import 'current_session_provider.dart';
import 'package:oven/models/manager_summary.dart';
part 'manager_access_provider.g.dart';

/// The role of the logged-in manager. Null for personal users or no session.
/// It watches only the manager id, so changing the personal location
/// does not refetch it.
@riverpod
Future<ManagerRole?> managerRole(Ref ref) async {
  final managerId = ref.watch(
    currentSessionProvider.select((s) => s is ManagerSession ? s.id : null),
  );
  if (managerId == null) return null;

  return ref.watch(organizationRepositoryProvider).getRole(managerId);
}

/// The branches this manager can deliver from. Empty for personal users.
@Riverpod(keepAlive: true)
Future<List<Branch>> accessibleBranches(Ref ref) async {
  // Read the repository before the await: no `ref` use after the gap.
  final repository = ref.watch(organizationRepositoryProvider);
  final role = await ref.watch(managerRoleProvider.future);
  if (role == null) return <Branch>[];

  return repository.getBranches(role);
}

/// The trademark of the logged-in manager. Null for personal users and
/// managers with no access.
@riverpod
Future<TradeMark?> currentTrademark(Ref ref) async {
  final repository = ref.watch(organizationRepositoryProvider);
  final role = await ref.watch(managerRoleProvider.future);

  final trademarkId = switch (role) {
    TrademarkAdminRole r => r.trademarkId,
    TrademarkManagerRole r => r.trademarkId,
    BranchManagerRole r => r.trademarkId,
    NoAccessRole() || null => null,
  };
  if (trademarkId == null) return null;

  return repository.getTrademark(trademarkId);
}

/// Report access belongs to the trademark admin only. Screens check this
/// and never compare ids themselves.
@riverpod
bool canViewReports(Ref ref) =>
    ref.watch(managerRoleProvider).value is TrademarkAdminRole;

/// Branch managers of every branch of the logged-in manager's trademark.
/// Empty for personal users and managers with no access.
@riverpod
Future<List<ManagerSummary>> trademarkBranchManagers(Ref ref) async {
  // Read before the await.
  final repository = ref.watch(organizationRepositoryProvider);
  final trademark = await ref.watch(currentTrademarkProvider.future);
  if (trademark == null) return const <ManagerSummary>[];

  return repository.getTrademarkBranchManagers(trademark.id);
}
