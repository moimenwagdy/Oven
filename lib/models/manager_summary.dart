class ManagerSummary {
  final String id;
  final String name;
  final String email;
  final String phone;

  /// Branches this manager is listed on. Filled by the queries that need it
  /// (the reset and delete lists), empty elsewhere.
  final List<String> branchIds;

  const ManagerSummary({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.branchIds = const [],
  });
}
