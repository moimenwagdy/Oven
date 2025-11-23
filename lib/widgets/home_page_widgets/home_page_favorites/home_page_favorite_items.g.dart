// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_favorite_items.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoriteItemsPro)
const favoriteItemsProProvider = FavoriteItemsProProvider._();

final class FavoriteItemsProProvider
    extends $NotifierProvider<FavoriteItemsPro, List<dynamic>> {
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<dynamic> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<dynamic>>(value),
    );
  }
}

String _$favoriteItemsProHash() => r'6c614e0b036893f791d7eebbc27f616bcd02e546';

abstract class _$FavoriteItemsPro extends $Notifier<List<dynamic>> {
  List<dynamic> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<dynamic>, List<dynamic>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<dynamic>, List<dynamic>>,
              List<dynamic>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
