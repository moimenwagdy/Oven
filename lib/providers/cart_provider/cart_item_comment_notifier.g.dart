// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_comment_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CartItemButtonsState)
const cartItemButtonsStateProvider = CartItemButtonsStateProvider._();

final class CartItemButtonsStateProvider
    extends $NotifierProvider<CartItemButtonsState, bool> {
  const CartItemButtonsStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartItemButtonsStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartItemButtonsStateHash();

  @$internal
  @override
  CartItemButtonsState create() => CartItemButtonsState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$cartItemButtonsStateHash() =>
    r'24c6a178fb08336ed97649bf9205723cbcc2b4e5';

abstract class _$CartItemButtonsState extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
