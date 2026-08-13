// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myself_request_link_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubmitMyselfForm)
const submitMyselfFormProvider = SubmitMyselfFormProvider._();

final class SubmitMyselfFormProvider
    extends $NotifierProvider<SubmitMyselfForm, AsyncValue<SubmitState>> {
  const SubmitMyselfFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'submitMyselfFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$submitMyselfFormHash();

  @$internal
  @override
  SubmitMyselfForm create() => SubmitMyselfForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<SubmitState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<SubmitState>>(value),
    );
  }
}

String _$submitMyselfFormHash() => r'f3bc9fbdc7569936d7f5249dd929f4186dc212fc';

abstract class _$SubmitMyselfForm extends $Notifier<AsyncValue<SubmitState>> {
  AsyncValue<SubmitState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<SubmitState>, AsyncValue<SubmitState>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SubmitState>, AsyncValue<SubmitState>>,
              AsyncValue<SubmitState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
