// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_location_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Form for the manager's personal location. Used right after business
/// signup and later from the "add personal address" button in the delivery
/// modal: both need a signed-in manager.

@ProviderFor(ManagerLocationNotifier)
const managerLocationProvider = ManagerLocationNotifierProvider._();

/// Form for the manager's personal location. Used right after business
/// signup and later from the "add personal address" button in the delivery
/// modal: both need a signed-in manager.
final class ManagerLocationNotifierProvider
    extends
        $NotifierProvider<ManagerLocationNotifier, ManagerLocationFormState> {
  /// Form for the manager's personal location. Used right after business
  /// signup and later from the "add personal address" button in the delivery
  /// modal: both need a signed-in manager.
  const ManagerLocationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'managerLocationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$managerLocationNotifierHash();

  @$internal
  @override
  ManagerLocationNotifier create() => ManagerLocationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ManagerLocationFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ManagerLocationFormState>(value),
    );
  }
}

String _$managerLocationNotifierHash() =>
    r'cfc945a23c06b3bc769f9b38e91066b5795d2cb5';

/// Form for the manager's personal location. Used right after business
/// signup and later from the "add personal address" button in the delivery
/// modal: both need a signed-in manager.

abstract class _$ManagerLocationNotifier
    extends $Notifier<ManagerLocationFormState> {
  ManagerLocationFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<ManagerLocationFormState, ManagerLocationFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ManagerLocationFormState, ManagerLocationFormState>,
              ManagerLocationFormState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
