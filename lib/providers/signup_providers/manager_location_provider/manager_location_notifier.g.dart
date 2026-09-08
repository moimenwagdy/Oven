// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_location_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ManagerLocationNotifier)
const managerLocationProvider = ManagerLocationNotifierProvider._();

final class ManagerLocationNotifierProvider
    extends
        $NotifierProvider<ManagerLocationNotifier, ManagerLocationFormState> {
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
    r'f14989962529ef0da24495b70563d836afde95ca';

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
