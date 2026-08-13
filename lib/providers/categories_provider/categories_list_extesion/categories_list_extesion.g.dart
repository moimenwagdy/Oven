// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_list_extesion.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GroupedSubCategories)
const groupedSubCategoriesProvider = GroupedSubCategoriesProvider._();

final class GroupedSubCategoriesProvider
    extends
        $AsyncNotifierProvider<
          GroupedSubCategories,
          Map<MainCategory, List<SubCategory>>
        > {
  const GroupedSubCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groupedSubCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groupedSubCategoriesHash();

  @$internal
  @override
  GroupedSubCategories create() => GroupedSubCategories();
}

String _$groupedSubCategoriesHash() =>
    r'ddf5c77ffded10963dc1d69764cb0ad0a22b1cb7';

abstract class _$GroupedSubCategories
    extends $AsyncNotifier<Map<MainCategory, List<SubCategory>>> {
  FutureOr<Map<MainCategory, List<SubCategory>>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<MainCategory, List<SubCategory>>>,
              Map<MainCategory, List<SubCategory>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<MainCategory, List<SubCategory>>>,
                Map<MainCategory, List<SubCategory>>
              >,
              AsyncValue<Map<MainCategory, List<SubCategory>>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
