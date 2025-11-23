// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'where_to_deliver_modal.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RadioList)
const radioListProvider = RadioListProvider._();

final class RadioListProvider extends $NotifierProvider<RadioList, String> {
  const RadioListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'radioListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$radioListHash();

  @$internal
  @override
  RadioList create() => RadioList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$radioListHash() => r'e91ea26cbfc10187e0a0126f627003074024c0fb';

abstract class _$RadioList extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
