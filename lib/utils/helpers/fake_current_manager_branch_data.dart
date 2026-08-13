class FakeCurrentManagerBranchData {
  const FakeCurrentManagerBranchData({
    required this.currentManagerId,
    required this.currentBranchId,
    required this.currentTrademarkId,
  });
  final String currentManagerId;
  final String currentBranchId;
  final String currentTrademarkId;
}

final FakeCurrentManagerBranchData currentFakeData =
    FakeCurrentManagerBranchData(
      currentManagerId: "MG003",
      currentBranchId: "BR005",
      currentTrademarkId: "TM001",
    );
