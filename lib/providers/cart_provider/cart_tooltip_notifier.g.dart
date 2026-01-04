// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_tooltip_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CartTooltipNotifier)
const cartTooltipProvider = CartTooltipNotifierProvider._();

final class CartTooltipNotifierProvider
    extends $NotifierProvider<CartTooltipNotifier, bool> {
  const CartTooltipNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartTooltipProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartTooltipNotifierHash();

  @$internal
  @override
  CartTooltipNotifier create() => CartTooltipNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$cartTooltipNotifierHash() =>
    r'428156fbf849e5b6361498aca0a019079f975c2f';

abstract class _$CartTooltipNotifier extends $Notifier<bool> {
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
