// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_order_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrdersFilter)
const ordersFilterProvider = OrdersFilterProvider._();

final class OrdersFilterProvider
    extends $NotifierProvider<OrdersFilter, String?> {
  const OrdersFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordersFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ordersFilterHash();

  @$internal
  @override
  OrdersFilter create() => OrdersFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$ordersFilterHash() => r'2a47bf204e33b3917d7beea813d447ad5d02a485';

abstract class _$OrdersFilter extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
