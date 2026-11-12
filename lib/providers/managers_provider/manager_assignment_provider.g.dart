// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_assignment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The managers the user can change, with their branches. Fetched once; the
/// branch picker filters it in memory.

@ProviderFor(assignableManagers)
const assignableManagersProvider = AssignableManagersProvider._();

/// The managers the user can change, with their branches. Fetched once; the
/// branch picker filters it in memory.

final class AssignableManagersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ManagerAssignment>>,
          List<ManagerAssignment>,
          FutureOr<List<ManagerAssignment>>
        >
    with
        $FutureModifier<List<ManagerAssignment>>,
        $FutureProvider<List<ManagerAssignment>> {
  /// The managers the user can change, with their branches. Fetched once; the
  /// branch picker filters it in memory.
  const AssignableManagersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'assignableManagersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$assignableManagersHash();

  @$internal
  @override
  $FutureProviderElement<List<ManagerAssignment>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ManagerAssignment>> create(Ref ref) {
    return assignableManagers(ref);
  }
}

String _$assignableManagersHash() =>
    r'adf42ac5e23c27e19985d555b638b5b00bbb4961';

/// The managers on screen: the ones on at least one branch ticked in the
/// picker (a trademark manager is on all of them).

@ProviderFor(visibleAssignableManagers)
const visibleAssignableManagersProvider = VisibleAssignableManagersProvider._();

/// The managers on screen: the ones on at least one branch ticked in the
/// picker (a trademark manager is on all of them).

final class VisibleAssignableManagersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ManagerAssignment>>,
          AsyncValue<List<ManagerAssignment>>,
          AsyncValue<List<ManagerAssignment>>
        >
    with $Provider<AsyncValue<List<ManagerAssignment>>> {
  /// The managers on screen: the ones on at least one branch ticked in the
  /// picker (a trademark manager is on all of them).
  const VisibleAssignableManagersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'visibleAssignableManagersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$visibleAssignableManagersHash();

  @$internal
  @override
  $ProviderElement<AsyncValue<List<ManagerAssignment>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<List<ManagerAssignment>> create(Ref ref) {
    return visibleAssignableManagers(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<ManagerAssignment>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<ManagerAssignment>>>(
        value,
      ),
    );
  }
}

String _$visibleAssignableManagersHash() =>
    r'2c7952e0798dd5885dd667ca63fbfd18ecad2d2d';

/// The edited rows that are waiting for Save: manager id -> ticked branches.
/// A row that is edited back to its original state is removed.
/// Not keepAlive: leaving the screen drops the unsaved edits.

@ProviderFor(ManagerAssignmentEdits)
const managerAssignmentEditsProvider = ManagerAssignmentEditsProvider._();

/// The edited rows that are waiting for Save: manager id -> ticked branches.
/// A row that is edited back to its original state is removed.
/// Not keepAlive: leaving the screen drops the unsaved edits.
final class ManagerAssignmentEditsProvider
    extends
        $NotifierProvider<ManagerAssignmentEdits, Map<String, Set<String>>> {
  /// The edited rows that are waiting for Save: manager id -> ticked branches.
  /// A row that is edited back to its original state is removed.
  /// Not keepAlive: leaving the screen drops the unsaved edits.
  const ManagerAssignmentEditsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'managerAssignmentEditsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$managerAssignmentEditsHash();

  @$internal
  @override
  ManagerAssignmentEdits create() => ManagerAssignmentEdits();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, Set<String>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, Set<String>>>(value),
    );
  }
}

String _$managerAssignmentEditsHash() =>
    r'83383bfece1f203bdbbcbf733ae968d8aae55a4d';

/// The edited rows that are waiting for Save: manager id -> ticked branches.
/// A row that is edited back to its original state is removed.
/// Not keepAlive: leaving the screen drops the unsaved edits.

abstract class _$ManagerAssignmentEdits
    extends $Notifier<Map<String, Set<String>>> {
  Map<String, Set<String>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<Map<String, Set<String>>, Map<String, Set<String>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, Set<String>>, Map<String, Set<String>>>,
              Map<String, Set<String>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// The branches ticked on one row: the edit if there is one, otherwise the
/// saved branches.

@ProviderFor(tickedBranchIds)
const tickedBranchIdsProvider = TickedBranchIdsFamily._();

/// The branches ticked on one row: the edit if there is one, otherwise the
/// saved branches.

final class TickedBranchIdsProvider
    extends $FunctionalProvider<Set<String>, Set<String>, Set<String>>
    with $Provider<Set<String>> {
  /// The branches ticked on one row: the edit if there is one, otherwise the
  /// saved branches.
  const TickedBranchIdsProvider._({
    required TickedBranchIdsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'tickedBranchIdsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tickedBranchIdsHash();

  @override
  String toString() {
    return r'tickedBranchIdsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Set<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Set<String> create(Ref ref) {
    final argument = this.argument as String;
    return tickedBranchIds(ref, argument);
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
    return other is TickedBranchIdsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tickedBranchIdsHash() => r'56b8db1d0a9d3a95964d0485c35cca4ada86f6b6';

/// The branches ticked on one row: the edit if there is one, otherwise the
/// saved branches.

final class TickedBranchIdsFamily extends $Family
    with $FunctionalFamilyOverride<Set<String>, String> {
  const TickedBranchIdsFamily._()
    : super(
        retry: null,
        name: r'tickedBranchIdsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The branches ticked on one row: the edit if there is one, otherwise the
  /// saved branches.

  TickedBranchIdsProvider call(String managerId) =>
      TickedBranchIdsProvider._(argument: managerId, from: this);

  @override
  String toString() => r'tickedBranchIdsProvider';
}

@ProviderFor(ManagerAssignmentActions)
const managerAssignmentActionsProvider = ManagerAssignmentActionsProvider._();

final class ManagerAssignmentActionsProvider
    extends $NotifierProvider<ManagerAssignmentActions, void> {
  const ManagerAssignmentActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'managerAssignmentActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$managerAssignmentActionsHash();

  @$internal
  @override
  ManagerAssignmentActions create() => ManagerAssignmentActions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$managerAssignmentActionsHash() =>
    r'6641626879580ca39bfb7df7cd141932ece339fa';

abstract class _$ManagerAssignmentActions extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
