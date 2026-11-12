// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_options_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Every address the current user can deliver to.
/// - No session: empty.
/// - Personal user: their own address ('personal').
/// - Manager: the accessible branches ('branch:<id>', main branch first),
///   then the manager's personal location ('owner') if it was set.
/// A manager sees loading/error until the branches arrive.

@ProviderFor(deliveryOptions)
const deliveryOptionsProvider = DeliveryOptionsProvider._();

/// Every address the current user can deliver to.
/// - No session: empty.
/// - Personal user: their own address ('personal').
/// - Manager: the accessible branches ('branch:<id>', main branch first),
///   then the manager's personal location ('owner') if it was set.
/// A manager sees loading/error until the branches arrive.

final class DeliveryOptionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DeliveryAddressOption>>,
          AsyncValue<List<DeliveryAddressOption>>,
          AsyncValue<List<DeliveryAddressOption>>
        >
    with $Provider<AsyncValue<List<DeliveryAddressOption>>> {
  /// Every address the current user can deliver to.
  /// - No session: empty.
  /// - Personal user: their own address ('personal').
  /// - Manager: the accessible branches ('branch:<id>', main branch first),
  ///   then the manager's personal location ('owner') if it was set.
  /// A manager sees loading/error until the branches arrive.
  const DeliveryOptionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deliveryOptionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deliveryOptionsHash();

  @$internal
  @override
  $ProviderElement<AsyncValue<List<DeliveryAddressOption>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<List<DeliveryAddressOption>> create(Ref ref) {
    return deliveryOptions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<DeliveryAddressOption>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<AsyncValue<List<DeliveryAddressOption>>>(value),
    );
  }
}

String _$deliveryOptionsHash() => r'859cc4d99e978d857126c9cf70be5dc4ad54c186';

/// The option in effect: the user's pick if it still exists, otherwise
/// the first option. Null when there is nothing to pick yet.
/// This replaces the `effectiveId` logic that was duplicated in the widget.

@ProviderFor(effectiveDeliveryOption)
const effectiveDeliveryOptionProvider = EffectiveDeliveryOptionProvider._();

/// The option in effect: the user's pick if it still exists, otherwise
/// the first option. Null when there is nothing to pick yet.
/// This replaces the `effectiveId` logic that was duplicated in the widget.

final class EffectiveDeliveryOptionProvider
    extends
        $FunctionalProvider<
          DeliveryAddressOption?,
          DeliveryAddressOption?,
          DeliveryAddressOption?
        >
    with $Provider<DeliveryAddressOption?> {
  /// The option in effect: the user's pick if it still exists, otherwise
  /// the first option. Null when there is nothing to pick yet.
  /// This replaces the `effectiveId` logic that was duplicated in the widget.
  const EffectiveDeliveryOptionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'effectiveDeliveryOptionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$effectiveDeliveryOptionHash();

  @$internal
  @override
  $ProviderElement<DeliveryAddressOption?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeliveryAddressOption? create(Ref ref) {
    return effectiveDeliveryOption(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeliveryAddressOption? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeliveryAddressOption?>(value),
    );
  }
}

String _$effectiveDeliveryOptionHash() =>
    r'00808664dfd333251706f2fb664688e0faee51f0';
