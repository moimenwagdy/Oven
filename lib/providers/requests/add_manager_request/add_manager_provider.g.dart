// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_manager_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddManagerGeneratedLinks)
const addManagerGeneratedLinksProvider = AddManagerGeneratedLinksProvider._();

final class AddManagerGeneratedLinksProvider
    extends $NotifierProvider<AddManagerGeneratedLinks, List<String>> {
  const AddManagerGeneratedLinksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addManagerGeneratedLinksProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addManagerGeneratedLinksHash();

  @$internal
  @override
  AddManagerGeneratedLinks create() => AddManagerGeneratedLinks();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$addManagerGeneratedLinksHash() =>
    r'67a72fd03a259c10c09ceb9b07e5939528a37efe';

abstract class _$AddManagerGeneratedLinks extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
