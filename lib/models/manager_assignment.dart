enum ManagerKind { branchManager, trademarkManager }

/// A manager as the assignment screen sees them, relative to the editor.
class ManagerAssignment {
  final String id;
  final String name;
  final String email;
  final String phone;
  final ManagerKind kind;

  /// The branches this manager is on, among the ones the editor can change.
  /// A trademark manager is on all of them.
  final Set<String> branchIds;

  /// How many other branches the manager has that the editor cannot change.
  final int outsideScopeCount;

  const ManagerAssignment({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.kind,
    required this.branchIds,
    required this.outsideScopeCount,
  });

  bool get isTrademarkManager => kind == ManagerKind.trademarkManager;
}

/// One manager's new set of branches, within the editor's scope.
/// This is the unit of a save. It is applied directly now, and the same
/// list can be sent as a pending request when that flow exists.
class ManagerBranchChange {
  final String managerId;
  final Set<String> branchIds;

  const ManagerBranchChange({required this.managerId, required this.branchIds});
}
