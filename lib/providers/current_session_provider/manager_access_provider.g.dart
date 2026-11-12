// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_access_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The role of the logged-in manager. Null for personal users or no session.
/// It watches only the manager id, so changing the personal location
/// does not refetch it.

@ProviderFor(managerRole)
const managerRoleProvider = ManagerRoleProvider._();

/// The role of the logged-in manager. Null for personal users or no session.
/// It watches only the manager id, so changing the personal location
/// does not refetch it.

final class ManagerRoleProvider
    extends
        $FunctionalProvider<
          AsyncValue<ManagerRole?>,
          ManagerRole?,
          FutureOr<ManagerRole?>
        >
    with $FutureModifier<ManagerRole?>, $FutureProvider<ManagerRole?> {
  /// The role of the logged-in manager. Null for personal users or no session.
  /// It watches only the manager id, so changing the personal location
  /// does not refetch it.
  const ManagerRoleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'managerRoleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$managerRoleHash();

  @$internal
  @override
  $FutureProviderElement<ManagerRole?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ManagerRole?> create(Ref ref) {
    return managerRole(ref);
  }
}

String _$managerRoleHash() => r'5521ab9c9110b4a7fd344f70139faddac0860858';

/// The branches this manager can deliver from. Empty for personal users.

@ProviderFor(accessibleBranches)
const accessibleBranchesProvider = AccessibleBranchesProvider._();

/// The branches this manager can deliver from. Empty for personal users.

final class AccessibleBranchesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Branch>>,
          List<Branch>,
          FutureOr<List<Branch>>
        >
    with $FutureModifier<List<Branch>>, $FutureProvider<List<Branch>> {
  /// The branches this manager can deliver from. Empty for personal users.
  const AccessibleBranchesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accessibleBranchesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accessibleBranchesHash();

  @$internal
  @override
  $FutureProviderElement<List<Branch>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Branch>> create(Ref ref) {
    return accessibleBranches(ref);
  }
}

String _$accessibleBranchesHash() =>
    r'81d0b3b7943a6edff509767c6ff1241fdd8f2228';

/// The trademark of the logged-in manager. Null for personal users and
/// managers with no access.

@ProviderFor(currentTrademark)
const currentTrademarkProvider = CurrentTrademarkProvider._();

/// The trademark of the logged-in manager. Null for personal users and
/// managers with no access.

final class CurrentTrademarkProvider
    extends
        $FunctionalProvider<
          AsyncValue<TradeMark?>,
          TradeMark?,
          FutureOr<TradeMark?>
        >
    with $FutureModifier<TradeMark?>, $FutureProvider<TradeMark?> {
  /// The trademark of the logged-in manager. Null for personal users and
  /// managers with no access.
  const CurrentTrademarkProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentTrademarkProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentTrademarkHash();

  @$internal
  @override
  $FutureProviderElement<TradeMark?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<TradeMark?> create(Ref ref) {
    return currentTrademark(ref);
  }
}

String _$currentTrademarkHash() => r'637d8f5c421897725e4b7d5a1cd357da97155849';

/// Report access belongs to the trademark admin only. Screens check this
/// and never compare ids themselves.

@ProviderFor(canViewReports)
const canViewReportsProvider = CanViewReportsProvider._();

/// Report access belongs to the trademark admin only. Screens check this
/// and never compare ids themselves.

final class CanViewReportsProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Report access belongs to the trademark admin only. Screens check this
  /// and never compare ids themselves.
  const CanViewReportsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'canViewReportsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$canViewReportsHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return canViewReports(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$canViewReportsHash() => r'14fbb314910fc78f28723b527dd999eb2da8e8b0';

/// Branch managers of every branch of the logged-in manager's trademark.
/// Empty for personal users and managers with no access.

@ProviderFor(trademarkBranchManagers)
const trademarkBranchManagersProvider = TrademarkBranchManagersProvider._();

/// Branch managers of every branch of the logged-in manager's trademark.
/// Empty for personal users and managers with no access.

final class TrademarkBranchManagersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ManagerSummary>>,
          List<ManagerSummary>,
          FutureOr<List<ManagerSummary>>
        >
    with
        $FutureModifier<List<ManagerSummary>>,
        $FutureProvider<List<ManagerSummary>> {
  /// Branch managers of every branch of the logged-in manager's trademark.
  /// Empty for personal users and managers with no access.
  const TrademarkBranchManagersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trademarkBranchManagersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trademarkBranchManagersHash();

  @$internal
  @override
  $FutureProviderElement<List<ManagerSummary>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ManagerSummary>> create(Ref ref) {
    return trademarkBranchManagers(ref);
  }
}

String _$trademarkBranchManagersHash() =>
    r'ec4a044d8d9010ea92d912c00adbab99e9607bd5';
