// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_items_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoriteItemsPro)
const favoriteItemsProProvider = FavoriteItemsProProvider._();

final class FavoriteItemsProProvider
    extends $AsyncNotifierProvider<FavoriteItemsPro, List<String>> {
  const FavoriteItemsProProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteItemsProProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteItemsProHash();

  @$internal
  @override
  FavoriteItemsPro create() => FavoriteItemsPro();
}

String _$favoriteItemsProHash() => r'f13735ba1af652f00023324cc6a3ad44b92659d1';

abstract class _$FavoriteItemsPro extends $AsyncNotifier<List<String>> {
  FutureOr<List<String>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<String>>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<String>>, List<String>>,
              AsyncValue<List<String>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
