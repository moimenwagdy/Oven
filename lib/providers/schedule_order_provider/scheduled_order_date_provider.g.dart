// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_order_date_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ScheduledOrderDate)
const scheduledOrderDateProvider = ScheduledOrderDateProvider._();

final class ScheduledOrderDateProvider
    extends $NotifierProvider<ScheduledOrderDate, DateTime?> {
  const ScheduledOrderDateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scheduledOrderDateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scheduledOrderDateHash();

  @$internal
  @override
  ScheduledOrderDate create() => ScheduledOrderDate();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime?>(value),
    );
  }
}

String _$scheduledOrderDateHash() =>
    r'58a42dc1172622f53ee37e82514f6a4a953809ea';

abstract class _$ScheduledOrderDate extends $Notifier<DateTime?> {
  DateTime? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<DateTime?, DateTime?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DateTime?, DateTime?>,
              DateTime?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
