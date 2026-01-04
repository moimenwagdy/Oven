// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_orders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecentOrdersList)
const recentOrdersListProvider = RecentOrdersListProvider._();

final class RecentOrdersListProvider
    extends $AsyncNotifierProvider<RecentOrdersList, List<OrderItem>> {
  const RecentOrdersListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentOrdersListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentOrdersListHash();

  @$internal
  @override
  RecentOrdersList create() => RecentOrdersList();
}

String _$recentOrdersListHash() => r'9aac6d4180f037e5f9debd7af827adaeea2fc63b';

abstract class _$RecentOrdersList extends $AsyncNotifier<List<OrderItem>> {
  FutureOr<List<OrderItem>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<OrderItem>>, List<OrderItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<OrderItem>>, List<OrderItem>>,
              AsyncValue<List<OrderItem>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
