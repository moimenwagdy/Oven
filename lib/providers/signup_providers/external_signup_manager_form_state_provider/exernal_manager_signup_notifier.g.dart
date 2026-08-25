// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exernal_manager_signup_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExternalManagerSignupNotifier)
const externalManagerSignupProvider = ExternalManagerSignupNotifierProvider._();

final class ExternalManagerSignupNotifierProvider
    extends
        $NotifierProvider<
          ExternalManagerSignupNotifier,
          ExternalManagerSignupState
        > {
  const ExternalManagerSignupNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'externalManagerSignupProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$externalManagerSignupNotifierHash();

  @$internal
  @override
  ExternalManagerSignupNotifier create() => ExternalManagerSignupNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExternalManagerSignupState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExternalManagerSignupState>(value),
    );
  }
}

String _$externalManagerSignupNotifierHash() =>
    r'9069a88b5f7b22e06546342f563036c74ae5c5dd';

abstract class _$ExternalManagerSignupNotifier
    extends $Notifier<ExternalManagerSignupState> {
  ExternalManagerSignupState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<ExternalManagerSignupState, ExternalManagerSignupState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ExternalManagerSignupState,
                ExternalManagerSignupState
              >,
              ExternalManagerSignupState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
