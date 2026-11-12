// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_categories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CategoriesNotifier)
const categoriesProvider = CategoriesNotifierProvider._();

final class CategoriesNotifierProvider
    extends $AsyncNotifierProvider<CategoriesNotifier, List<SubCategory>> {
  const CategoriesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoriesNotifierHash();

  @$internal
  @override
  CategoriesNotifier create() => CategoriesNotifier();
}

String _$categoriesNotifierHash() =>
    r'e946d9db44169954577c4f236dc2d70681bb8cd9';

abstract class _$CategoriesNotifier extends $AsyncNotifier<List<SubCategory>> {
  FutureOr<List<SubCategory>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<SubCategory>>, List<SubCategory>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<SubCategory>>, List<SubCategory>>,
              AsyncValue<List<SubCategory>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
