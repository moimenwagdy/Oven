// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// keepAlive on purpose: the login screen is usually replaced as soon as
/// the session is set, and an auto-disposed notifier would then throw when
/// the request finishes and the state is updated.

@ProviderFor(SignIn)
const signInProvider = SignInProvider._();

/// keepAlive on purpose: the login screen is usually replaced as soon as
/// the session is set, and an auto-disposed notifier would then throw when
/// the request finishes and the state is updated.
final class SignInProvider extends $NotifierProvider<SignIn, SignInState> {
  /// keepAlive on purpose: the login screen is usually replaced as soon as
  /// the session is set, and an auto-disposed notifier would then throw when
  /// the request finishes and the state is updated.
  const SignInProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signInProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signInHash();

  @$internal
  @override
  SignIn create() => SignIn();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignInState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignInState>(value),
    );
  }
}

String _$signInHash() => r'd2ef73ff5a6b6e6598a9d7e0ae6dd7f5d2151746';

/// keepAlive on purpose: the login screen is usually replaced as soon as
/// the session is set, and an auto-disposed notifier would then throw when
/// the request finishes and the state is updated.

abstract class _$SignIn extends $Notifier<SignInState> {
  SignInState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SignInState, SignInState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SignInState, SignInState>,
              SignInState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
