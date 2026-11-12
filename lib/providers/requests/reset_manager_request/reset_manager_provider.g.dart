// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_manager_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// managerId -> generated reset link

@ProviderFor(ResetManagers)
const resetManagersProvider = ResetManagersProvider._();

/// managerId -> generated reset link
final class ResetManagersProvider
    extends $NotifierProvider<ResetManagers, Map<String, String>> {
  /// managerId -> generated reset link
  const ResetManagersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resetManagersProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resetManagersHash();

  @$internal
  @override
  ResetManagers create() => ResetManagers();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, String>>(value),
    );
  }
}

String _$resetManagersHash() => r'1ff223af4840f376f17a5232589b835821986797';

/// managerId -> generated reset link

abstract class _$ResetManagers extends $Notifier<Map<String, String>> {
  Map<String, String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Map<String, String>, Map<String, String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, String>, Map<String, String>>,
              Map<String, String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
