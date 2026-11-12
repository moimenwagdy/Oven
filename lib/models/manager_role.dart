/// What a logged-in manager is allowed to access. Exactly one applies.
/// Precedence: admin, then trademark manager, then branch manager.
sealed class ManagerRole {
  const ManagerRole();
}

/// Trademark admin: all branches, plus report access.
class TrademarkAdminRole extends ManagerRole {
  final String trademarkId;
  const TrademarkAdminRole(this.trademarkId);
}

/// Trademark manager: all branches of the trademark.
class TrademarkManagerRole extends ManagerRole {
  final String trademarkId;
  const TrademarkManagerRole(this.trademarkId);
}

/// Branch manager: one or more branches of the same trademark.
class BranchManagerRole extends ManagerRole {
  final String trademarkId;
  final List<String> branchIds;
  const BranchManagerRole({required this.trademarkId, required this.branchIds});
}

/// A manager who is listed nowhere (e.g. removed from their last branch).
class NoAccessRole extends ManagerRole {
  const NoAccessRole();
}
