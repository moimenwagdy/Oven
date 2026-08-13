// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_categories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MainCategories)
const mainCategoriesProvider = MainCategoriesProvider._();

final class MainCategoriesProvider
    extends $AsyncNotifierProvider<MainCategories, List<MainCategory>> {
  const MainCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mainCategoriesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mainCategoriesHash();

  @$internal
  @override
  MainCategories create() => MainCategories();
}

String _$mainCategoriesHash() => r'c0ba717b7a996def270065cbe72c8616101f86aa';

abstract class _$MainCategories extends $AsyncNotifier<List<MainCategory>> {
  FutureOr<List<MainCategory>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<MainCategory>>, List<MainCategory>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<MainCategory>>, List<MainCategory>>,
              AsyncValue<List<MainCategory>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
