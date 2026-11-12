// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expand_collapse_edit_manager_screen_proivder.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExpandCollapseEditManagerScreen)
const expandCollapseEditManagerScreenProvider =
    ExpandCollapseEditManagerScreenProvider._();

final class ExpandCollapseEditManagerScreenProvider
    extends $NotifierProvider<ExpandCollapseEditManagerScreen, Set<String>> {
  const ExpandCollapseEditManagerScreenProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expandCollapseEditManagerScreenProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expandCollapseEditManagerScreenHash();

  @$internal
  @override
  ExpandCollapseEditManagerScreen create() => ExpandCollapseEditManagerScreen();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$expandCollapseEditManagerScreenHash() =>
    r'80b3cb5106bf8b7c3e6a1a7a712a367739608f2a';

abstract class _$ExpandCollapseEditManagerScreen
    extends $Notifier<Set<String>> {
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
