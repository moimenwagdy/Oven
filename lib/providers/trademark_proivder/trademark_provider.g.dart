// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trademark_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Trademarks)
const trademarksProvider = TrademarksProvider._();

final class TrademarksProvider
    extends $NotifierProvider<Trademarks, List<TradeMark>> {
  const TrademarksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trademarksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trademarksHash();

  @$internal
  @override
  Trademarks create() => Trademarks();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TradeMark> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<TradeMark>>(value),
    );
  }
}

String _$trademarksHash() => r'57898fb3764e8b721713a261447ce9e833a409d8';

abstract class _$Trademarks extends $Notifier<List<TradeMark>> {
  List<TradeMark> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<TradeMark>, List<TradeMark>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<TradeMark>, List<TradeMark>>,
              List<TradeMark>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
