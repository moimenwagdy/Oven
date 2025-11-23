// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_orders_items.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecentOrdersList)
const recentOrdersListProvider = RecentOrdersListProvider._();

final class RecentOrdersListProvider
    extends $NotifierProvider<RecentOrdersList, List<OrderItem>> {
  const RecentOrdersListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentOrdersListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentOrdersListHash();

  @$internal
  @override
  RecentOrdersList create() => RecentOrdersList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<OrderItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<OrderItem>>(value),
    );
  }
}

String _$recentOrdersListHash() => r'2021210d304a1b2fe4bbcfcb722f1ac38b7a9dc7';

abstract class _$RecentOrdersList extends $Notifier<List<OrderItem>> {
  List<OrderItem> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<OrderItem>, List<OrderItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<OrderItem>, List<OrderItem>>,
              List<OrderItem>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
