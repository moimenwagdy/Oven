// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'where_to_deliver_provider.dart';

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

String _$radioListHash() => r'53ae3d1d05b1cc8a96fd5d1775f3eba6fb6c1bee';

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
