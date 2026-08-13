// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_person_request_link_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GenerateOtherPersonLink)
const generateOtherPersonLinkProvider = GenerateOtherPersonLinkProvider._();

final class GenerateOtherPersonLinkProvider
    extends $NotifierProvider<GenerateOtherPersonLink, AsyncValue<String?>> {
  const GenerateOtherPersonLinkProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'generateOtherPersonLinkProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$generateOtherPersonLinkHash();

  @$internal
  @override
  GenerateOtherPersonLink create() => GenerateOtherPersonLink();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<String?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<String?>>(value),
    );
  }
}

String _$generateOtherPersonLinkHash() =>
    r'b1b4e3dca8aba04e6fedbb5cc55354216365f36b';

abstract class _$GenerateOtherPersonLink
    extends $Notifier<AsyncValue<String?>> {
  AsyncValue<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<String?>, AsyncValue<String?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, AsyncValue<String?>>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
