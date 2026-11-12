// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_action_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Branch edits. Each method returns null on success, or an error message.

@ProviderFor(BranchActions)
const branchActionsProvider = BranchActionsProvider._();

/// Branch edits. Each method returns null on success, or an error message.
final class BranchActionsProvider
    extends $NotifierProvider<BranchActions, void> {
  /// Branch edits. Each method returns null on success, or an error message.
  const BranchActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'branchActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$branchActionsHash();

  @$internal
  @override
  BranchActions create() => BranchActions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$branchActionsHash() => r'a2d7c291d4c6d25e9a9b60a21a065f0b6be0910a';

/// Branch edits. Each method returns null on success, or an error message.

abstract class _$BranchActions extends $Notifier<void> {
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
