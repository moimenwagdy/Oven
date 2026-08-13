// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_form_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SignupFormNotifier)
const signupFormProvider = SignupFormNotifierProvider._();

final class SignupFormNotifierProvider
    extends $NotifierProvider<SignupFormNotifier, SignupFormState> {
  const SignupFormNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signupFormProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signupFormNotifierHash();

  @$internal
  @override
  SignupFormNotifier create() => SignupFormNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignupFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignupFormState>(value),
    );
  }
}

String _$signupFormNotifierHash() =>
    r'6a90c85b7c6df60ed0735f0d86c4c82b79f32e34';

abstract class _$SignupFormNotifier extends $Notifier<SignupFormState> {
  SignupFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SignupFormState, SignupFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SignupFormState, SignupFormState>,
              SignupFormState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
