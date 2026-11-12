// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maincategory_filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MainCategoryFilter)
const mainCategoryFilterProvider = MainCategoryFilterProvider._();

final class MainCategoryFilterProvider
    extends $NotifierProvider<MainCategoryFilter, List<String>> {
  const MainCategoryFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mainCategoryFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mainCategoryFilterHash();

  @$internal
  @override
  MainCategoryFilter create() => MainCategoryFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$mainCategoryFilterHash() =>
    r'bdf024d93498b0b229566015c9182fe27a7f510e';

abstract class _$MainCategoryFilter extends $Notifier<List<String>> {
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
