// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'managed_branch.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The branches ticked on one screen.
/// Null means "not touched yet": the scope's default applies.
/// Not keepAlive: leaving the screen drops its ticks.

@ProviderFor(ManagedBranchesSelection)
const managedBranchesSelectionProvider = ManagedBranchesSelectionFamily._();

/// The branches ticked on one screen.
/// Null means "not touched yet": the scope's default applies.
/// Not keepAlive: leaving the screen drops its ticks.
final class ManagedBranchesSelectionProvider
    extends $NotifierProvider<ManagedBranchesSelection, Set<String>?> {
  /// The branches ticked on one screen.
  /// Null means "not touched yet": the scope's default applies.
  /// Not keepAlive: leaving the screen drops its ticks.
  const ManagedBranchesSelectionProvider._({
    required ManagedBranchesSelectionFamily super.from,
    required BranchSelectionScope super.argument,
  }) : super(
         retry: null,
         name: r'managedBranchesSelectionProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$managedBranchesSelectionHash();

  @override
  String toString() {
    return r'managedBranchesSelectionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ManagedBranchesSelection create() => ManagedBranchesSelection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ManagedBranchesSelectionProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$managedBranchesSelectionHash() =>
    r'9f63b4b5dab98e07ebb39f4eedc98b951a50657c';

/// The branches ticked on one screen.
/// Null means "not touched yet": the scope's default applies.
/// Not keepAlive: leaving the screen drops its ticks.

final class ManagedBranchesSelectionFamily extends $Family
    with
        $ClassFamilyOverride<
          ManagedBranchesSelection,
          Set<String>?,
          Set<String>?,
          Set<String>?,
          BranchSelectionScope
        > {
  const ManagedBranchesSelectionFamily._()
    : super(
        retry: null,
        name: r'managedBranchesSelectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// The branches ticked on one screen.
  /// Null means "not touched yet": the scope's default applies.
  /// Not keepAlive: leaving the screen drops its ticks.

  ManagedBranchesSelectionProvider call(BranchSelectionScope scope) =>
      ManagedBranchesSelectionProvider._(argument: scope, from: this);

  @override
  String toString() => r'managedBranchesSelectionProvider';
}

/// The branches ticked on one screen.
/// Null means "not touched yet": the scope's default applies.
/// Not keepAlive: leaving the screen drops its ticks.

abstract class _$ManagedBranchesSelection extends $Notifier<Set<String>?> {
  late final _$args = ref.$arg as BranchSelectionScope;
  BranchSelectionScope get scope => _$args;

  Set<String>? build(BranchSelectionScope scope);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<Set<String>?, Set<String>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>?, Set<String>?>,
              Set<String>?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// The branch ids currently selected on one screen: the ticks (limited to
/// branches that are still accessible), or the scope's default if nothing
/// was touched yet.

@ProviderFor(managedBranchIds)
const managedBranchIdsProvider = ManagedBranchIdsFamily._();

/// The branch ids currently selected on one screen: the ticks (limited to
/// branches that are still accessible), or the scope's default if nothing
/// was touched yet.

final class ManagedBranchIdsProvider
    extends $FunctionalProvider<Set<String>, Set<String>, Set<String>>
    with $Provider<Set<String>> {
  /// The branch ids currently selected on one screen: the ticks (limited to
  /// branches that are still accessible), or the scope's default if nothing
  /// was touched yet.
  const ManagedBranchIdsProvider._({
    required ManagedBranchIdsFamily super.from,
    required BranchSelectionScope super.argument,
  }) : super(
         retry: null,
         name: r'managedBranchIdsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$managedBranchIdsHash();

  @override
  String toString() {
    return r'managedBranchIdsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Set<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Set<String> create(Ref ref) {
    final argument = this.argument as BranchSelectionScope;
    return managedBranchIds(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ManagedBranchIdsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$managedBranchIdsHash() => r'afc3ab9b7f1134bdd89e140ef0699e8a54303de4';

/// The branch ids currently selected on one screen: the ticks (limited to
/// branches that are still accessible), or the scope's default if nothing
/// was touched yet.

final class ManagedBranchIdsFamily extends $Family
    with $FunctionalFamilyOverride<Set<String>, BranchSelectionScope> {
  const ManagedBranchIdsFamily._()
    : super(
        retry: null,
        name: r'managedBranchIdsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The branch ids currently selected on one screen: the ticks (limited to
  /// branches that are still accessible), or the scope's default if nothing
  /// was touched yet.

  ManagedBranchIdsProvider call(BranchSelectionScope scope) =>
      ManagedBranchIdsProvider._(argument: scope, from: this);

  @override
  String toString() => r'managedBranchIdsProvider';
}

/// Branch managers of every accessible branch, fetched once. The checkboxes
/// filter this list in memory, so ticking a branch is instant.

@ProviderFor(accessibleBranchManagers)
const accessibleBranchManagersProvider = AccessibleBranchManagersProvider._();

/// Branch managers of every accessible branch, fetched once. The checkboxes
/// filter this list in memory, so ticking a branch is instant.

final class AccessibleBranchManagersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ManagerSummary>>,
          List<ManagerSummary>,
          FutureOr<List<ManagerSummary>>
        >
    with
        $FutureModifier<List<ManagerSummary>>,
        $FutureProvider<List<ManagerSummary>> {
  /// Branch managers of every accessible branch, fetched once. The checkboxes
  /// filter this list in memory, so ticking a branch is instant.
  const AccessibleBranchManagersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accessibleBranchManagersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accessibleBranchManagersHash();

  @$internal
  @override
  $FutureProviderElement<List<ManagerSummary>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ManagerSummary>> create(Ref ref) {
    return accessibleBranchManagers(ref);
  }
}

String _$accessibleBranchManagersHash() =>
    r'673da6a9576d74afc6f829f8b2a15ea8058d3f18';

/// The managers shown on one list screen: the ones listed on at least one
/// branch selected on that screen, each once.

@ProviderFor(branchManagers)
const branchManagersProvider = BranchManagersFamily._();

/// The managers shown on one list screen: the ones listed on at least one
/// branch selected on that screen, each once.

final class BranchManagersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ManagerSummary>>,
          AsyncValue<List<ManagerSummary>>,
          AsyncValue<List<ManagerSummary>>
        >
    with $Provider<AsyncValue<List<ManagerSummary>>> {
  /// The managers shown on one list screen: the ones listed on at least one
  /// branch selected on that screen, each once.
  const BranchManagersProvider._({
    required BranchManagersFamily super.from,
    required BranchSelectionScope super.argument,
  }) : super(
         retry: null,
         name: r'branchManagersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$branchManagersHash();

  @override
  String toString() {
    return r'branchManagersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AsyncValue<List<ManagerSummary>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<List<ManagerSummary>> create(Ref ref) {
    final argument = this.argument as BranchSelectionScope;
    return branchManagers(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<ManagerSummary>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<ManagerSummary>>>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BranchManagersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$branchManagersHash() => r'072763379d29ef4fe9a48f307be533e8d63f6daf';

/// The managers shown on one list screen: the ones listed on at least one
/// branch selected on that screen, each once.

final class BranchManagersFamily extends $Family
    with
        $FunctionalFamilyOverride<
          AsyncValue<List<ManagerSummary>>,
          BranchSelectionScope
        > {
  const BranchManagersFamily._()
    : super(
        retry: null,
        name: r'branchManagersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The managers shown on one list screen: the ones listed on at least one
  /// branch selected on that screen, each once.

  BranchManagersProvider call(BranchSelectionScope scope) =>
      BranchManagersProvider._(argument: scope, from: this);

  @override
  String toString() => r'branchManagersProvider';
}
