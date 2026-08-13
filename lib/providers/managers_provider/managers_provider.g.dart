// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'managers_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ManagersList)
const managersListProvider = ManagersListProvider._();

final class ManagersListProvider
    extends $NotifierProvider<ManagersList, List<Manager>> {
  const ManagersListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'managersListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$managersListHash();

  @$internal
  @override
  ManagersList create() => ManagersList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Manager> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Manager>>(value),
    );
  }
}

String _$managersListHash() => r'dafe923054f3d1c5666e51279d73471442cddbb3';

abstract class _$ManagersList extends $Notifier<List<Manager>> {
  List<Manager> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Manager>, List<Manager>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Manager>, List<Manager>>,
              List<Manager>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
