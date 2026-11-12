// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'where_to_deliver_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The delivery address id the user picked, or null for "use the default".
/// Stored as a stable id, never as formatted text. It is validated against
/// the current options in `effectiveDeliveryOptionProvider`.

@ProviderFor(RadioList)
const radioListProvider = RadioListProvider._();

/// The delivery address id the user picked, or null for "use the default".
/// Stored as a stable id, never as formatted text. It is validated against
/// the current options in `effectiveDeliveryOptionProvider`.
final class RadioListProvider extends $NotifierProvider<RadioList, String?> {
  /// The delivery address id the user picked, or null for "use the default".
  /// Stored as a stable id, never as formatted text. It is validated against
  /// the current options in `effectiveDeliveryOptionProvider`.
  const RadioListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'radioListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$radioListHash();

  @$internal
  @override
  RadioList create() => RadioList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$radioListHash() => r'04393d048be9307d2ba167747903436e58dadc6b';

/// The delivery address id the user picked, or null for "use the default".
/// Stored as a stable id, never as formatted text. It is validated against
/// the current options in `effectiveDeliveryOptionProvider`.

abstract class _$RadioList extends $Notifier<String?> {
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
