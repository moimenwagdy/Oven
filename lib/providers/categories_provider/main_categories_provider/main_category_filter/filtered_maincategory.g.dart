// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_maincategory.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(filteredGroupedSubCategories)
const filteredGroupedSubCategoriesProvider =
    FilteredGroupedSubCategoriesProvider._();

final class FilteredGroupedSubCategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<MainCategory, List<SubCategory>>>,
          Map<MainCategory, List<SubCategory>>,
          FutureOr<Map<MainCategory, List<SubCategory>>>
        >
    with
        $FutureModifier<Map<MainCategory, List<SubCategory>>>,
        $FutureProvider<Map<MainCategory, List<SubCategory>>> {
  const FilteredGroupedSubCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredGroupedSubCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredGroupedSubCategoriesHash();

  @$internal
  @override
  $FutureProviderElement<Map<MainCategory, List<SubCategory>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<MainCategory, List<SubCategory>>> create(Ref ref) {
    return filteredGroupedSubCategories(ref);
  }
}

String _$filteredGroupedSubCategoriesHash() =>
    r'6507d30f31601a61628e20c53f2fc999e0eba16c';
