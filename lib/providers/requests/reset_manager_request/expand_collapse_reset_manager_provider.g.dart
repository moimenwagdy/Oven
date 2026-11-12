// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expand_collapse_reset_manager_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExpandCollpseResetManager)
const expandCollpseResetManagerProvider = ExpandCollpseResetManagerProvider._();

final class ExpandCollpseResetManagerProvider
    extends $NotifierProvider<ExpandCollpseResetManager, Set<String>> {
  const ExpandCollpseResetManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expandCollpseResetManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expandCollpseResetManagerHash();

  @$internal
  @override
  ExpandCollpseResetManager create() => ExpandCollpseResetManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$expandCollpseResetManagerHash() =>
    r'f64635c88673d4365b1e2767bcffb09de3283af1';

abstract class _$ExpandCollpseResetManager extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
